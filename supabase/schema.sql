-- Explain That content store. Run in the Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.editorial_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table if not exists public.content_items (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null default '',
  media_url text not null,
  media_type text not null default 'image' check (media_type in ('image', 'video')),
  content_type text not null check (content_type in ('cartoon', 'meme', 'screenshot', 'video')),
  explanation text not null default '',
  sources jsonb not null default '[]'::jsonb check (jsonb_typeof(sources) = 'array'),
  status text not null default 'candidate' check (status in ('candidate', 'approved', 'dismissed')),
  discovered_at timestamptz not null default now(),
  published_at timestamptz,
  engagement_score bigint,
  source_platform text,
  source_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists content_items_public_feed_idx on public.content_items (published_at desc) where status = 'approved';
create index if not exists content_items_candidates_idx on public.content_items (discovered_at desc) where status = 'candidate';

create or replace function public.is_editorial_admin()
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.editorial_admins a where a.user_id = (select auth.uid()));
$$;

alter table public.editorial_admins enable row level security;
alter table public.content_items enable row level security;

drop policy if exists "admins can read admin list" on public.editorial_admins;
create policy "admins can read admin list" on public.editorial_admins for select to authenticated using (public.is_editorial_admin());
drop policy if exists "public can read approved content" on public.content_items;
create policy "public can read approved content" on public.content_items for select to anon, authenticated using (status = 'approved');
drop policy if exists "admins can read all content" on public.content_items;
create policy "admins can read all content" on public.content_items for select to authenticated using (public.is_editorial_admin());
drop policy if exists "admins can add candidates" on public.content_items;
create policy "admins can add candidates" on public.content_items for insert to authenticated with check (public.is_editorial_admin());
drop policy if exists "admins can update content" on public.content_items;
create policy "admins can update content" on public.content_items for update to authenticated using (public.is_editorial_admin()) with check (public.is_editorial_admin());
drop policy if exists "admins can remove content" on public.content_items;
create policy "admins can remove content" on public.content_items for delete to authenticated using (public.is_editorial_admin());

create or replace function public.touch_updated_at()
returns trigger language plpgsql set search_path = '' as $$
begin
  new.updated_at = now();
  return new;
end;
$$;
drop trigger if exists content_items_touch_updated_at on public.content_items;
create trigger content_items_touch_updated_at before update on public.content_items for each row execute function public.touch_updated_at();

grant select on public.content_items to anon, authenticated;
grant insert, update, delete on public.content_items to authenticated;
grant select on public.editorial_admins to authenticated;
grant execute on function public.is_editorial_admin() to authenticated;

-- After creating your account and signing in once, get its UUID from Authentication -> Users,
-- then run: insert into public.editorial_admins (user_id) values ('YOUR-AUTH-USER-UUID');
