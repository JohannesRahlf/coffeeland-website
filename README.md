# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://johannesrahlf.github.io/coffeeland-website/](https://johannesrahlf.github.io/coffeeland-website/)

## Stack

- Static site generator: Hugo (v0.146.0+)
- Theme: Stack (image-centric, Git submodule)
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

## For Partners: Editing Content

Partners can edit news and upload images directly via **GitHub's web interface** (no technical knowledge required):

### Add a News Post
1. Go to https://github.com/johannesrahlf/coffeeland-website
2. Navigate to `content/news/`
3. Click **"Add file"** → **"Create new file"**
4. Name it `my-post.md` (use a short title)
5. Write your post in Markdown:
   ```markdown
   +++
   title = "Post Title"
   date = 2026-04-13
   draft = false
   author = "Your Name"
   summary = "Brief summary shown in feed"
   +++

   Your content here...
   ```
6. Click **"Commit changes"** → post goes live immediately

### Upload Images to Gallery
1. Navigate to `static/images/`
2. Click **"Add file"** → **"Upload files"**
3. Drag & drop images (any size — auto-compresses)
4. Click **"Commit changes"**
5. Images appear in gallery automatically

**Note:** Images are automatically compressed; full-size uploads are welcome.

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
