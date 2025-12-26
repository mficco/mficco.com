# mficco.com - Personal Blog Site

## Overview
A personal website with an easily updatable blog system using simple markdown files.

## Project Structure
```
.
├── _posts/           # Your blog posts go here
├── _site/            # Built website (generated)
├── style.css         # Shared styles
├── index.md          # Home page
├── writing.md        # Writing page
├── books.md          # Books page
├── about.md          # About page
├── build_blog.sh     # Script to build blog
└── Gemfile           # Ruby dependencies
```

## How to Add a Blog Post

**Step 1:** Create a new file in the `_posts` folder with the name: `YYYY-MM-DD-your-title.md`

Example: `_posts/2025-01-15-my-first-post.md`

**Step 2:** Write your post content in markdown format:

```markdown
---
title: My Blog Post Title
date: 2025-01-15
---

Your blog post content goes here.

You can use:
- **Bold text** with `**text**`
- *Italic text* with `*text*`
- Lists like this
- [Links](url)
```

**Step 3:** Run the build command from the Replit terminal:
```
bash build_blog.sh
```

The website will automatically rebuild and your post will appear on the `/blog/` page.

## File Format for Posts

The filename format is important: `YYYY-MM-DD-title.md`
- YYYY = Year (2025)
- MM = Month (01-12)
- DD = Day (01-31)
- title = Your post title (use hyphens for spaces)

Example filenames:
- `2025-01-15-welcome-to-my-blog.md`
- `2025-02-20-my-thoughts.md`

## Website Structure
- Home page: `/` (index.md)
- Blog page: `/blog/` (all posts listed here)
- Writing page: `/writing/` (writing.md)
- Books page: `/books/` (books.md)
- About page: `/about/` (about.md)

## Technology
- Pure HTML/CSS with Roboto Mono font
- Simple bash script to build markdown → HTML
- Python HTTP server for local testing
- No databases or complex dependencies needed

## Updates to Static Pages

To edit the home, writing, books, or about pages, just edit the corresponding `.md` file:
- Home: `index.md`
- Writing: `writing.md`
- Books: `books.md`
- About: `about.md`

Then rebuild: `bash build_blog.sh`

## Notes
- The `_site/` folder contains the built website - don't edit files there directly
- Always edit `.md` files in the root directory or `_posts/` folder
- Run `build_blog.sh` after making changes to see them on the website
