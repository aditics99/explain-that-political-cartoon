# Explain That

A dependency free MVP for a political context explainer site. It includes an image-only public gallery, image explainer pages, and a local editorial review desk.

## Run it

Open `index.html` in a modern browser, or serve this folder with any static web server. For example, with Python installed:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000`. Open `editorial.html` separately for the local demo editorial desk; it is intentionally excluded from the GitHub Pages build. The app uses browser local storage to remember approvals, edits, and dismissals; use the same browser to see a published item in the gallery. Clear the site’s local storage to reset the demo data.

## What works

- Responsive, image only Pinterest style masonry gallery with video play indicators.
- Clicking an item opens an explainer tile over the dimmed gallery, with a close button, the original visual, conversational explanation, and source links.
- Editorial desk for reviewing/editing candidate notes and explanations, source links, dismissing, and approving for immediate publication.
- Six original fictional demo fixtures, clearly identified in the editorial desk. They are not real trending items or discovered social posts.

## Scope and setup for real use

This is a front-end prototype. Editorial state lives in one browser and the dashboard has no authentication, shared database, or server-side publishing. Keeping the desk in a separate `editorial.html` page removes it from the public site navigation, but does not make it private if the whole folder is deployed: anyone who knows the page URL could open it, and browser storage is not shared with visitors. For a truly private desk that can publish to a public site, add server-side sign-in and a protected data/API layer before deployment. Real discovery integrations are intentionally absent: each source (Instagram, YouTube, X, publishers, Reddit) needs its own validated permitted API, feed, or embed workflow, credentials handled server-side, rights review, and deduplication/ranking job. The current candidates are fixtures and do not claim to be trending. The source links on fixture explainers point to background references for general concepts.

## GitHub Pages

The public repository includes a GitHub Actions workflow at `.github/workflows/pages.yml`. It publishes only `index.html`, `app.js`, and `styles.css`; the local editorial page, work files, and outputs are not deployed. Pushes to `main` trigger a Pages deployment. In the repository's **Settings → Pages**, choose **GitHub Actions** as the build and deployment source if GitHub has not enabled it automatically. The live address will be `https://aditics99.github.io/explain-that-political-cartoon/` after the first successful workflow run.
