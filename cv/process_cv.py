#!/usr/bin/env python3
"""
Strip RenderCV's embedded styles from the HTML output and
wrap the content in a Jekyll front-matter shell so it
renders inside your site layout.
"""

import re
import sys
from pathlib import Path


def process(input_path: Path, output_path: Path) -> None:
    html = input_path.read_text(encoding="utf-8")

    # 1. Remove <style> blocks (RenderCV's embedded CSS)
    html = re.sub(r"<style[\s\S]*?</style>", "", html, flags=re.IGNORECASE)

    # 2. Extract just the <body> content
    body_match = re.search(r"<body[^>]*>([\s\S]*?)</body>", html, re.IGNORECASE)
    body = body_match.group(1).strip() if body_match else html

    # 3. Build download link
    download_link = '''<div class="cv-download-bar">
  <a href="/assets/files/cv.pdf" class="cv-download-link">
    ↓ Open PDF Version
  </a>
</div>'''

    # 4. Wrap in Jekyll front matter
    jekyll_page = f"""---
layout: default
title: CV
permalink: /cv/
---

<div class="cv-content">
{body}
</div>
"""
    output_path.write_text(jekyll_page, encoding="utf-8")
    print(f"Processed CV written to {output_path}")


if __name__ == "__main__":
    src = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("cv/output/cv.html")
    dst = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("cv.html")
    process(src, dst)