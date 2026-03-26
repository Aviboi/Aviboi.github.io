/**
 * Main JavaScript for avramdreyer.com
 * Handles mobile menu, smooth scrolling, and UI enhancements
 */

(function() {
  'use strict';

  // =============================================================================
  // Mobile Menu Toggle
  // =============================================================================
  
  const menuToggle = document.querySelector('.menu-toggle');
  const sidebarNav = document.querySelector('.sidebar-nav');
  
  if (menuToggle && sidebarNav) {
    menuToggle.addEventListener('click', function() {
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      
      // Toggle aria-expanded attribute
      this.setAttribute('aria-expanded', !isExpanded);
      
      // Toggle nav visibility
      sidebarNav.classList.toggle('open');
      
      // Prevent body scroll when menu is open on mobile
      if (window.innerWidth <= 768) {
        document.body.style.overflow = !isExpanded ? 'hidden' : '';
      }
    });
    
    // Close menu when clicking nav links on mobile
    const navLinks = sidebarNav.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
      link.addEventListener('click', function() {
        if (window.innerWidth <= 768) {
          menuToggle.setAttribute('aria-expanded', 'false');
          sidebarNav.classList.remove('open');
          document.body.style.overflow = '';
        }
      });
    });
    
    // Reset menu state on window resize
    window.addEventListener('resize', function() {
      if (window.innerWidth > 768) {
        menuToggle.setAttribute('aria-expanded', 'false');
        sidebarNav.classList.remove('open');
        document.body.style.overflow = '';
      }
    });
  }

  // =============================================================================
  // Smooth Scrolling for Anchor Links
  // =============================================================================
  
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      const targetId = this.getAttribute('href');
      
      // Skip if it's just "#"
      if (targetId === '#') return;
      
      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        e.preventDefault();
        targetElement.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
        
        // Update URL without jumping
        history.pushState(null, null, targetId);
      }
    });
  });

  // =============================================================================
  // External Link Icons & Security
  // =============================================================================
  
  // Add rel="noopener noreferrer" to external links for security
  document.querySelectorAll('a[target="_blank"]').forEach(link => {
    const rel = link.getAttribute('rel') || '';
    if (!rel.includes('noopener')) {
      link.setAttribute('rel', (rel + ' noopener noreferrer').trim());
    }
  });

  // =============================================================================
  // Back to Top Button (optional, only show on long pages)
  // =============================================================================
  
  // Create back to top button if content is long enough
  if (document.body.scrollHeight > window.innerHeight * 2) {
    const backToTop = document.createElement('button');
    backToTop.innerHTML = '↑';
    backToTop.className = 'back-to-top';
    backToTop.setAttribute('aria-label', 'Back to top');
    backToTop.style.display = 'none';
    document.body.appendChild(backToTop);
    
    // Show/hide on scroll
    let scrollTimeout;
    window.addEventListener('scroll', function() {
      clearTimeout(scrollTimeout);
      
      if (window.pageYOffset > 300) {
        backToTop.style.display = 'flex';
      } else {
        backToTop.style.display = 'none';
      }
    });
    
    // Scroll to top on click
    backToTop.addEventListener('click', function() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  }

  // =============================================================================
  // Lazy Load Images (for browsers that don't support native lazy loading)
  // =============================================================================
  
  if ('loading' in HTMLImageElement.prototype === false) {
    // Fallback for older browsers
    const images = document.querySelectorAll('img[loading="lazy"]');
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src || img.src;
          img.removeAttribute('loading');
          observer.unobserve(img);
        }
      });
    });
    
    images.forEach(img => imageObserver.observe(img));
  }

  // =============================================================================
  // Print Styles Helper
  // =============================================================================
  
  // Expand mobile menu for printing
  window.addEventListener('beforeprint', function() {
    if (window.innerWidth <= 768 && sidebarNav) {
      sidebarNav.classList.add('print-expand');
    }
  });
  
  window.addEventListener('afterprint', function() {
    if (sidebarNav) {
      sidebarNav.classList.remove('print-expand');
    }
  });

  // =============================================================================
  // Keyboard Navigation Improvements
  // =============================================================================
  
  // Allow closing mobile menu with Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && menuToggle && sidebarNav) {
      if (menuToggle.getAttribute('aria-expanded') === 'true') {
        menuToggle.setAttribute('aria-expanded', 'false');
        sidebarNav.classList.remove('open');
        document.body.style.overflow = '';
        menuToggle.focus();
      }
    }
  });

  // =============================================================================
  // Performance: Reduce Motion for Users with Preference
  // =============================================================================
  
  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
  
  if (prefersReducedMotion.matches) {
    // Disable smooth scrolling for users who prefer reduced motion
    document.documentElement.style.scrollBehavior = 'auto';
  }

  // =============================================================================
  // Console Easter Egg (optional - remove if not wanted)
  // =============================================================================
  
  console.log('%cHi there! 👋', 'font-size: 20px; font-weight: bold;');
  console.log('%cInterested in how this site works?', 'font-size: 14px;');
  console.log('%cCheck out the source: https://github.com/Aviboi/aviboi.github.io', 'font-size: 12px; color: #2a5db0;');

})();
