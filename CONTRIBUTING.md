# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site.

1. Open https://app.pagescms.org/
2. Sign in with GitHub
3. Open this repository
4. Edit entries in **News**, **Partners**, or **Pilot Sites**
5. Save the change

Notes:
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`
- Whether the change goes to a pull request or directly to `main` depends on GitHub branch protection

## How Publishing Works

All changes should be submitted for review before they are published.

This repository is intended to use a pull-request-only workflow.

Pages CMS does not force that workflow on its own.

If GitHub branch protection is enabled on `main`, direct edits to `main` are blocked and changes must be reviewed before merge.

If branch protection is not enabled, or if the signed-in account can bypass the rule, Pages CMS may push directly to `main`.

Please do not commit directly to the `main` branch. Instead:

1. Make your change in GitHub
2. Choose **"Create a new branch for this commit"**
3. Click **"Propose changes"**
4. Open a pull request
5. Wait for the repository owner to review and merge it

The website is only published after approved changes are merged into `main`.

## Repository Owner Setup

To enforce PR-only edits in GitHub:

1. Open repository **Settings** → **Branches** or **Rules**
2. Add a rule for the `main` branch
3. Enable **Require a pull request before merging**
4. Enable **Require approvals**
5. Enable **Require review from Code Owners**
6. Optionally enable **Restrict who can push to matching branches**

This repository includes a root [`.github/CODEOWNERS`](https://github.com/johannesrahlf/coffeeland-website/blob/main/.github/CODEOWNERS) file so owner review can be required.

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

