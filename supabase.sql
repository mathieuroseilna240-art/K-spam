-- Kèspam database: run this entire script in Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists public.transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  type text not null check (type in ('income','expense')),
  amount numeric(14,2) not null check (amount > 0),
  category text not null,
  description text not null default '',
  transaction_date date not null default current_date,
  created_at timestamptz not null default now()
);

create table if not exists public.budgets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  category text not null,
  amount numeric(14,2) not null check (amount >= 0),
  month text not null,
  created_at timestamptz not null default now(),
  unique(user_id, category, month)
);

create table if not exists public.debts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  person_name text not null,
  type text not null check (type in ('i_owe','owed_to_me')),
  amount numeric(14,2) not null check (amount > 0),
  description text not null default '',
  due_date date,
  status text not null default 'pending' check (status in ('pending','paid')),
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.transactions enable row level security;
alter table public.budgets enable row level security;
alter table public.debts enable row level security;

drop policy if exists "profiles own rows" on public.profiles;
create policy "profiles own rows" on public.profiles for all using (auth.uid() = id) with check (auth.uid() = id);

drop policy if exists "transactions own rows" on public.transactions;
create policy "transactions own rows" on public.transactions for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "budgets own rows" on public.budgets;
create policy "budgets own rows" on public.budgets for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "debts own rows" on public.debts;
create policy "debts own rows" on public.debts for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public
as $$
begin
  insert into public.profiles (id, full_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'full_name',''))
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();
