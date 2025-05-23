
function loadMermaid() {
  if (window.mermaid) return; // Already loaded
  const script = document.createElement('script');
  script.src = 'https://cdn.jsdelivr.net/npm/mermaid@11.6.0/dist/mermaid.min.js';
  script.onload = () => {
    mermaid.initialize({
  securityLevel: 'loose',
  theme: 'base',
  flowchart: {
    useMaxWidth: false,      // Prevent full-width scaling
    htmlLabels: true,        // Allows <br> and inline HTML
    nodeSpacing: 25,         // Horizontal spacing between nodes (default: 50)
    rankSpacing: 25,         // Vertical spacing between ranks/layers (default: 50)
  },
  themeVariables: {
    fontSize: '11px',
    fontFamily: 'sans-serif'
  }
});
  };
  document.head.appendChild(script);
}

loadMermaid();