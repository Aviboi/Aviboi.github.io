---
layout: page
title: Projects
permalink: /projects/
---

# Projects

{% assign projects = site.pages 
  | where_exp: "p", "p.path contains 'projects/'" 
  | where_exp: "p", "p.path != 'projects/index.md'"
  | sort: "year-month" 
  | reverse %}

{% for project in projects %}
{% if project.visible %}
<div class="project-item">
  <a href="{{ project.url | relative_url }}" class="project-title">
    {{ project.title }}
  </a>
  {% if project.year-month %}
    <span class="project-date">{{ project.year-month }}</span>
  {% endif %}
  {% if project.description %}
    <p class="project-description">{{ project.description }}</p>
  {% endif %}
</div>
{% endif %}
{% endfor %}
