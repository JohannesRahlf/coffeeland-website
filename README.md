# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://coffeeland.nibio.no/](https://coffeeland.nibio.no/)

## For Partners: Editing Content

Partners use Pages CMS for editing content:

- Open the editor link in the website footer (it ends in `/edits-team/`); do not use `main`
- Sign in with the Pages CMS invitation email (no GitHub account needed)
- Edit content collections (News, Partners, Pilot Sites)
- Save changes

For step-by-step instructions on adding news, uploading images, and submitting changes for approval, see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Tech Stack

- Static site generator: Hugo (v0.160.0+)
- Theme: Ananke
- Images: regular files in `static/images/`, optimized automatically on contributor branches
- Hosting: GitHub Pages
- CI/CD: GitHub Actions

## Site Structure

- `content/news/`: News posts (displayed on landing page feed)
- `content/about/_index.md`: About page
- `content/pilot-sites/_index.md`: Pilot Sites page
- `content/partners/_index.md`: Partners page
- `content/resources/_index.md`: Resources page
- `content/contact/_index.md`: Contact page
- `static/images/`: Gallery images


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
- It has no daily schedule (GitHub pauses scheduled workflows after 60 days of inactivity); run it from the Actions tab to re-check

## Image Management

- Site images in `static/images/` are stored as regular files (not LFS) so Pages CMS can preview them
- Images that contributors add on `edits-*` branches are resized (max 1600 px), recompressed and stripped of metadata (incl. GPS) automatically by `.github/workflows/optimize-images.yml`; phone photos are fine

## Access Control

- **Partners**: Edit content through Pages CMS on the shared branch `edits-team` (one link for everyone); invited by email in Pages CMS → Collaborators
- **Only Johannes**: Can modify configuration, theme, and workflows
- Protected by [.github/CODEOWNERS](./.github/CODEOWNERS)
- Contributors work on branches; `main` is protected and changes need a reviewed pull request
- Deploy is controlled manually by repository maintainers

## Maintenance

- Add new contributors: invite their email in Pages CMS → Collaborators and send them the editor link. Optional separate branch per person: `scripts/add-contributor.sh "<name>"`. GitHub accounts only if needed (`--github <username>`, Write access, never Maintain or Admin)
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
