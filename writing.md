---
layout: default
title: Writing
permalink: /writing/
---

# Writing

{% for post in site.posts %}
  **[{{ post.title }}]({{ post.url | relative_url }})**  
  *{{ post.date | date: "%B %d, %Y" }}*
  
  {{ post.excerpt }}
  
  [Read More]({{ post.url | relative_url }})

{% endfor %}
