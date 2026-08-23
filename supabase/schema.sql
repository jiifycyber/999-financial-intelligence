create extension if not exists "uuid-ossp";
create table if not exists profiles (
  id uuid primary key, full_name text, email text, role text default 'client', created_at timestamptz default now()
);
create table if not exists credit_snapshots (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id),
  bureau text not null, score integer, utilization numeric, captured_at timestamptz default now()
);
create table if not exists credit_issues (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id), bureau text,
  account_name text, issue_type text, user_confirmed boolean default false, status text default 'review',
  created_at timestamptz default now()
);
create table if not exists dispute_cases (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id),
  credit_issue_id uuid references credit_issues(id), draft_text text, approved_by_user boolean default false,
  sent_at timestamptz, status text default 'draft', created_at timestamptz default now()
);
create table if not exists grant_opportunities (
  id uuid primary key default uuid_generate_v4(), external_id text, source text, title text not null,
  funder text, deadline timestamptz, fit_score numeric, raw_data jsonb, created_at timestamptz default now()
);
create table if not exists grant_applications (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id),
  opportunity_id uuid references grant_opportunities(id), status text default 'draft',
  verified_facts jsonb default '{}'::jsonb, draft_content jsonb default '{}'::jsonb,
  compliance_review jsonb default '{}'::jsonb, submitted_at timestamptz, created_at timestamptz default now()
);
create table if not exists documents (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id), category text,
  storage_path text, metadata jsonb default '{}'::jsonb, created_at timestamptz default now()
);
create table if not exists workflow_tasks (
  id uuid primary key default uuid_generate_v4(), user_id uuid references profiles(id), task_type text,
  status text default 'open', due_at timestamptz, payload jsonb default '{}'::jsonb, created_at timestamptz default now()
);
create table if not exists audit_logs (
  id uuid primary key default uuid_generate_v4(), user_id uuid, event_type text,
  details jsonb default '{}'::jsonb, created_at timestamptz default now()
);
