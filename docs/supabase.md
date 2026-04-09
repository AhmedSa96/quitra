Below is a **production-ready Supabase setup** tailored to your app (Flutter +
offline-first + optional auth). I’ve made deliberate choices around **RLS,
anonymous users, and future scalability**.

---

# 🗄️ 1. `schema.sql` (Supabase Database)

This includes:

- Tables
- Indexes
- RLS policies
- Helper functions

---

```sql
-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- =========================
-- USERS (extends auth.users)
-- =========================
create table public.users (
    id uuid primary key references auth.users(id) on delete cascade,
    created_at timestamp with time zone default now(),
    is_anonymous boolean default true,
    subscription_status text default 'free'
);

-- =========================
-- PROFILES
-- =========================
create table public.profiles (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid references public.users(id) on delete cascade,
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
    user_id uuid references public.users(id) on delete cascade,
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
    user_id uuid references public.users(id) on delete cascade,
    created_at timestamp with time zone default now()
);

-- =========================
-- USER STATS CACHE
-- =========================
create table public.user_stats (
    user_id uuid primary key references public.users(id) on delete cascade,
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
-- AUTO CREATE USER ROW
-- =========================
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.users (id)
  values (new.id);
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();

-- =========================
-- RLS ENABLE
-- =========================
alter table public.users enable row level security;
alter table public.profiles enable row level security;
alter table public.daily_logs enable row level security;
alter table public.craving_events enable row level security;
alter table public.user_stats enable row level security;

-- =========================
-- RLS POLICIES
-- =========================

-- USERS
create policy "Users can view own data"
on public.users
for select
using (auth.uid() = id);

create policy "Users can update own data"
on public.users
for update
using (auth.uid() = id);

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

    select cigarettes_per_day / cigarettes_per_pack::numeric * price_per_pack
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
```

---

# ⚙️ 2. `config.toml` (Supabase Local Dev)

This config is optimized for:

- Flutter development
- Auth + RLS testing
- Edge functions (future)

---

```toml
project_id = "smoke-quit-app"

[api]
enabled = true
port = 54321
schemas = ["public", "auth", "storage"]
extra_search_path = ["public"]

[db]
port = 54322
major_version = 15

[studio]
enabled = true
port = 54323

[inbucket]
enabled = true
port = 54324

[auth]
enabled = true
site_url = "http://localhost:3000"
additional_redirect_urls = ["http://localhost:3000"]

jwt_expiry = 3600
enable_signup = true

[auth.email]
enable_signup = false
double_confirm_changes = false

[auth.external.apple]
enabled = true

[auth.external.google]
enabled = true

[storage]
enabled = true

[realtime]
enabled = true

[edge_functions]
enabled = true

[analytics]
enabled = false
```

---

# 🧠 Important Implementation Notes

---

## 1. Anonymous-first Auth Strategy

In Flutter:

- Use:

  ```dart
  supabase.auth.signInAnonymously();
  ```

- Later allow upgrade:

  - Google / Apple login
  - Link account (important!)

---

## 2. Offline-first (critical for your app)

Use:

- Hive / Drift locally
- Sync to Supabase when online

👉 Do NOT depend on Supabase for real-time UX.

---

## 3. When to call `update_user_stats`

Trigger it:

- after daily log insert/update

In Flutter OR via Edge Function.

---

## 4. Subscription Handling

Do NOT store logic only in DB.

Use:

- RevenueCat (recommended)
- Sync status → `users.subscription_status`

---

## 5. Security Note (important)

RLS is strict:

- Users ONLY see their data
- Safe for production

---

# 🚀 Next Step

If you want to go deeper, I can:

- Generate **Flutter models (Freezed + Retrofit)**
- Build **Repository layer**
- Design **offline sync engine**
- Or create **complete Bloc architecture**

Tell me what layer you want next.
