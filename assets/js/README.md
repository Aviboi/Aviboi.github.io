# JavaScript Documentation

## Overview

The `main.js` file provides essential interactive functionality for the website with a focus on accessibility, performance, and user experience.

## Features

### 1. Mobile Menu Toggle
**What it does:**
- Opens/closes the navigation menu on mobile devices
- Prevents body scroll when menu is open
- Animated hamburger icon (three bars → X)
- Closes automatically when a navigation link is clicked
- Resets state on window resize

**Accessibility:**
- Uses `aria-expanded` attribute for screen readers
- Keyboard accessible (can be closed with Escape key)
- Focus management

### 2. Smooth Scrolling
**What it does:**
- Enables smooth scrolling for anchor links (links starting with `#`)
- Updates browser URL without jumping
- Works for in-page navigation

**Example:**
```html
<a href="#section-2">Jump to Section 2</a>
```

### 3. External Link Security
**What it does:**
- Automatically adds `rel="noopener noreferrer"` to all external links
- Prevents security vulnerabilities from `target="_blank"` links
- No manual configuration needed

### 4. Back to Top Button
**What it does:**
- Automatically appears on long pages (>2x viewport height)
- Shows after scrolling down 300px
- Smooth scroll back to top on click
- Hidden on print

**Styling:**
- Fixed position in bottom-right corner
- Circular button with arrow (↑)
- Hover effects with lift animation
- Responsive sizing for mobile

### 5. Lazy Loading Fallback
**What it does:**
- Provides fallback for browsers that don't support native lazy loading
- Uses Intersection Observer API
- Only loads images when they enter the viewport

### 6. Print Optimization
**What it does:**
- Expands mobile menu for printing
- Hides back-to-top button
- Ensures navigation is visible in printed output

### 7. Accessibility Enhancements
**What it does:**
- Escape key closes mobile menu
- Respects `prefers-reduced-motion` setting
- Disables smooth scrolling for users who prefer reduced motion

### 8. Console Easter Egg
**What it does:**
- Shows a friendly message in browser console
- Links to GitHub repository
- Can be removed if not desired

## File Size

- **Minified (production)**: ~1.5KB
- **Gzipped**: <1KB
- **Minimal impact** on page load performance

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Graceful degradation for older browsers
- Mobile browsers fully supported

## Testing

**Desktop:**
1. Smooth scrolling with anchor links
2. External link security attributes
3. Back to top button appears after scrolling

**Mobile (<768px):**
1. Hamburger menu toggle works
2. Menu closes when clicking nav links
3. Body scroll prevented when menu open
4. Menu closes with Escape key

**Accessibility:**
1. Navigate with keyboard (Tab, Enter, Escape)
2. Screen reader announces menu state
3. Reduced motion respected

## Customization

### Disable Back to Top Button
Remove lines 95-119 in `main.js`

### Change Smooth Scroll Duration
Smooth scrolling uses browser defaults. To customize, add:
```css
html {
  scroll-behavior: smooth;
}
```

### Adjust Mobile Menu Breakpoint
Currently 768px. To change, update:
- CSS: `@media (max-width: 768px)`
- JS: `if (window.innerWidth <= 768)`

## Dependencies

- **None!** Pure vanilla JavaScript
- No jQuery or other libraries required
- Uses modern browser APIs where available
