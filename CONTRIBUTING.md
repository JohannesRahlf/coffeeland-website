# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software or use the command line.

## Edit Content with Pages CMS

Pages CMS is the supported editor for this site. You do not need to know Git or GitHub.

1. You receive two emails: an invitation from Pages CMS (use it to sign in; no GitHub account needed) and a message from the project owner with your personal link
2. Open your personal link and save it as a bookmark. It looks like `https://app.pagescms.org/JohannesRahlf/coffeeland-website/edits-yourname/`
3. Sign in if asked
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
2. The reminder issue is closed by the next run of the workflow (next push to `main`, or run it manually from the Actions tab) once the deployed version matches `main`
3. When deployed SHA matches `main`, the reminder issue is closed automatically

The website is only published after the manual deploy workflow runs.

## Repository Owner Setup (One-time)

Required one-time setup:

1. Ensure `.github/workflows/hugo.yml` and `.github/workflows/deployment-reminder.yml` are present on `main`
2. Open **Settings -> Actions -> General** and set **Workflow permissions** to **Read repository contents** (each workflow declares the permissions it needs)

Adding and removing contributors (owner, requires `gh` signed in as admin):

```
scripts/add-contributor.sh "<name>"      # creates the branch edits-<name>, prints the personal link and a welcome message
scripts/remove-contributor.sh "<name>"   # deletes their branch (refuses while a pull request is open; --force overrides)
```

Then invite or remove the person's email address in the Pages CMS interface (**Collaborators**). Pages CMS collaborators can edit content and media only: they cannot change `.pages.yml`, workflows, or other settings, and they need no GitHub account. For someone who works with a GitHub account, add `--github <username>` to also invite or remove them as a repository collaborator (Write).

The workflow `.github/workflows/contributor-branches.yml` runs when an `edits-*` branch is pushed, when `main` changes, and when a pull request is merged. It opens pull requests for `edits-*` branches and resets a branch to `main` after its pull request is merged. It has no schedule, so it keeps working after long idle periods.

The workflow `.github/workflows/optimize-images.yml` runs after the branch workflow, shrinks images that contributors add or change on `edits-*` branches (max 1600 px, quality 82, metadata removed) and commits the result to that branch. Merge pull requests with **Squash and merge**, so original large files never enter the history of `main`.

The workflow `.github/workflows/pr-scope-check.yml` posts a `scope-check` status on every pull request (required to merge). For `edits-*` branches it fails if files outside `content/` and `static/images/` change, if an image is still over 500 KB after automatic optimization, or if more than 40 files change. It is a guardrail against mistakes and overeager tools, not a security boundary, so still read the diff.

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
- Photos straight from a phone are fine: images are resized automatically (to fit within 1600 px), recompressed, and stripped of metadata such as GPS location. This happens on your branch shortly after you save, and the file name stays the same
- Use JPEG, PNG or WebP. iPhone HEIC files are not supported: share or export them as JPEG first
- Stored images are served from `/images/...`

## Using AI Assistants

You may use an AI assistant (ChatGPT, Claude, etc.) to help write text, but:

- You are responsible for the accuracy of everything you publish: check names, numbers, quotes, and links
- Do not let tools edit the repository directly with your GitHub login unless you stay within your own branch and the content rules in `AGENTS.md`
- Keep changes small. Bulk rewrites or edits outside `content/` and `static/images/` are flagged by an automatic check and will be rejected
- Never paste confidential or personal data into an AI tool or into the site

## Good to Know

- Changes are published only after the repository owner runs the manual deploy workflow
- Keep titles and summaries short and clear
- Do not paste confidential or personal data; the repository and site are public
- If you are unsure where something belongs, ask the project owner

---

If you need help, contact the project owner or the person responsible for maintaining the website.

