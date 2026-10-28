# CoffeeLand Website

CoffeeLand is a Hugo-based website for sharing project updates, pilot site work, partner collaborations, and practical resources focused on sustainable coffee production.

Live site: [https://coffeeland.nibio.no/](https://coffeeland.nibio.no/)

## For Partners: Editing Content

Partners use Pages CMS for editing content:

- Open the editor link in the website footer (or the Pages CMS invitation email)
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
2. Run local server:
   ```bash
   hugo server -D
   ```
3. Open: `http://localhost:1313/`

## Publishing Runbook (maintainers)

Contributors save in Pages CMS, and every save is a commit on `main`. **Nothing is public until a maintainer deploys.** The deploy is the approval step.

**1. Get notified.** The workflow `deployment-reminder.yml` runs on every push to `main` and keeps one issue open, "Pending deployment on main". It lists the commits since the last deployment (author and message) and the changed files; files that are not content or images are marked with a warning sign. GitHub emails you when that issue is created and when it is closed. To receive these emails, open the repository, then **Watch → Custom → Issues**. The issue text is edited on later saves, which does not send another email, so open the issue from time to time. The workflow has no daily schedule (GitHub pauses scheduled workflows after 60 days of inactivity); run it from the Actions tab to re-check.

**2. Review.** Read the issue. If a commit is wrong, undo it on `main`:
```bash
git revert <sha> && git push
```
(or use **Revert** on the commit's page on GitHub).

**3. Deploy.**
1. Open https://github.com/johannesrahlf/coffeeland-website/actions/workflows/hugo.yml
2. **Run workflow** (branch `main`) and confirm. From a terminal: `gh workflow run hugo.yml`
3. Running the workflow is the approval: there is no second confirmation. The `github-pages` environment only allows deployments from `main`
4. After about two minutes the site is live. The reminder issue closes on the next run of the reminder workflow (next push to `main`, or run it manually)

**Images:** the deploy build shrinks images in its own copy (`scripts/optimize-images.sh`: fit within 2000 px, recompress, remove metadata such as GPS location). Originals stay unchanged in the repository, so photos with GPS data remain in the public git history.

**Contributors:** invite or remove people in Pages CMS → **Collaborators** (email address, no GitHub account needed). They can only edit content and media, not `.pages.yml`, workflows or settings.

## Handing Over Maintenance

The maintainer tasks are: watch the reminder issue, review and deploy (above), and invite contributors. Another person can take these over:

1. **GitHub account with access:** add them under **Settings → Collaborators** with the **Write** role. That is enough to start the deploy workflow (anyone with Write access can deploy) and to manage collaborators in Pages CMS. Use **Admin** only for someone who should also change settings or protection rules
2. **Notifications:** they set **Watch → Custom → Issues** on the repository
3. **Pages CMS:** they sign in with GitHub and open the repository; they then see **Collaborators** in the sidebar if they have repository access
4. **Backup:** keep at least two people with Admin access, so the repository is never left without an administrator
5. Update the maintainer name in [.github/CODEOWNERS](./.github/CODEOWNERS) if the owner changes, and in the instructions for AI tools in [AGENTS.md](./AGENTS.md)

## Image Management

- Site images in `static/images/` are stored as regular files (not LFS) so Pages CMS can preview them
- The deploy workflow shrinks images in the build copy only (`scripts/optimize-images.sh`: max 2000 px, recompressed, metadata removed); originals stay unchanged in the repository, so phone photos are fine

## Access Control

- **Partners**: edit content through Pages CMS directly on `main`, invited by email in Pages CMS → Collaborators; saves are published only when a maintainer runs the deploy
- **Maintainers**: can change configuration, theme and workflows
- Protected by [.github/CODEOWNERS](./.github/CODEOWNERS)
- Pages CMS collaborators save directly to `main` (the Pages CMS app is not blocked by branch protection); the manual deploy is the approval step, reviewed via the reminder issue
- Give GitHub collaborators the **Write** role at most (never Maintain or Admin, except for maintainers)

## Maintenance

- Add new contributors: invite their email in Pages CMS → Collaborators and send them the editor link (no GitHub account needed)
- Update Hugo: change the version in `.github/workflows/hugo.yml`

## Troubleshooting

**Images not showing?**
- Images live in `static/images/` as normal files (not Git LFS); check the file name and that the path in the content starts with `/images/`

**Build failing?**
- Check Hugo version: `hugo version` (must be v0.160.0+)
- Check GitHub Actions tab for error details

**Want to edit locally?**
- Clone repo: `git clone https://github.com/johannesrahlf/coffeeland-website`
- Run `hugo server -D`
- Edit files, test locally, push when ready
