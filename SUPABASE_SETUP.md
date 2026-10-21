# Supabase setup for the cartoon archive

The Supabase project is `explain-that`. The archive desk uses Supabase email sign-in and an editor allowlist. The public page reads approved archive entries only.

## Sign in as the editor

1. Open the separate [cartoon archive desk](https://aditics99.github.io/explain-that-political-cartoon/editorial.html).
2. Enter your email address and use the secure link Supabase sends you.
3. The first sign-in creates your Supabase Auth user. Add that account to `public.editorial_admins` using the SQL statement shown by the desk.
4. Refresh the desk to review and publish archive entries.

## Apply the archive database update

The existing table needs archive metadata before the new entry form can save. In Supabase **SQL Editor**, run [`supabase/archive_migration.sql`](supabase/archive_migration.sql) once. It adds the newspaper, cartoonist, publication date, topics, original link, display mode, and permission fields. It also changes the public read policy so an image entry is visible only when display permission is confirmed; link-only entries show the original newspaper link.

For a fresh Supabase project, run [`supabase/schema.sql`](supabase/schema.sql) instead of the migration.

## Add archive entries

Each entry needs the newspaper, publication date, original newspaper page, a short archive label, and researched political context. Cartoonist and topic tags are optional. Choose **Link to original only** when reuse permission is unavailable. Choose **Display cartoon here** only after permission is secured; the form requires you to confirm that right and provide the permitted media URL.

Entries remain private candidates until reviewed and approved. The public archive groups published entries by year. Selecting a year opens its full-screen image carousel; selecting a cartoon opens the closable explainer overlay with context and the original link.

## Rights and source handling

The site does not scrape newspaper archives. Do not copy or hotlink an image just because it is publicly viewable or attributed. Request permission or a license for public display. Without it, use a bibliographic entry and link to the publisher's original page. A public link and credit do not themselves grant image-reuse rights.

## Project details

- Supabase project URL: `https://huyogawqcaheatwvfrgc.supabase.co`
- Hosted archive: `https://aditics99.github.io/explain-that-political-cartoon/`
- Hosted archive desk: `https://aditics99.github.io/explain-that-political-cartoon/editorial.html`
- Database migration: [`supabase/archive_migration.sql`](supabase/archive_migration.sql)
