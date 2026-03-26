# Copilot Instructions for aviboi.github.io

This is a personal portfolio website built with Jekyll and deployed via GitHub Pages. The site features a custom design with a sidebar navigation and showcases projects, CV, and contact information.

## Build, Test, and Lint Commands

### Local Development

**Using Docker (recommended):**
```bash
# Build and start the development server with live reload
docker-compose up

# Stop the server
docker-compose down
```

The site will be available at `http://localhost:4000` with live reload on port 35729.

**Using Jekyll directly:**
```bash
# Install dependencies
bundle install

# Serve the site locally with live reload
bundle exec jekyll serve --livereload

# Build the site (outputs to _site/)
bundle exec jekyll build
```

### Image Optimization

**Automated (recommended):**
Images are automatically optimized when pushed to main via GitHub Actions.

**Manual optimization:**
```bash
# Requires: pip install Pillow
python scripts/optimize-images.py

# Check what would be optimized without modifying
python scripts/optimize-images.py --check-only
```

See `scripts/README.md` for more options.

### CV Generation

The CV is automatically generated from `cv/cv.yaml` via GitHub Actions when changes are pushed. To test locally with act:

```bash
# Install act if not already installed (https://github.com/nektos/act)

# Run the CV build workflow locally
act -j build-cv
```

The workflow:
1. Uses RenderCV to generate HTML and PDF from `cv/cv.yaml`
2. Runs `cv/process_cv.py` to transform the HTML for Jekyll integration
3. Copies the PDF to `assets/files/cv.pdf`
4. Commits changes back to the repo

To manually build the CV:
```bash
pip install "rendercv[full]"
rendercv render cv/cv.yaml --output-folder output
python3 cv/process_cv.py $(find . -name "*_CV.html" -path "*/output/*" | head -1) cv/index.html
```

## High-Level Architecture

### GitHub Actions Workflows

**`.github/workflows/rendercv.yaml`** - CV build automation:
- Triggers on changes to `cv/cv.yaml` or manual dispatch
- Generates PDF, HTML, and other formats using RenderCV
- Processes output with `cv/process_cv.py` for Jekyll
- Auto-commits generated files

**`.github/workflows/optimize-images.yaml`** - Image optimization automation:
- Triggers when images are added/modified in `assets/images/` or `assets/files/`
- Compresses PNG (lossless) and JPEG (quality=85)
- On push to main: Auto-commits optimized images with `[skip ci]`
- On PRs: Posts optimization report as a comment
- Prevents infinite loops with `[skip ci]` flag

See `.github/workflows/README.md` for testing with `act`.

### Site Structure

```
├── _config.yml               # Jekyll configuration (site metadata, nav links, plugins)
├── _layouts/
│   └── default.html         # Main layout with sidebar, Google Analytics, MathJax support
├── _includes/
│   └── sidebar.html         # Sidebar navigation with social links
├── assets/
│   ├── css/main.css         # Single global stylesheet
│   ├── js/main.js           # Menu toggle and other client-side logic
│   ├── favicon/             # Favicon assets
│   ├── files/               # Downloadable files (CV PDF)
│   └── images/              # Project images and other media
├── cv/
│   ├── cv.yaml              # CV source (RenderCV format)
│   ├── process_cv.py        # Transforms RenderCV HTML for Jekyll
│   └── index.html           # Generated CV page (committed to repo)
├── projects/
│   ├── index.md             # Projects listing page (auto-aggregates project pages)
│   └── [project].md         # Individual project pages
├── contact/                 # Contact page
└── index.md                 # Homepage/About page
```

### Content Flow

1. **Markdown → HTML**: Jekyll processes `.md` files with front matter through layouts
2. **CV Generation**: `cv.yaml` → RenderCV → `process_cv.py` → `cv/index.html` (committed)
3. **Projects**: Individual project files with `visible: true` front matter are automatically listed on `/projects/`
4. **Navigation**: Defined in `_config.yml` under `nav_links`, rendered by `sidebar.html`

### Layout System

- **default.html**: Base layout with Google Analytics, Font Awesome icons, optional MathJax (enabled with `math: true` in front matter)
- **page layout**: Uses the default layout (Jekyll convention, no explicit file needed)
- **Sidebar**: Fixed on desktop, collapsible hamburger menu on mobile

### Styling Approach

- Single `assets/css/main.css` file (no preprocessor, no component files)
- Custom fonts: EB Garamond, Proxima Nova, Montserrat, SUSE
- Responsive design with mobile hamburger menu
- CV-specific classes: `.cv-content`, `.cv-header`, `.cv-section`, `.cv-download-bar`

## Key Conventions

### Project Pages

Project pages follow this structure:

```yaml
---
layout: page
title: Project Name
date: YYYY-MM-DD           # optional, for ordering
year-month: "Month YYYY"   # displayed date
description: Brief description for listing page
permalink: /projects/project-name
math: true                 # enable MathJax if needed
visible: true              # must be true to appear in listing
---
```

- Use `year-month` for display, `date` for sorting in reverse chronological order
- Set `visible: false` to hide works-in-progress
- The `projects/index.md` auto-aggregates pages with `visible: true`

### CV Workflow

**Important**: The CV source of truth is `cv/cv.yaml` (RenderCV format), not `cv/index.html`.

- Edit `cv/cv.yaml` to update CV content
- The GitHub Action automatically rebuilds `cv/index.html` and `assets/files/cv.pdf`
- Do not manually edit `cv/index.html` - it will be overwritten
- `cv/process_cv.py` strips RenderCV styling, extracts body content, wraps sections in `<div class="cv-section">`, and adds Jekyll front matter

### Navigation

Navigation links are defined in `_config.yml` under `nav_links`. The sidebar automatically highlights the active page.

### Site Configuration

All site metadata is in `_config.yml`:
- `author`: Name, bio, email, social links (used in sidebar footer)
- `nav_links`: Sidebar navigation structure
- `plugins`: jekyll-sitemap, jekyll-seo-tag
- GitHub Pages uses `github-pages` gem (currently v232 with Jekyll 3.10.0)

### Docker Environment

- Ruby 3.3-slim base image
- Gems cached in `bundle_cache` volume for faster rebuilds
- Live reload enabled with `--force_polling` (required for Docker volumes)
- Both Jekyll (4000) and livereload (35729) ports exposed

## Performance Optimizations

### Images
- All images in `assets/images/` should be optimized using `scripts/optimize-images.py`
- Images use `loading="lazy"` attribute for lazy loading
- Include descriptive `alt` text for accessibility

### Fonts
- Only load required font weights (EB Garamond and SUSE)
- Use `font-display: swap` via Google Fonts URL parameter
- Preconnect to Google Fonts domains

### JavaScript
- Font Awesome loaded with `defer` attribute
- MathJax only loaded on pages with `math: true` front matter
- Minimal custom JavaScript in `assets/js/main.js`

### SEO
- All pages have custom meta descriptions and keywords
- Open Graph images for social sharing
- `robots.txt` allows all crawlers and references sitemap
- Jekyll SEO tag plugin generates structured data automatically
