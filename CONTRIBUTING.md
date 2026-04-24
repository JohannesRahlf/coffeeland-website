# Contributing to CoffeeLand Website

Thank you for contributing to CoffeeLand. This guide is for project partners using GitHub in the web browser.

You do not need to install any software or use the command line.

## Easiest Option: Submit a News Form

If you are not comfortable editing files, use the News Submission Form:

- Open: https://github.com/johannesrahlf/coffeeland-website/issues/new?template=news-submission.yml
- Fill in the form fields
- Submit the issue

The repository owner will review your submission and publish it on the website.

## How Publishing Works

All changes should be submitted for review before they are published.

Please do not commit directly to the `main` branch. Instead:

1. Make your change in GitHub
2. Choose **"Create a new branch for this commit"**
3. Click **"Propose changes"**
4. Open a pull request
5. Wait for the repository owner to review and merge it

The website is only published after approved changes are merged into `main`.

## Add a News Post

1. Go to the [news folder](https://github.com/johannesrahlf/coffeeland-website/tree/main/content/news)
2. Open the sample file: [content/news/sample-news-post.md](https://github.com/johannesrahlf/coffeeland-website/blob/main/content/news/sample-news-post.md)
3. Click **"Copy raw file"** or copy the contents into a new file
4. Go back to the [news folder](https://github.com/johannesrahlf/coffeeland-website/tree/main/content/news)
5. Click **"Add file"** → **"Create new file"**
6. Name it `my-post.md`
7. Paste the sample content and update it for your news item:
   ```markdown
   +++
   title = "Your Post Title"
   date = 2026-04-24T00:00:00+00:00
   draft = false
   author = "Your Name"
   summary = "Brief summary for the news feed"
   +++

   Your post content here...
   ```
8. Select **"Create a new branch for this commit"**
9. Click **"Propose changes"**
10. Open a pull request for review

Notes:
- Use a short, clear file name such as `workshop-update.md`
- Add one short summary so the news page shows a useful preview
- Set `draft = false` when the post is ready to publish
- Do not edit the sample file itself; create a new file for each post

## Upload Images

1. Go to the [images folder](https://github.com/johannesrahlf/coffeeland-website/tree/main/static/images)
2. Click **"Add file"** → **"Upload files"**
3. Drag and drop your image files
4. Select **"Create a new branch for this commit"**
5. Click **"Propose changes"**
6. Open a pull request for review

To show an image inside a news post or page, add this line in the Markdown text:

```markdown
![Short description of the image](/images/your-image-file.jpg)
```

Example:

```markdown
![Field visit in Bale](/images/field-visit-bale.jpg)
```

Notes:
- Upload the image first, then add it to the page or news post
- Use short file names with lowercase letters and hyphens when possible
- Replace the alt text with a short description of what the image shows

## Edit an Existing Page

1. Open the page file you want to change in GitHub
2. Click the pencil icon to edit
3. Update the text
4. Select **"Create a new branch for this commit"**
5. Click **"Propose changes"**
6. Open a pull request for review

Main pages are stored here:
- About: [content/about/_index.md](https://github.com/johannesrahlf/coffeeland-website/blob/main/content/about/_index.md)
- Contact: [content/contact/_index.md](https://github.com/johannesrahlf/coffeeland-website/blob/main/content/contact/_index.md)
- Resources: [content/resources/_index.md](https://github.com/johannesrahlf/coffeeland-website/blob/main/content/resources/_index.md)

## Good to Know

- Changes are published only after the repository owner approves and merges the pull request
- Keep titles and summaries short and clear
- Use plain text or simple Markdown
- If you are unsure where something belongs, ask the project owner before opening the pull request

---

If you need help, contact the project owner or the person responsible for maintaining the website.

