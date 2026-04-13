# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand! This guide explains how to add news posts and gallery images.

## For Partners: Easy GitHub UI Method

You don't need to install anything — just use GitHub's web interface.

### Add a News Post
1. Go to the [news folder](https://github.com/johannesrahlf/coffeeland-website/tree/main/content/news)
2. Click **"Add file"** → **"Create new file"**
3. Name it `my-post.md`
4. Write your post in Markdown:
   ```markdown
   +++
   title = "Your Post Title"
   date = 2026-04-13
   draft = false
   author = "Your Name"
   summary = "Brief summary for the news feed"
   +++

   Your post content here...
   ```
5. Click **"Commit changes"** → done! Post appears on site within seconds.

### Upload to Gallery
1. Go to the [images folder](https://github.com/johannesrahlf/coffeeland-website/tree/main/static/images)
2. Click **"Add file"** → **"Upload files"**
3. Drag & drop images (any size — they auto-compress)
4. Click **"Commit changes"** → images appear in gallery

---

## For Developers: Local Development

### Prerequisites
- Hugo extended (v0.146.0 or newer)
- Go (for Hugo modules)
- Git LFS (for image handling):
  ```bash
  git lfs install
  ```

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/johannesrahlf/coffeeland-website
   cd coffeeland-website
   ```
2. Fetch Hugo modules and LFS files:
   ```bash
   hugo mod tidy
   git lfs pull
   ```
3. Start local development server:
   ```bash
   hugo server -D
   ```
4. Open: `http://localhost:1313/coffeeland-website/`

### Content Workflow

**News posts:**
- Location: `content/news/`
- Format: Markdown with TOML frontmatter
- Goes live immediately when pushed

**Static pages:**
- Location: `content/*/\_index.md` (about, partners, etc.)
- Edit directly in GitHub or locally

**Gallery images:**
- Location: `static/images/`
- Git LFS handles large files automatically
- Auto-compression runs on every push

## Quality Checklist

Before pushing changes:
- [ ] Hugo build succeeds: `hugo --minify`
- [ ] Links and images render correctly
- [ ] Images are reasonable file size (auto-compression helps)
- [ ] No OS metadata files (`.Zone.Identifier`, `.DS_Store`)

## Git LFS

Images are stored using Git LFS to keep the repository lean.

If images don't show up locally:
```bash
git lfs pull
```

Check LFS status:
```bash
git lfs status
```

