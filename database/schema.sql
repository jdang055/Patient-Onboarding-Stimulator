-- Optional: only if needed for gen_random_uuid()
-- create extension if not exists pgcrypto;

CREATE TABLE IF NOT EXISTS public.workflow_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_id uuid NOT NULL,
  step_name text NOT NULL,
  event_type text NOT NULL,
  actor text NOT NULL,
  scenario_type text,
  created_at timestamptz NOT NULL
);
