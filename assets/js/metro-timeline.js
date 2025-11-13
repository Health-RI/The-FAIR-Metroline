// Metro Timeline behavior
document.addEventListener('DOMContentLoaded', function() {
  initMetroTimeline();
});

function initMetroTimeline() {
  initToggleButtons();
  initExampleTabs();
}

function initToggleButtons() {
  const toggleButtons = document.querySelectorAll('.metro-toggle');
  
  toggleButtons.forEach(button => {
    button.addEventListener('click', function() {
      const stop = this.closest('.metro-stop');
      const details = stop.querySelector('.metro-details');
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      
      if (details) {
        details.style.display = isExpanded ? 'none' : 'block';
        this.setAttribute('aria-expanded', !isExpanded);
      }
    });
  });
}

function initExampleTabs() {
  const exampleTabs = document.querySelectorAll('.example-tab');
  
  exampleTabs.forEach(tab => {
    tab.addEventListener('click', function() {
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
