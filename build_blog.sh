#!/bin/bash
# Simple blog builder - converts markdown files in _posts to HTML

echo "Building blog..."

# Create _site if it doesn't exist
mkdir -p _site _site/blog

# Copy static files
cp style.css _site/
cp _layouts/default.html _site/home.html 2>/dev/null || true

# Build regular pages from markdown
for page in index writing books about; do
  if [ -f "${page}.md" ]; then
    cat > "_site/${page}.html" << 'PAGEEND'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>mficco.com</title>
  <link rel="stylesheet" href="/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <nav>
    <a href="/">Home</a>
    <a href="/blog/">Blog</a>
    <a href="/writing/">Writing</a>
    <a href="/books/">Books</a>
    <a href="/about/">About</a>
  </nav>
PAGEEND

    # Extract content from markdown (skip front matter)
    sed -n '/^---$/,/^---$/!p' "${page}.md" | tail -n +3 >> "_site/${page}.html"
    
    echo "</body></html>" >> "_site/${page}.html"
  fi
done

# Build blog post pages
for post in _posts/*.md; do
  if [ -f "$post" ]; then
    filename=$(basename "$post" .md)
    output="_site/blog/${filename}.html"
    
    echo "Processing: $post"
    
    cat > "$output" << 'PAGEEND'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blog - mficco.com</title>
  <link rel="stylesheet" href="/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <nav>
    <a href="/">Home</a>
    <a href="/blog/">Blog</a>
    <a href="/writing/">Writing</a>
    <a href="/books/">Books</a>
    <a href="/about/">About</a>
  </nav>
PAGEEND
    
    # Extract title
    title=$(grep "^title:" "$post" | sed 's/title: //' | sed "s/'//g" | sed 's/"//g')
    echo "  <h1>$title</h1>" >> "$output"
    
    # Add content (skip front matter)
    sed -n '/^---$/,/^---$/!p' "$post" | tail -n +3 >> "$output"
    
    echo "</body></html>" >> "$output"
  fi
done

# Generate blog index
cat > _site/blog/index.html << 'BLOGEND'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blog - mficco.com</title>
  <link rel="stylesheet" href="/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <nav>
    <a href="/">Home</a>
    <a href="/blog/">Blog</a>
    <a href="/writing/">Writing</a>
    <a href="/books/">Books</a>
    <a href="/about/">About</a>
  </nav>

  <h1>Blog</h1>
BLOGEND

# Add blog post links (newest first)
for post in $(ls -r _posts/*.md 2>/dev/null); do
  if [ -f "$post" ]; then
    filename=$(basename "$post" .md)
    title=$(grep "^title:" "$post" | sed 's/title: //' | sed "s/'//g" | sed 's/"//g')
    date=$(grep "^date:" "$post" | sed 's/date: //')
    echo "  <h2><a href=\"/blog/${filename}/\">$title</a></h2>" >> _site/blog/index.html
    echo "  <p><small>$date</small></p>" >> _site/blog/index.html
  fi
done

echo "</body></html>" >> _site/blog/index.html

echo "✓ Blog built successfully!"
