# GitHub Actions Workflows

This directory contains automated workflows for the website.

## Workflows

### `rendercv.yaml` - CV Build Automation
**Triggers:**
- When `cv/cv.yaml` is modified
- Manual dispatch via Actions tab

**What it does:**
1. Installs RenderCV with full dependencies
2. Generates PDF, HTML, Markdown, and PNG from `cv/cv.yaml`
3. Processes HTML with `cv/process_cv.py` for Jekyll integration
4. Copies PDF to `assets/files/cv.pdf`
5. Commits generated files back to the repository

**Testing locally:**
```bash
act -j build-cv
```

### `optimize-images.yaml` - Automatic Image Optimization
**Triggers:**
- When images in `assets/images/` or `assets/files/` are modified
- On pull requests that add/modify images
- Manual dispatch via Actions tab

**What it does:**
1. Detects which image files were added or modified
2. Optimizes PNG files (lossless)
3. Compresses JPEG files (quality=85)
4. On **push to main**: Automatically commits optimized images
5. On **pull requests**: Posts a comment with optimization report

**Behavior:**
- **Push to main**: Auto-commits optimized images with `[skip ci]` to prevent loops
- **Pull requests**: Shows savings report as a PR comment (doesn't auto-commit)
- Only processes images that were actually changed in the commit

**Testing locally:**
```bash
# Test the optimization workflow
act -j optimize-images

# Or manually run the script
python3 scripts/optimize-images.py
```

## Permissions

Both workflows have:
- `contents: write` - To commit generated/optimized files back to the repo
- `pull-requests: write` - To post comments on PRs (optimize-images only)

## Local Testing with act

Install [act](https://github.com/nektos/act) to test workflows locally:

```bash
# macOS
brew install act

# Windows
choco install act-cli

# Or download from releases
```

**Note:** Some features like PR comments may not work fully in local testing, but the main workflow logic will execute.
