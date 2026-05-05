# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site.

1. Open https://app.pagescms.org/
2. Sign in with GitHub
3. Open this repository
4. **Switch to or create the `pages-edits` branch**
5. Edit entries in **News**, **Partners**, or **Pilot Sites**
6. Save your changes
7. A pull request to `main` will be created or updated automatically
8. Wait for the repository owner to review and merge

Notes:
- All Pages CMS edits should go to the `pages-edits` branch
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`
- Further edits on `pages-edits` will update the same pull request

## How Publishing Works

All changes are submitted through a pull request before they are published.

**The `pages-edits` branch workflow:**
1. All Pages CMS edits go to the `pages-edits` branch
2. A GitHub Action automatically creates or updates a pull request to `main`
3. The repository owner reviews and approves the changes
4. When merged to `main`, the Hugo build and deployment runs automatically
5. The site is published to GitHub Pages within seconds

The website is only published after approved changes are merged into `main`.

## Repository Owner Setup (One-time)

No additional setup required. The `pages-edits` branch is dedicated to Pages CMS, and a GitHub Action automatically creates/updates pull requests from it.

To further enforce safety:
1. Keep GitHub branch protection enabled on `main` (require PR, approvals, code owner review)
2. Delete or archive old test branches periodically
3. Configure CODEOWNERS so your review is required on all PRs

## Content Areas

Use these collections in Pages CMS:

- **News** for project updates and announcements
- **Partners** for partner profile pages
- **Pilot Sites** for pilot site pages

For images:

- Upload images through the CMS
- Use short filenames with lowercase letters and hyphens when possible
- Stored images are served from `/images/...`

## Good to Know

- Changes are published only after the repository owner approves and merges the pull request
- Keep titles and summaries short and clear
- If you are unsure where something belongs, ask the project owner before opening the pull request

---

If you need help, contact the project owner or the person responsible for maintaining the website.

