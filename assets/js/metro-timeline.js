// Metro Timeline behavior
(function() {
  'use strict';
  
  function initToggleButtons() {
    // Make entire metro-stop-header clickable
    const stopHeaders = document.querySelectorAll('.metro-stop-header');
    
    stopHeaders.forEach(header => {
      header.addEventListener('click', function(e) {
        const stop = this.closest('.metro-stop');
        const details = stop.querySelector('.metro-details');
        const toggleButton = stop.querySelector('.metro-toggle');
        
        if (!details || !toggleButton) return;
        
        const isExpanded = toggleButton.getAttribute('aria-expanded') === 'true';
        
        if (isExpanded) {
          details.style.display = 'none';
          toggleButton.setAttribute('aria-expanded', 'false');
        } else {
          details.style.display = 'block';
          toggleButton.setAttribute('aria-expanded', 'true');
        }
      });
    });
  }

  function initMetroTimeline() {
    initToggleButtons();
  }

  // Run when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMetroTimeline);
  } else {
    // DOM already loaded
    initMetroTimeline();
  }
})();