# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://johannesrahlf.github.io/coffeeland-website/](https://johannesrahlf.github.io/coffeeland-website/)

## Stack

- Static site generator: Hugo
- Theme: PaperMod (Hugo module)
- Content CMS: Decap CMS (`/admin/`)
- Hosting: GitHub Pages

## Site Structure

- `content/news/`: News posts (also used as the landing-page feed)
- `content/about/_index.md`: About page
- `content/pilot-sites/_index.md`: Pilot Sites page
- `content/partners/_index.md`: Partners page
- `content/resources/_index.md`: Resources page
- `content/contact/_index.md`: Contact page
- `static/admin/config.yml`: Decap CMS configuration

## Local Development

1. Install Hugo (extended, v0.146.0 or newer) and Go.
2. Fetch/update Hugo modules:
   - `hugo mod tidy`
3. Run local server:
   - `hugo server -D`
4. Open:
   - `http://localhost:1313/coffeeland-website/`

## Build

- Production build:
  - `hugo --minify`

## CMS Usage

- Admin UI path: `/admin/`
- Decap CMS commits content changes directly to this repository.
- News entries support title, date, author, summary, tags, categories, and publish status.

## Deployment

- GitHub Actions workflow in `.github/workflows/hugo.yml` builds and deploys to GitHub Pages on pushes to `main`.

## Maintenance Notes

- Avoid committing generated metadata files like `Zone.Identifier`.
- Keep content in Markdown and media under `static/images/`.
- Update dependencies periodically with:
  - `hugo mod tidy`
