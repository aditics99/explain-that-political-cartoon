# Explain That

An archive for learning Indian politics through newspaper cartoons. The planned collection covers cartoons from The Hindu and The Times of India across political eras, with historical context for each item.

## Run locally

Open `index.html` in a modern browser, or serve this folder with any static web server. For example:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000`. Open `editorial.html` separately for the private editorial desk. See [SUPABASE_SETUP.md](SUPABASE_SETUP.md) to apply the archive table update before creating entries.

## Archive and rights

The product is an editorial cartoon archive, not a live-trends feed. Entries should carry the publication date, newspaper, cartoonist when known, original source link, and a short explanation of the political context.

Only cartoons with permission to display should appear as images. For other historical entries, keep a citation and link to the original publication rather than copying or hotlinking the artwork. Attribution alone is not permission. The Hindu and Times Group provide image/content licensing channels; obtain terms for the intended public website use before uploading archive images. Do not scrape publisher archives or bypass access controls.

The Supabase protected editorial desk is retained for manually adding, reviewing, and publishing archive entries. Live GDELT, Reddit, Instagram, meme, and viral-video discovery are outside this product direction. See [SUPABASE_SETUP.md](SUPABASE_SETUP.md) for authentication and the archive database update.

## Hosting

GitHub Pages publishes the public archive and the separate auth-gated editorial route. The Supabase publishable key in browser code is intended for public use; row-level security protects editorial data. Pushes to `main` trigger deployment.
