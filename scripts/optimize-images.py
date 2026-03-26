#!/usr/bin/env python3
"""
Image optimization script for the website.
Compresses images in assets/images/ directory to reduce file sizes.

Usage:
    python scripts/optimize-images.py [--quality 85] [--check-only]
"""

import argparse
from pathlib import Path
from PIL import Image


def optimize_image(input_path: Path, quality: int = 85, dry_run: bool = False):
    """Optimize a single image file."""
    try:
        img = Image.open(input_path)
        original_size = input_path.stat().st_size
        
        # Create temporary optimized version
        temp_path = input_path.with_suffix('.optimized' + input_path.suffix)
        
        if input_path.suffix.lower() in ['.jpg', '.jpeg']:
            img.save(temp_path, 'JPEG', optimize=True, quality=quality)
        elif input_path.suffix.lower() == '.png':
            # For PNG, optimize without quality loss
            img.save(temp_path, 'PNG', optimize=True)
        else:
            print(f"⚠️  Skipping {input_path.name} (unsupported format)")
            return
        
        optimized_size = temp_path.stat().st_size
        savings = (1 - optimized_size / original_size) * 100
        
        if savings > 5:  # Only replace if we save more than 5%
            print(f"✅ {input_path.name}: {original_size/1024:.1f}KB → {optimized_size/1024:.1f}KB ({savings:.1f}% smaller)")
            if not dry_run:
                temp_path.replace(input_path)
            else:
                temp_path.unlink()
        else:
            print(f"ℹ️  {input_path.name}: Already optimized ({savings:.1f}% potential savings)")
            temp_path.unlink()
            
    except Exception as e:
        print(f"❌ Error optimizing {input_path.name}: {e}")


def main():
    parser = argparse.ArgumentParser(description='Optimize website images')
    parser.add_argument('--quality', type=int, default=85, help='JPEG quality (1-100, default: 85)')
    parser.add_argument('--check-only', action='store_true', help='Check sizes without modifying files')
    parser.add_argument('--path', type=str, default='assets/images', help='Path to images directory')
    
    args = parser.parse_args()
    
    images_dir = Path(args.path)
    if not images_dir.exists():
        print(f"❌ Directory not found: {images_dir}")
        return
    
    print(f"🔍 Scanning {images_dir}...")
    image_files = list(images_dir.glob('*.jpg')) + list(images_dir.glob('*.jpeg')) + list(images_dir.glob('*.png'))
    
    if not image_files:
        print("No images found.")
        return
    
    print(f"Found {len(image_files)} image(s)\n")
    
    for img_path in sorted(image_files):
        optimize_image(img_path, quality=args.quality, dry_run=args.check_only)
    
    print("\n✨ Done!")


if __name__ == '__main__':
    main()
