#!/usr/bin/env python3

import re
import sys
from pathlib import Path


def process(input_path: Path, output_path: Path) -> None:
    html = input_path.read_text(encoding="utf-8")

    # 1. Remove <style> blocks
    html = re.sub(r"<style[\s\S]*?</style>", "", html, flags=re.IGNORECASE)

    # 2. Extract <body> content
    body_match = re.search(r"<body[^>]*>([\s\S]*?)</body>", html, re.IGNORECASE)
    body = body_match.group(1).strip() if body_match else html

    # 3. Replace only the first <h1> with "CV"
    body = re.sub(
        r"<h1[^>]*>.*?</h1>",
        "<h1>CV</h1>",
        body,
        count=1,
        flags=re.IGNORECASE | re.DOTALL,
    )

    # 4. Remove contact info block between <h1> and Education section
    body = re.sub(
        r"(</h1>).*?(<h1[^>]*>\s*Education\s*</h1>)",
        r"\1\n\2",
        body,
        count=1,
        flags=re.IGNORECASE | re.DOTALL,
    )

    # 5. Add <div> wrapper around <h1> and <h2> sections for styling
    body = re.sub(
        r"(<h[12][^>]*>.*?</h[12]>)",
        r'<div class="cv-section">\n\1\n</div>',
        body,
        flags=re.IGNORECASE | re.DOTALL,
    )

    # 6. Build download link
    download_link = (
        '<div class="cv-download-bar">\n'
        '  <a href="/assets/files/cv.pdf" class="cv-download-link" target="_blank" rel="noopener noreferrer">'
        "↑ Open PDF"
        "</a>\n"
        "</div>\n"
    )

    # 7. Insert download link immediately after the opening <h1>CV</h1>
    body = body.replace("</h1>", "</h1>\n" + download_link, 1)

    # 8. Wrap in Jekyll front matter
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