-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- =========================
-- PROFILES
-- =========================
create table public.profiles (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references auth.users(id) on delete cascade,
    cigarettes_per_day integer not null,
    years_smoking integer not null,
    quit_method text check (quit_method in ('cold_turkey', 'gradual')),
    quit_start_date date not null,
    price_per_pack numeric default 0,
    cigarettes_per_pack integer default 20,
    created_at timestamp with time zone default now()
);

-- =========================
-- DAILY LOGS
-- =========================
create table public.daily_logs (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references auth.users(id) on delete cascade,
    date date not null,
    smoked boolean default false,
    cravings_level integer check (cravings_level between 1 and 5),
    notes text,
    created_at timestamp with time zone default now(),
    unique(user_id, date)
);

-- =========================
-- CRAVING EVENTS
-- =========================
create table public.craving_events (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references auth.users(id) on delete cascade,
    created_at timestamp with time zone default now()
);

-- =========================
-- USER STATS CACHE
-- =========================
create table public.user_stats (
    user_id uuid primary key references auth.users(id) on delete cascade,
    days_smoke_free integer default 0,
    cigarettes_avoided integer default 0,
    money_saved numeric default 0,
    updated_at timestamp with time zone default now()
);

-- =========================
-- INDEXES (performance)
-- =========================
create index idx_daily_logs_user_id on public.daily_logs(user_id);
create index idx_daily_logs_date on public.daily_logs(date);
create index idx_craving_events_user_id on public.craving_events(user_id);

-- =========================
-- RLS ENABLE
-- =========================
alter table public.profiles enable row level security;
alter table public.daily_logs enable row level security;
alter table public.craving_events enable row level security;
alter table public.user_stats enable row level security;

-- =========================
-- RLS POLICIES
-- =========================

-- PROFILES
create policy "Profiles access"
on public.profiles
for all
using (auth.uid() = user_id);

-- DAILY LOGS
create policy "Daily logs access"
on public.daily_logs
for all
using (auth.uid() = user_id);

-- CRAVING EVENTS
create policy "Craving events access"
on public.craving_events
for all
using (auth.uid() = user_id);

-- USER STATS
create policy "User stats access"
on public.user_stats
for all
using (auth.uid() = user_id);

-- =========================
-- HELPER FUNCTION: UPDATE STATS
-- =========================
create or replace function public.update_user_stats(p_user_id uuid)
returns void as $$
declare
    total_days integer;
    total_cigs integer;
    total_saved numeric;
    price_per_cig numeric;
begin
    select count(*) into total_days
    from public.daily_logs
    where user_id = p_user_id and smoked = false;

    select (cigarettes_per_day / cigarettes_per_pack::numeric * price_per_pack)
    into price_per_cig
    from public.profiles
    where user_id = p_user_id;

    total_cigs := total_days * (
        select cigarettes_per_day from public.profiles where user_id = p_user_id
    );

    total_saved := total_cigs * coalesce(price_per_cig, 0);

    insert into public.user_stats (user_id, days_smoke_free, cigarettes_avoided, money_saved)
    values (p_user_id, total_days, total_cigs, total_saved)
    on conflict (user_id)
    do update set
        days_smoke_free = excluded.days_smoke_free,
        cigarettes_avoided = excluded.cigarettes_avoided,
        money_saved = excluded.money_saved,
        updated_at = now();
end;
$$ language plpgsql;
