#!/usr/bin/env python3
"""Optimize a single image file."""
import sys
from pathlib import Path
from PIL import Image

if len(sys.argv) != 2:
    print("Usage: optimize-single-image.py <image_path>")
    sys.exit(1)

file_path = Path(sys.argv[1])
if not file_path.exists():
    print(f"Error: {file_path} does not exist")
    sys.exit(1)

try:
    img = Image.open(file_path)
    if file_path.suffix.lower() in ['.jpg', '.jpeg']:
        img.save(file_path, 'JPEG', optimize=True, quality=85)
    elif file_path.suffix.lower() == '.png':
        img.save(file_path, 'PNG', optimize=True)
    print(f"Optimized: {file_path}")
except Exception as e:
    print(f"Error optimizing {file_path}: {e}")
    sys.exit(1)
