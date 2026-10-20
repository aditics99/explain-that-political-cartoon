# Explain That

A dependency free MVP for a political context explainer site. It includes a minimalist, image-only horizontal carousel, image explainers, and a Supabase protected editorial desk.

## Run locally

Open `index.html` in a modern browser, or serve this folder with any static web server. For example:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000`. Open `editorial.html` separately for the private editorial desk. The public page contains only approved visuals; selecting one opens the sourced explainer over the dimmed gallery.

## Editorial desk and live discovery

The desk is protected by Supabase email sign-in and an editor allowlist. It supports candidate review, editing, dismissal, and immediate publication after approval. The included fixtures are original fictional examples, not live trends.

The private desk includes an on-demand GDELT Project search for English-language political coverage from Indian outlets over the past 7 days. It shows linked headlines, deduplicates URLs, and sorts by recency; it does not claim that coverage is viral or popular. These links are research leads, not reusable images. Reddit post URLs in a published item's sources are shown with Reddit's official embed in the explainer. Instagram is manual only: add a public post as a source when you have permission to feature its media, and provide a media URL that can legally and reliably be displayed. See [SUPABASE_SETUP.md](SUPABASE_SETUP.md).

## Hosting

GitHub Pages publishes the gallery and the separate auth-gated editorial route. The Supabase publishable key in browser code is intended for public use; row-level security protects editorial data. Pushes to `main` trigger deployment.
