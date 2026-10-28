# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using Pages CMS in the browser.

You do not need to install any software, use the command line, or have a GitHub account.

## Edit Content with Pages CMS

1. Open the invitation email from Pages CMS and sign in
2. Open the editor and save it as a bookmark: https://app.pagescms.org/JohannesRahlf/coffeeland-website/main/ (it is also linked in the footer of the website)
3. Edit entries in **News**, **Partners**, or **Pilot Sites**
4. Press **Save**

Every save is stored immediately with your name, but nothing appears on the website until the project owner publishes it. So you cannot break the live site.

Notes:
- Only content and pictures can be edited here
- Uploaded images are stored in `static/images`
- Image paths in content are written as `/images/...`

## How Publishing Works

1. Contributors save changes in Pages CMS (each save is a commit on `main`)
2. A reminder issue ("Pending deployment on main") lists the saved changes since the last deployment: who saved what, and which files changed
3. The repository owner reads that list (and reverts a commit on `main` if something is wrong)
4. The repository owner runs the **Build and Deploy Hugo Site** workflow from the Actions tab
5. The site is published after that run succeeds

The reminder workflow runs on every push to `main` and can also be started manually from the Actions tab. It has no daily schedule, because GitHub pauses scheduled workflows after 60 days without repository activity.

The website is only published after the manual deploy workflow runs.

## Repository Owner Notes

**Adding and removing contributors:** invite or remove the person's email address in the Pages CMS interface (**Collaborators**) and send them the editor link above. Pages CMS collaborators can edit content and media only: they cannot change `.pages.yml`, workflows, or other settings. Each commit carries the author's name, so the reminder issue shows who changed what.

**Branch protection:** `main` requires pull requests, but Pages CMS saves by collaborators are not blocked by it (the Pages CMS app is allowed to commit). The manual deploy is the approval step. Review the reminder issue before every deployment.

**Images:** the deploy workflow shrinks images in the build copy only (`scripts/optimize-images.sh`: fit within 2000 px, recompress, strip metadata such as GPS location). The originals stay unchanged in the repository, so the live site is light, but photos with GPS data stay in the public git history. Ask contributors to remove location data if that matters.

**One-time setting:** **Settings -> Actions -> General -> Workflow permissions** set to **Read repository contents** (each workflow declares the permissions it needs).

## Content Areas

Use these collections in Pages CMS:

- **News** for project updates and announcements
- **Partners** for partner profile pages
- **Pilot Sites** for pilot site pages

Preview text on cards/lists:

- Use the **summary** field in each entry to control preview text shown on listing cards
- If **summary** is left empty, the site automatically uses the beginning of the page body as fallback preview text

For images:

- Add pictures with the **Main picture** and **Pictures** fields, or with the image button in the text editor
- Photos straight from a phone are fine: the website uses smaller copies automatically
- Use JPEG, PNG or WebP. iPhone HEIC files are not supported: share or export them as JPEG first
- Stored images are served from `/images/...`

## Using AI Assistants

You may use an AI assistant (ChatGPT, Claude, etc.) to help write text, but:

- You are responsible for the accuracy of everything you publish: check names, numbers, quotes, and links
- Keep changes small and focused
- Never paste confidential or personal data into an AI tool or into the site

## Good to Know

- Changes are published only after the repository owner runs the manual deploy workflow
- Keep titles and summaries short and clear
- Do not paste confidential or personal data; the repository and site are public
- If you are unsure where something belongs, ask the project owner

---

If you need help, contact the project owner or the person responsible for maintaining the website.
