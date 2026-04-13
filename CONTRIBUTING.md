# Contributing to CoffeeLand Website

## Prerequisites

- Hugo extended (v0.125+ recommended)
- Go (needed for Hugo modules)

## Local Development

1. Install dependencies:
   - `hugo mod tidy`
2. Start local server:
   - `hugo server -D`
3. Open:
   - `http://localhost:1313/coffeeland-website/`

## Content Workflow

- News posts live in `content/news/`.
- Static section pages live in:
  - `content/about/_index.md`
  - `content/pilot-sites/_index.md`
  - `content/partners/_index.md`
  - `content/resources/_index.md`
  - `content/contact/_index.md`

## CMS Workflow

- Use Decap CMS at `/admin/` to edit content.
- Every save creates a Git commit in this repository.

## Quality Checklist Before PR

- Run `hugo` and ensure build succeeds.
- Verify links and page navigation.
- Confirm new images are optimized and relevant.
- Ensure no `Zone.Identifier` files are added.
