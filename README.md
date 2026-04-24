# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://johannesrahlf.github.io/coffeeland-website/](https://johannesrahlf.github.io/coffeeland-website/)

## For Partners: Editing Content

Partners can edit content through GitHub's web interface.

For step-by-step instructions on adding news, uploading images, and submitting changes for approval, see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Tech Stack

- Static site generator: Hugo (v0.146.0+)
- Theme: Ananke
- Image storage: Git LFS (automatic compression on upload)
- Hosting: GitHub Pages
- CI/CD: GitHub Actions

## Site Structure

- `content/news/`: News posts (displayed on landing page feed)
- `content/about/_index.md`: About page
- `content/pilot-sites/_index.md`: Pilot Sites page
- `content/partners/_index.md`: Partners page
- `content/resources/_index.md`: Resources page
- `content/contact/_index.md`: Contact page
- `static/images/`: Gallery images (Git LFS tracked)


## Local Development

1. Install Hugo (extended, v0.146.0 or newer) and Go.
2. Install Git LFS:
   ```bash
   git lfs install
   git lfs pull
   ```
3. Run local server:
   ```bash
   hugo server -D
   ```
4. Open: `http://localhost:1313/coffeeland-website/`

## Build & Deploy

- Local build: `hugo --minify`
- Production: GitHub Actions automatically builds on every push to `main`
- Deployed to: GitHub Pages (live within seconds)

## Image Management

- Images use **Git LFS** to keep repository lean
- **Auto-compression**: Images are automatically optimized on upload
- **Spending protection**: Free tier (1GB/month) with hard limits set to prevent overages
- Partners can upload full-resolution images — they're compressed automatically

## Access Control

- **Partners**: Can edit `content/news/` and upload to `static/images/`
- **Only Johannes**: Can modify configuration, theme, and workflows
- Protected by CODEOWNERS file

## Maintenance

- Add new partners: In repo Settings → Collaborators, grant "Can pull, push, and maintain" access
- Update Hugo: Change version in `.github/workflows/hugo.yml`
- Git LFS status: `git lfs status`

## Troubleshooting

**Images not showing?**
- Ensure Git LFS is installed locally: `git lfs install`
- Pull LFS files: `git lfs pull`

**Build failing?**
- Check Hugo version: `hugo version` (must be v0.146.0+)
- Check GitHub Actions tab for error details

**Want to edit locally?**
- Clone repo: `git clone https://github.com/johannesrahlf/coffeeland-website`
- Install Git LFS, run `hugo server -D`
- Edit files, test locally, push when ready
