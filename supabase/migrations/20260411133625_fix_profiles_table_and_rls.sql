-- Fix profiles table RLS and structure issues
-- The app code uses 'id' to store the user's UUID, but the RLS policy was previously checking 'user_id', which was not being set by the app.

-- 1. Synchronize data if any exists (failsafe)
UPDATE public.profiles SET id = user_id WHERE user_id IS NOT NULL AND (id IS NULL OR id != user_id);

-- 2. Fix the RLS Policy to use 'id' as the primary identifier
-- This resolves the "new row violates row-level security policy" error during onboarding upsert.
DROP POLICY IF EXISTS "Profiles access" ON public.profiles;

-- Remove redundant user_id column and ensure id references auth.users
ALTER TABLE public.profiles DROP COLUMN IF EXISTS user_id;
ALTER TABLE public.profiles ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;

CREATE POLICY "Profiles access"
ON public.profiles
FOR ALL
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- 3. Update the helper function to use 'id' for profile-based calculations
-- This ensures 'update_user_stats' continues to work with the updated profiles logic.
CREATE OR REPLACE FUNCTION public.update_user_stats(p_user_id uuid)
RETURNS void AS $$
DECLARE
    total_days integer;
    total_cigs integer;
    total_saved numeric;
    price_per_cig numeric;
BEGIN
    -- Get count of days marked as not smoked
    SELECT count(*) INTO total_days
    FROM public.daily_logs
    WHERE user_id = p_user_id AND smoked = false;

    -- Fetch profile data using 'id' as the link to auth.users
    SELECT (cigarettes_per_day / cigarettes_per_pack::numeric * price_per_pack)
    INTO price_per_cig
    FROM public.profiles
    WHERE id = p_user_id;

    -- Calculate cigarettes avoided based on profile settings
    total_cigs := total_days * (
        SELECT cigarettes_per_day FROM public.profiles WHERE id = p_user_id
    );

    total_saved := total_cigs * coalesce(price_per_cig, 0);

    -- Upsert the calculated stats into user_stats table
    INSERT INTO public.user_stats (user_id, days_smoke_free, cigarettes_avoided, money_saved)
    VALUES (p_user_id, total_days, total_cigs, total_saved)
    ON CONFLICT (user_id)
    DO UPDATE SET
        days_smoke_free = excluded.days_smoke_free,
        cigarettes_avoided = excluded.cigarettes_avoided,
        money_saved = excluded.money_saved,
        updated_at = now();
END;
$$ LANGUAGE plpgsql;
