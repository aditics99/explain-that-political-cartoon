# Explain That

A dependency free MVP for a political context explainer site. It includes an image-only public gallery, image explainers, and a Supabase protected editorial desk.

## Run it

Open `index.html` in a modern browser, or serve this folder with any static web server. For example, with Python installed:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000`. Open `editorial.html` separately for the editorial desk. When Supabase is unavailable, the app uses browser local storage for the fictional demo fixtures.

## What works

- Responsive, image only Pinterest style masonry gallery with video play indicators.
- Clicking an item opens an explainer tile over the dimmed gallery, with a close button, the original visual, conversational explanation, and source links.
- Editorial desk for reviewing/editing candidate notes and explanations, source links, dismissing, and approving for immediate publication.
- Six original fictional demo fixtures, clearly identified in the editorial desk. They are not real trending items or discovered social posts.

## Scope and setup for real use

Supabase provides email-link sign-in, an editor allowlist, shared editorial content, and a public approved-content feed protected by row-level security. The editorial page is hosted separately at `/editorial.html`; only signed-in allowlisted accounts can review or publish. After your first sign-in, the desk displays the UUID and SQL statement needed to grant your account editor access. Real discovery integrations are intentionally absent: each source (Instagram, YouTube, X, publishers, Reddit) needs its own validated permitted API, feed, or embed workflow, server-side credentials, rights review, and a deduplication/ranking job. Demo fixtures remain fictional and do not claim to be trending.

## GitHub Pages

The GitHub Actions workflow publishes the gallery and the separately routed, authentication-gated editorial page. The Supabase publishable key in browser code is designed for public use; row-level security protects editorial data. Pushes to `main` trigger a Pages deployment. The live address is `https://aditics99.github.io/explain-that-political-cartoon/`.

## Supabase groundwork

The schema is in [`supabase/schema.sql`](supabase/schema.sql). The project URL, publishable key, and email redirect are now configured. Demo fixtures remain fictional; live trend discovery is not configured.
