# mficco.com - Personal Blog Site with Jekyll

## Overview
A personal website with an easily updatable blog system powered by Jekyll. Blog posts are published in your Writing section. Write posts in simple markdown, and Jekyll automatically generates your website.

## Project Structure
```
.
├── _posts/              # Your blog posts go here (markdown files)
├── _layouts/            # HTML templates (default.html)
├── _site/               # Generated website (auto-created by Jekyll)
├── _config.yml          # Jekyll configuration
├── Gemfile              # Ruby dependencies
├── style.css            # Shared stylesheet
├── index.md             # Home page
├── writing.md           # Writing page (with blog posts)
├── books.md             # Books page
└── about.md             # About page
```

## How to Add a Blog Post

### Step 1: Create a new file in the `_posts` folder
File naming format: `YYYY-MM-DD-your-title.md`

Example: `_posts/2025-01-15-my-thoughts.md`

### Step 2: Write your post in markdown format

```markdown
---
title: My Blog Post Title
date: 2025-01-15
---

Your blog post content goes here.

You can use:
- **Bold text** with `**text**`
- *Italic text* with `*text*`
- [Links](https://example.com)
- Lists like this one
- Code blocks with triple backticks
```

### Step 3: Jekyll automatically rebuilds

Jekyll watches for changes and automatically rebuilds your website. Your post appears on `/writing/` immediately.

## File Naming Convention

The filename format is critical: `YYYY-MM-DD-title.md`
- YYYY = Year (2025)
- MM = Month (01-12)
- DD = Day (01-31)
- title = Your post title (use hyphens instead of spaces)

### Examples:
- `2025-01-15-welcome-to-my-thoughts.md`
- `2025-02-20-my-thoughts-on-reading.md`
- `2025-03-05-a-great-day.md`

## Updating Static Pages

To edit your home page, books, or about pages, simply edit:
- Home: `index.md`
- Books: `books.md`
- About: `about.md`

Jekyll automatically regenerates the site when you save.

## Website Pages

- **Home** (`/`) - Your introduction
- **Writing** (`/writing/`) - Blog posts listed here (newest first)
- **Books** (`/books/`) - Books list
- **About** (`/about/`) - About you

## How Jekyll Works

Jekyll is a static site generator that:
1. Reads your markdown files
2. Converts them to HTML using templates
3. Generates a complete static website in the `_site/` folder
4. Serves it on port 5000

**Important:** Don't edit files in the `_site/` folder - they get regenerated. Always edit `.md` files instead.

## Technical Details

- **Language:** Ruby (Jekyll)
- **Template Engine:** Liquid
- **Markdown Parser:** Kramdown
- **Font:** Roboto Mono from Google Fonts
- **Server:** Jekyll's built-in development server

## Running Locally

The workflow automatically runs Jekyll with:
```
bundle exec jekyll serve --host 0.0.0.0 --port 5000
```

This:
- Watches for file changes and auto-rebuilds
- Serves the site on http://localhost:5000
- Makes the site available to the Replit preview

## Gemfile Dependencies

The `Gemfile` specifies:
- `jekyll` - The site generator
- `jekyll-feed` - RSS feed support

Run `bundle install` if you ever need to update dependencies.

## Tips

- Blog posts are processed in reverse chronological order (newest first)
- Jekyll includes the post excerpt (first paragraph) on the writing page
- The site rebuilds automatically when you save files
- Use proper markdown syntax for best formatting results
- Keep filenames simple (no special characters except hyphens)

Happy blogging!
