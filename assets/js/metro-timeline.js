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

  function initExampleTabs() {
    const exampleTabs = document.querySelectorAll('.example-tab');
    
    exampleTabs.forEach(tab => {
      tab.addEventListener('click', function(e) {
        e.stopPropagation(); // Prevent triggering the header click
        const exampleId = this.getAttribute('data-example');
        const container = this.closest('.metro-examples');
        
        // Deactivate all tabs and panels
        container.querySelectorAll('.example-tab').forEach(t => t.classList.remove('active'));
        container.querySelectorAll('.example-panel').forEach(p => p.classList.remove('active'));
        
        // Activate selected tab and panel
        this.classList.add('active');
        container.querySelector(`.example-panel[data-example="${exampleId}"]`).classList.add('active');
      });
    });
  }
  
  function initMetroTimeline() {
    initToggleButtons();
    initExampleTabs();
  }

  // Run when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMetroTimeline);
  } else {
    // DOM already loaded
    initMetroTimeline();
  }
})();