# Supabase setup for Explain That

The Supabase project is `explain-that` in the free **Explain That** organization. Its schema has been applied, row-level security is enabled, and the GitHub Pages gallery and editorial sign-in redirect are allowlisted.

## Sign in as the editor

1. Open the separate [editorial desk](https://aditics99.github.io/explain-that-political-cartoon/editorial.html).
2. Enter your email address and use the secure link Supabase sends you.
3. The first sign-in creates your Supabase Auth user. The desk will show that account’s UUID and the SQL statement to allowlist it.
4. In Supabase **SQL Editor**, run that statement. Refresh the editorial desk; it will then show the shared review queue.

Only accounts explicitly added to `public.editorial_admins` can view candidates or approve, edit, and dismiss content. Public visitors can read only approved items. Do not share a `service_role` key or database password. The browser uses only the publishable key in `supabase-config.js`.

## Add and publish content

The desk's **Find India news** button queries the GDELT Project's public DOC search for English-language political coverage from Indian outlets over the previous 7 days. It keeps up to 30 deduplicated article links in the current browser session, sorted by recency. GDELT is a news index, not a social popularity meter; results may still be noisy or irrelevant. Choose **Use as research lead** to prefill the headline, article link, and a clearly labeled explanation starter. That starter uses only the headline and is not a fact-checked explanation: verify it against the full report and a primary source before publishing. GDELT does not provide gallery media or article summaries, and it does not publish content automatically.

If a source is a Reddit post, add its post URL in the candidate's sources. The public explainer then loads Reddit's official embed so its post, creator attribution, and Reddit controls remain visible. The image-only carousel still uses the separately supplied gallery media. Do not copy or crop media from a Reddit post into the carousel unless you have permission from the rights holder. Reddit's embed can be unavailable if the source post is deleted or restricted.

Instagram is manual only, so you do not need a new Instagram or Facebook account for discovery. Add a public post link as a source only when you have permission to feature it. Instagram post pages are not direct media files; use media you own or are licensed to republish and a stable, displayable media URL. I cannot inspect a private account or infer reuse permission from a public post link. The six included demo fixtures are fictional and are not presented as live trends.

## Project details

- Supabase project URL: `https://huyogawqcaheatwvfrgc.supabase.co`
- Hosted gallery: `https://aditics99.github.io/explain-that-political-cartoon/`
- Hosted editorial desk: `https://aditics99.github.io/explain-that-political-cartoon/editorial.html`
- Schema file: [`supabase/schema.sql`](supabase/schema.sql)

## Live source discovery status

The GDELT search is on-demand when you press the button; it is not a scheduled crawler. It filters to India-based publishers and English-language articles over a rolling 7-day range. Do not scrape Instagram, X, YouTube, Reddit, or publisher pages.

GDELT's public DOC API returns article links and metadata for research; publisher rights still apply to each article and any associated image. Do not republish article images from search results without permission. Relevant constraints for future sources include:

- The Indian Express describes RSS consumption as personal and non-commercial and says reproduction requires express permission and a syndication/license fee: https://indianexpress.com/rss/.
- Reddit says commercial Data API use or use outside expressly permitted terms requires a separate agreement: https://redditinc.com/policies/data-api-terms.
- GDELT Project documentation describes its live DOC full-text search API: https://blog.gdeltproject.org/gdelt-doc-2-0-api-debuts/.
- YouTube API-displayed content requires YouTube attribution/branding and non-authorized API data must be refreshed or deleted within 30 days: https://developers.google.com/youtube/terms/developer-policies. That conflicts with the current public gallery's no-labels image-only presentation for API-sourced YouTube search cards, so do not use its Data API for public discovery unless the presentation is revised to meet YouTube requirements.
- YouTube search has a limited default daily quota: https://developers.google.com/youtube/v3/docs/search/list.

Future sources should use permitted APIs or feeds, server-side secrets where needed, and their own attribution, retention, and reuse rules. For now, GDELT supplies up to 30 India-first English-language research leads from the past week on demand; the editor decides relevance, verifies claims, and secures media rights before creating a publishable item. The search does not generate finished explanations, measure social virality, or run as a daily scheduled batch.
