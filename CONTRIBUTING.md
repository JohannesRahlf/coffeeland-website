# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site. You do not need to know Git or GitHub.

1. Accept the invitation to the repository (you receive an email from GitHub; you need a free GitHub account)
2. Open the personal link the project owner sent you. It looks like `https://app.pagescms.org/JohannesRahlf/coffeeland-website/edits-yourusername/`
3. Sign in with GitHub
4. Edit entries in **News**, **Partners**, or **Pilot Sites** and save
5. That's it. Your changes are reviewed by the project owner before they go live. A review request is created automatically, usually within a minute

Notes:
- Always use your personal link. Do not edit the `main` branch: it is protected and saving there will fail with "Changes must be made through a pull request"
- Only edit content (News, Partners, Pilot Sites). Changes to other files will be rejected
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`
- After your changes are approved, your branch is reset to the current version of the site. Keep using the same link

## How Publishing Works

Content changes reach `main` only through reviewed pull requests.

**Review and deployment workflow:**
1. Contributors save changes on their personal branch (`edits-<username>`)
2. A workflow opens a pull request automatically; the repository owner reviews and merges it
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

Adding and removing contributors (owner, requires `gh` signed in as admin):

```
scripts/add-contributor.sh <github-username>     # invites (Write), creates edits-<username>, prints their link
scripts/remove-contributor.sh <github-username>  # removes access and deletes their branch
```

The workflow `.github/workflows/contributor-branches.yml` runs when an `edits-*` branch is pushed, when `main` changes, and when a pull request is merged. It opens pull requests for `edits-*` branches and resets a branch to `main` after its pull request is merged. It has no schedule, so it keeps working after long idle periods.

One-time setting: **Settings -> Actions -> General -> Workflow permissions -> Allow GitHub Actions to create and approve pull requests** must be enabled. The bot cannot satisfy the code owner review, so it cannot approve changes by itself.

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
- If you are unsure where something belongs, ask the project owner

---

If you need help, contact the project owner or the person responsible for maintaining the website.

