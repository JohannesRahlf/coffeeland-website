# Decap CMS Setup Guide

Your CoffeeLand website now has **Decap CMS** integrated for content management. This allows your partners to edit blog posts and pages through a secure web interface.

## Access the CMS Admin

Once deployed, your partners can access the CMS at:
```
https://johannesrahlf.github.io/coffeeland-website/admin/
```

## Setup Instructions

### Step 1: Create a GitHub OAuth Application

1. Go to: `https://github.com/settings/developers` → **OAuth Apps** → **New OAuth App**
2. Fill in the form:
   - **Application name**: CoffeeLand CMS
   - **Homepage URL**: `https://johannesrahlf.github.io/coffeeland-website/`
   - **Authorization callback URL**: `https://api.github.com/login/oauth/authorize`

3. Copy your **Client ID** and generate a **Client Secret**

### Step 2: Update Decap Config

Once you have your OAuth credentials, you need to add them to Decap. There are two options:

#### Option A: Use Netlify (Recommended for simplicity)
1. Deploy your site to Netlify (free tier available)
2. Netlify will automatically handle OAuth for you

#### Option B: Self-host with GitHub Backend (What we're using - requires more setup)
- Your current setup uses GitHub as the backend
- Partners authenticate with their GitHub account
- Changes are committed directly to your repository

### Step 3: Test the CMS

1. Push your changes to GitHub:
   ```bash
   git add .
   git commit -m "Add Decap CMS with pages"
   git push
   ```

2. Wait 1-2 minutes for GitHub Pages to deploy

3. Visit: `https://johannesrahlf.github.io/coffeeland-website/admin/`

4. You'll be prompted to log in with GitHub

## Features Available in CMS

### News & Blog Posts
- Partners can create new blog posts
- Write in Markdown
- Add featured images
- Set publish date
- Add tags and categories
- Set draft/publish status

### Page Editing
Partners can edit:
- About
- Pilot Sites
- Partners
- Resources
- Contact

## Security Notes

- Only people with write access to your GitHub repo can edit content
- All changes appear as commits in your repository
- You can review changes before merging to main
- Everything is version controlled

## Need Help?

For more info: https://decapcms.org/docs/
