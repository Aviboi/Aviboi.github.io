# Utility Scripts

## optimize-images.py

Compresses images in the `assets/images/` directory to reduce file sizes without significant quality loss.

**Requirements:**
```bash
pip install Pillow
```

**Usage:**
```bash
# Optimize all images in assets/images/
python scripts/optimize-images.py

# Check what would be optimized without modifying files
python scripts/optimize-images.py --check-only

# Optimize with custom JPEG quality (1-100)
python scripts/optimize-images.py --quality 90

# Optimize images in a different directory
python scripts/optimize-images.py --path path/to/images
```

**What it does:**
- PNG files: Lossless optimization using PIL's optimize flag
- JPEG files: Quality-based compression (default: 85)
- Only replaces images if savings > 5%
- Preserves original image dimensions and format
