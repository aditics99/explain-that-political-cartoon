# Supabase setup for Explain That

The Supabase project is `explain-that` in the free **Explain That** organization. Its schema has been applied, row-level security is enabled, and the GitHub Pages gallery and editorial sign-in redirect are allowlisted.

## Sign in as the editor

1. Open the separate [editorial desk](https://aditics99.github.io/explain-that-political-cartoon/editorial.html).
2. Enter your email address and use the secure link Supabase sends you.
3. The first sign-in creates your Supabase Auth user. The desk will show that account’s UUID and the SQL statement to allowlist it.
4. In Supabase **SQL Editor**, run that statement. Refresh the editorial desk; it will then show the shared review queue.

Only accounts explicitly added to `public.editorial_admins` can view candidates or approve, edit, and dismiss content. Public visitors can read only approved items. Do not share a `service_role` key or database password. The browser uses only the publishable key in `supabase-config.js`.

## Add and publish content

The desk currently supports manually adding a candidate from a permitted public media URL, a draft explanation, and source links. Review the explanation and sources, then choose **Approve & publish**. Approved items appear in the public gallery. Automatic discovery from Instagram, YouTube, X, news publishers, and Reddit is not configured; the six demo fixtures are fictional and are not presented as live trends.

## Project details

- Supabase project URL: `https://huyogawqcaheatwvfrgc.supabase.co`
- Hosted gallery: `https://aditics99.github.io/explain-that-political-cartoon/`
- Hosted editorial desk: `https://aditics99.github.io/explain-that-political-cartoon/editorial.html`
- Schema file: [`supabase/schema.sql`](supabase/schema.sql)
