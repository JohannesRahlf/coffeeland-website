# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site.

1. Open https://app.pagescms.org/
2. Sign in with GitHub
3. Open this repository
4. Switch to your own branch (do not edit `main`): use the branch selector and create one, e.g. `yourname-news-update`
5. Edit entries in **News**, **Partners**, or **Pilot Sites** and save
6. Open a pull request from your branch into `main` on GitHub (a banner appears on the repository page after you push)
7. The project owner reviews your changes and merges them, or asks you for changes

Notes:
- You cannot change `main` directly; every change goes through a pull request and is reviewed
- Only edit content (News, Partners, Pilot Sites). Pull requests that touch other files will be rejected
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`

## How Publishing Works

Content changes reach `main` only through reviewed pull requests.

**Review and deployment workflow:**
1. Contributors save changes on their own branch and open a pull request
2. The repository owner reviews and merges the pull request
3. A reminder workflow checks whether `main` is ahead of the latest deployment
4. Repository owner runs manual deploy workflow when ready
5. The site is published after that manual run succeeds

Notification behavior:
1. On each push to `main`, the reminder workflow opens or updates one reminder issue if deployment is pending
2. Once daily, the same workflow re-checks and refreshes that reminder issue until deployment catches up
3. When deployed SHA matches `main`, the reminder issue is closed automatically

The website is only published after the manual deploy workflow runs.

## Repository Owner Setup (One-time)

Required one-time setup:

1. Ensure `.github/workflows/hugo.yml` and `.github/workflows/deployment-reminder.yml` are present on `main`
2. Open **Settings -> Actions -> General** and set **Workflow permissions** to **Read repository contents** (each workflow declares the permissions it needs)

Access control:
1. `main` is protected: pull requests with owner (CODEOWNERS) approval are required
2. Give external contributors the lowest role that works (Write, so they can push branches)
3. Review reminder issues and deploy when needed

## Content Areas

Use these collections in Pages CMS:

- **News** for project updates and announcements
- **Partners** for partner profile pages
- **Pilot Sites** for pilot site pages

Preview text on cards/lists:

- Use the **summary** field in each entry to control preview text shown on listing cards
- If **summary** is left empty, the site automatically uses the beginning of the page body as fallback preview text

For images:

- Upload images through the CMS
- Use short filenames with lowercase letters and hyphens when possible
- Keep images small: at most 500 KB each, JPEG or WebP for photos, about 1600 px wide at most. Large files will be rejected in review
- Stored images are served from `/images/...`

## Good to Know

- Changes are published only after the repository owner runs the manual deploy workflow
- Keep titles and summaries short and clear
- Do not paste confidential or personal data; the repository and site are public
- If you are unsure where something belongs, ask the project owner before opening the pull request

---

If you need help, contact the project owner or the person responsible for maintaining the website.

