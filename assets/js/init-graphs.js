// =============================================
// Mermaid graph interactivity loader
// Supports multiple independent graphs on a page
// Two supported click actions from Mermaid YAML:
//   1. highlightNodeOnly(nodeId, graphId)
//   2. showContentAndHighlightNode(page, nodeId, graphId)
// =============================================

// Mermaid setup
mermaid.initialize({
  startOnLoad: false,
  securityLevel: "loose",
  theme: "base",
  flowchart: {
    useMaxWidth: false,
    htmlLabels: true,
    nodeSpacing: 25,
    rankSpacing: 25
  },
  themeVariables: {
    fontSize: '11px',
    fontFamily: 'sans-serif'
  }
});

console.log("[init] Mermaid initialized");

// Expose functions globally for Mermaid 'click call ...'
window.showContentAndHighlightNode = showContentAndHighlightNode;
window.highlightNodeOnly = highlightNodeOnly;

// Track last highlighted node per graph
const lastHighlighted = {};

// Utility: Wait for an SVG node to be available
function waitForNodeReady(selector, timeout = 2000) {
  return new Promise((resolve, reject) => {
    const start = Date.now();
    function check() {
      const el = document.querySelector(selector);
      if (el) return resolve(el);
      if (Date.now() - start > timeout) return reject(`Timeout waiting for ${selector}`);
      requestAnimationFrame(check);
    }
    check();
  });
}

// Highlight a node in the correct graph
function highlightNode(nodeId, graphId) {
  const selector = `#graph-${graphId} g[id^="flowchart-${nodeId}-"]`;
  console.log(`[highlightNode] Looking for: ${selector}`);
  const node = document.querySelector(selector);
  if (node) {
    console.log(`[highlightNode] Found and highlighted: ${selector}`);
    node.classList.add("highlighted");
    return node;
  } else {
    console.warn(`[highlightNode] Node NOT found: ${selector}`);
  }
  return null;
}

// Remove highlight from a node in the correct graph
function unhighlightNode(nodeId, graphId) {
  const selector = `#graph-${graphId} g[id^="flowchart-${nodeId}-"]`;
  const node = document.querySelector(selector);
  if (node) {
    console.log(`[unhighlightNode] Removing highlight from: ${selector}`);
    node.classList.remove("highlighted");
  }
}

// Load content from a step and inject into reading pane
function loadStepContent(page) {
  console.log(`[loadStepContent] Loading content for: ${page}`);
  return fetch(METROLINE_BASE + 'metroline_steps/' + page)
    .then(response => response.text())
    .then(html => {
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      const contentDiv = doc.getElementById('content');
      const stepContent = document.getElementById('stepContent');
      const wrapper = document.getElementById('stepContentWrapper');
      if (contentDiv && stepContent) {
        stepContent.innerHTML = contentDiv.innerHTML;
        if (wrapper) wrapper.scrollTop = 0;
        console.log(`[loadStepContent] Injected HTML from ${page}`);
      } else {
        console.warn(`[loadStepContent] Missing #content in fetched HTML`);
      }
    });
}

// Used by Mermaid YAML: Load content and highlight a node
function showContentAndHighlightNode(page, nodeId, graphId) {
  console.log(`[showContentAndHighlightNode] page=${page}, nodeId=${nodeId}, graphId=${graphId}`);
  loadStepContent(page).then(() => {
    const previousId = lastHighlighted[graphId];
    if (previousId && previousId !== nodeId) {
      unhighlightNode(previousId, graphId);
    }

    const node = highlightNode(nodeId, graphId);
    if (node) {
      lastHighlighted[graphId] = nodeId;
    }
  });
}

// Used by Mermaid YAML: Just highlight a node (no content load)
function highlightNodeOnly(nodeId, graphId) {
  console.log(`[highlightNodeOnly] nodeId=${nodeId}, graphId=${graphId}`);
  const previousId = lastHighlighted[graphId];
  if (previousId && previousId !== nodeId) {
    unhighlightNode(previousId, graphId);
  }

  const node = highlightNode(nodeId, graphId);
  if (node) {
    lastHighlighted[graphId] = nodeId;
  }
}

// Initialise all graphs on the page
document.addEventListener("DOMContentLoaded", function () {
  console.log("[DOMContentLoaded] Starting graph setup");

  const graphConfigEl = document.getElementById('graph-config');
  if (!graphConfigEl) {
    console.warn("Missing graph-config JSON");
    return;
  }

  const graphsData = JSON.parse(graphConfigEl.textContent);
  console.log("[init] Loaded graphs data:", graphsData);

  graphsData.forEach((graph) => {
    console.log(`[render] Preparing to render graph: ${graph.id}`);
    const container = document.querySelector(`.graph-block[data-graph-id="${graph.id}"]`);
    if (!container) {
      console.log(`[skip] Graph "${graph.id}" is not used on this page`);
      return;
    }

    // Create and insert the Mermaid container
    const graphDiv = document.createElement("div");
    graphDiv.id = `graph-${graph.id}`;
    graphDiv.className = "mermaid";
    graphDiv.textContent = graph.definition;
    container.appendChild(graphDiv);

    // Render the Mermaid diagram
    setTimeout(() => {
      mermaid.init(undefined, `#graph-${graph.id}`);
      console.log(`[render] Graph rendered: ${graph.id}`);

      // Initial node highlight
      if (graph.initial_node_id) {
        const selector = `#graph-${graph.id} g[id^="flowchart-${graph.initial_node_id}-"]`;
        waitForNodeReady(selector)
          .then(() => {
            console.log(`[highlight] Initial node ready: ${graph.initial_node_id} in graph ${graph.id}`);
            if (graph.initial_page) {
              showContentAndHighlightNode(graph.initial_page, graph.initial_node_id, graph.id);
            } else {
              highlightNodeOnly(graph.initial_node_id, graph.id);
            }
          })
          .catch((err) => {
            console.warn(`[highlight] ${err}`);
          });
      }
    }, 0);
  });
});
