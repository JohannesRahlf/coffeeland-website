# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://coffeeland.nibio.no/](https://coffeeland.nibio.no/)

## For Partners: Editing Content

Partners use Pages CMS for editing content:

- Open: https://app.pagescms.org/johannesrahlf/coffeeland-website/main/
- Sign in with GitHub and open this repository
- Edit content collections (News, Partners, Pilot Sites)
- Save changes

For step-by-step instructions on adding news, uploading images, and submitting changes for approval, see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Tech Stack

- Static site generator: Hugo (v0.160.0+)
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

1. Install Hugo (extended, v0.160.0 or newer) and Go.
2. Install Git LFS:
   ```bash
   git lfs install
   git lfs pull
   ```
3. Run local server:
   ```bash
   hugo server -D
   ```
4. Open: `http://localhost:1313/`

## Build & Deploy

- Local build: `hugo --minify`
- Production deploy: GitHub Actions deploy runs **manually** from Actions tab (`hugo.yml`)
- Reminder automation: a workflow notifies when `main` has commits not yet deployed
- Deployed to: GitHub Pages after manual deploy run succeeds

Notification behavior:
- On each push to `main`, the reminder workflow checks deployment status
- If there are undeployed commits, it opens or updates a reminder issue
- Once daily, it re-checks and updates the same issue until deployed

## Image Management

- Images use **Git LFS** to keep repository lean
- **Auto-compression**: Images are automatically optimized on upload
- **Spending protection**: Free tier (1GB/month) with hard limits set to prevent overages
- Partners can upload full-resolution images — they're compressed automatically

## Access Control

- **Partners**: Edit content through Pages CMS
- **Only Johannes**: Can modify configuration, theme, and workflows
- Protected by [.github/CODEOWNERS](./.github/CODEOWNERS)
- Contributors can push to `main`
- Deploy is controlled manually by repository maintainers

## Maintenance

- Add new partners: In repo Settings → Collaborators, grant "Can pull, push, and maintain" access
- Update Hugo: Change version in `.github/workflows/hugo.yml`
- Git LFS status: `git lfs status`

## Troubleshooting

**Images not showing?**
- Ensure Git LFS is installed locally: `git lfs install`
- Pull LFS files: `git lfs pull`

**Build failing?**
- Check Hugo version: `hugo version` (must be v0.160.0+)
- Check GitHub Actions tab for error details

**Want to edit locally?**
- Clone repo: `git clone https://github.com/johannesrahlf/coffeeland-website`
- Install Git LFS, run `hugo server -D`
- Edit files, test locally, push when ready
