# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site.

1. Open https://app.pagescms.org/
2. Sign in with GitHub
3. Open this repository
4. Edit entries in **News**, **Partners**, or **Pilot Sites**
5. Save your changes directly to `main`

Notes:
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`

## How Publishing Works

All content changes are saved to `main` first.

**Manual deployment workflow:**
1. Contributors push content changes to `main`
2. A reminder workflow checks whether `main` is ahead of the latest deployment
3. Repository owner runs manual deploy workflow when ready
4. The site is published after that manual run succeeds

Notification behavior:
1. On each push to `main`, the reminder workflow opens or updates one reminder issue if deployment is pending
2. Once daily, the same workflow re-checks and refreshes that reminder issue until deployment catches up
3. When deployed SHA matches `main`, the reminder issue is closed automatically

The website is only published after the manual deploy workflow runs.

## Repository Owner Setup (One-time)

Required one-time setup:

1. Ensure `.github/workflows/hugo.yml` and `.github/workflows/deployment-reminder.yml` are present on `main`
2. Open **Settings -> Actions -> General** and set **Workflow permissions** to **Read and write**

To further enforce safety:
1. Review reminder issues and deploy when needed
2. Keep CODEOWNERS for visibility on sensitive file changes
3. Optionally keep branch rules if you want stricter controls later

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

- Changes are published only after the repository owner runs the manual deploy workflow
- Keep titles and summaries short and clear
- If you are unsure where something belongs, ask the project owner before opening the pull request

---

If you need help, contact the project owner or the person responsible for maintaining the website.

