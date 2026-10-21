-- Add archive metadata and publish artwork only when display permission is confirmed.
alter table public.content_items alter column media_url drop not null;

alter table public.content_items
  add column if not exists publication text,
  add column if not exists cartoonist text,
  add column if not exists cartoon_date date,
  add column if not exists topics text[] not null default '{}',
  add column if not exists original_url text,
  add column if not exists display_mode text not null default 'image',
  add column if not exists display_permission boolean not null default false,
  add column if not exists permission_details text;

alter table public.content_items drop constraint if exists content_items_display_mode_check;
alter table public.content_items add constraint content_items_display_mode_check check (display_mode in ('image', 'link'));

drop policy if exists "public can read approved content" on public.content_items;
create policy "public can read approved content" on public.content_items
  for select to anon, authenticated
  using (
    status = 'approved'
    and content_type = 'cartoon'
    and original_url is not null
    and (display_mode = 'link' or (display_mode = 'image' and display_permission = true))
  );
