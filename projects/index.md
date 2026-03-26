---
layout: page
title: Projects
description: "Engineering projects by Avram Dreyer including NASA HUNCH satellite design, autonomous sailboat development, and mechanical engineering coursework"
keywords: "engineering projects, mechanical design, NASA HUNCH, CubeSat thermal management, autonomous sailboat, Cornell engineering"
author: "Avram Dreyer"
og:type: website
og:title: "Avram Dreyer - Engineering Projects"
og:description: "Explore mechanical engineering and aerospace projects including satellite thermal systems and autonomous vehicles"
twitter:card: summary
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
