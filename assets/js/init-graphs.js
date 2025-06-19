//// =============================================
//// Mermaid graph interactivity loader + panzoom
//// =============================================
//
//mermaid.initialize({
//  startOnLoad: false,
//  securityLevel: "loose",
//  theme: "base",
//  flowchart: {
//    useMaxWidth: false,
//    htmlLabels: true,
//    nodeSpacing: 25,
//    rankSpacing: 25
//  },
//  themeVariables: {
//    fontSize: '11px',
//    fontFamily: 'sans-serif'
//  }
//});
//console.log("[init] Mermaid initialized");
//
//// Highlight tracking
//const lastHighlighted = {};
//
//// Utility to wait for a node to exist in DOM
//function waitForNodeReady(selector, timeout = 2000) {
//  return new Promise((resolve, reject) => {
//    const start = Date.now();
//    function check() {
//      const el = document.querySelector(selector);
//      if (el) return resolve(el);
//      if (Date.now() - start > timeout) return reject(`Timeout waiting for ${selector}`);
//      requestAnimationFrame(check);
//    }
//    check();
//  });
//}
//
//// Highlighting logic
//function highlightNode(nodeId, graphId) {
//  const selector = `#graph-${graphId} g[id^="flowchart-${nodeId}-"]`;
//  console.log(`[highlightNode] Looking for: ${selector}`);
//  const node = document.querySelector(selector);
//  if (node) {
//    node.classList.add("highlighted");
//    return node;
//  } else {
//    console.warn(`[highlightNode] Node NOT found: ${selector}`);
//  }
//  return null;
//}
//
//function unhighlightNode(nodeId, graphId) {
//  const selector = `#graph-${graphId} g[id^="flowchart-${nodeId}-"]`;
//  const node = document.querySelector(selector);
//  if (node) node.classList.remove("highlighted");
//}
//
//// Load external content into content pane
//function loadStepContent(page) {
//  console.log(`[loadStepContent] Loading content for: ${page}`);
//  return fetch(METROLINE_BASE + 'metroline_steps/' + page)
//    .then(response => response.text())
//    .then(html => {
//      const parser = new DOMParser();
//      const doc = parser.parseFromString(html, 'text/html');
//      const contentDiv = doc.getElementById('content');
//      const stepContent = document.getElementById('stepContent');
//      const wrapper = document.getElementById('stepContentWrapper');
//      if (contentDiv && stepContent) {
//        stepContent.innerHTML = contentDiv.innerHTML;
//        if (wrapper) wrapper.scrollTop = 0;
//      } else {
//        console.warn(`[loadStepContent] Missing #content in fetched HTML`);
//      }
//    });
//}
//
//// Called from Mermaid YAML
//window.showContentAndHighlightNode = function (page, nodeId, graphId) {
//  console.log(`[showContentAndHighlightNode] page=${page}, nodeId=${nodeId}, graphId=${graphId}`);
//  loadStepContent(page).then(() => {
//    const prev = lastHighlighted[graphId];
//    if (prev && prev !== nodeId) unhighlightNode(prev, graphId);
//    const node = highlightNode(nodeId, graphId);
//    if (node) lastHighlighted[graphId] = nodeId;
//  });
//};
//
//window.highlightNodeOnly = function (nodeId, graphId) {
//  console.log(`[highlightNodeOnly] nodeId=${nodeId}, graphId=${graphId}`);
//  const prev = lastHighlighted[graphId];
//  if (prev && prev !== nodeId) unhighlightNode(prev, graphId);
//  const node = highlightNode(nodeId, graphId);
//  if (node) lastHighlighted[graphId] = nodeId;
//};
//
//// Panzoom for custom SVGs
//function enableSvgPanZoom(selectors = []) {
//  selectors.forEach(selector => {
//    const elements = document.querySelectorAll(selector);
//    elements.forEach(el => {
//      if (el && el.tagName.toLowerCase() === 'svg' && !el.hasAttribute("data-panzoom-enabled")) {
//        try {
//          svgPanZoom(el, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//          el.setAttribute("data-panzoom-enabled", "true");
//          console.log(`[panzoom] Enabled for custom SVG: ${selector}`);
//        } catch (err) {
//          console.warn(`[panzoom] Failed for custom SVG (${selector}):`, err);
//        }
//      }
//    });
//  });
//}
//
//// Init on page load
//document.addEventListener("DOMContentLoaded", function () {
//  console.log("[DOMContentLoaded] Starting graph setup");
//
//  if (window.svgPanZoomTargets) {
//    console.log("[custom SVG] Applying panzoom to:", window.svgPanZoomTargets);
//    enableSvgPanZoom(window.svgPanZoomTargets);
//  }
//
//  const graphConfigEl = document.getElementById('graph-config');
//  if (!graphConfigEl) {
//    console.warn("[graph-config] Missing #graph-config");
//    return;
//  }
//
//  let graphsData;
//  try {
//    graphsData = JSON.parse(graphConfigEl.textContent);
//    console.log("[graph-config] Parsed:", graphsData);
//  } catch (err) {
//    console.error("[graph-config] JSON parse error:", err);
//    return;
//  }
//
//  graphsData.forEach((graph) => {
//    const container = document.querySelector(`.graph-block[data-graph-id="${graph.id}"]`);
//    if (!container) {
//      console.warn(`[graph] No container found for: ${graph.id}`);
//      return;
//    }
//
//    console.log(`[graph] Found container for: ${graph.id}`);
//
//    const graphDiv = document.createElement("div");
//    graphDiv.id = `graph-${graph.id}`;
//    graphDiv.className = "mermaid";
//    graphDiv.textContent = graph.definition;
//    container.appendChild(graphDiv);
//
//    // Render Mermaid
//    mermaid.init(undefined, `#graph-${graph.id}`);
//    console.log(`[graph] Rendered: ${graph.id}`);
//
//    const wantsPanZoom = graph.pan_zoom === true;
//    const zoomLevel = parseFloat(graph.zoom) || 1.0;
//    const panX = parseFloat(graph.pan_x) || 0;
//    const panY = parseFloat(graph.pan_y) || 0;
//
//    console.log(`[graph] pan-zoom=${wantsPanZoom}, zoom=${zoomLevel}, panX=${panX}, panY=${panY}`);
//
//    if (wantsPanZoom) {
//      setTimeout(() => {
//        const svgEl = container.querySelector("svg");
//        if (!svgEl) {
//          console.warn(`[panzoom] SVG not found for graph ${graph.id}`);
//          return;
//        }
//
//        if (svgEl.hasAttribute("data-panzoom-enabled")) {
//          console.log(`[panzoom] Already initialized: ${graph.id}`);
//          return;
//        }
//
//        try {
//          const panZoom = svgPanZoom(svgEl, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//
//          panZoom.zoom(zoomLevel);
//          panZoom.pan({ x: panX, y: panY });
//          svgEl.setAttribute("data-panzoom-enabled", "true");
//
//          console.log(`[panzoom] ✅ Applied to: ${graph.id}`);
//        } catch (err) {
//          console.warn(`[panzoom] ❌ Error on graph ${graph.id}:`, err);
//        }
//      }, 400);
//    }
//
//    // Initial highlight logic
//    if (graph.initial_node_id) {
//      const selector = `#graph-${graph.id} g[id^="flowchart-${graph.initial_node_id}-"]`;
//      waitForNodeReady(selector)
//        .then(() => {
//          console.log(`[highlight] ✅ Node ready: ${graph.initial_node_id} in ${graph.id}`);
//          if (graph.initial_page) {
//            showContentAndHighlightNode(graph.initial_page, graph.initial_node_id, graph.id);
//          } else {
//            highlightNodeOnly(graph.initial_node_id, graph.id);
//          }
//        })
//        .catch((err) => {
//          console.warn(`[highlight] ❌ ${err}`);
//        });
//    }
//  });
//});


//// =============================================
//// Mermaid + svg-pan-zoom loader (final version)
//// Uses config directly from JSON, no extra DOM attributes
//// =============================================
//
//mermaid.initialize({
//  startOnLoad: false,
//  securityLevel: "loose",
//  theme: "base",
//  flowchart: {
//    useMaxWidth: false,
//    htmlLabels: true,
//    nodeSpacing: 25,
//    rankSpacing: 25
//  },
//  themeVariables: {
//    fontSize: '11px',
//    fontFamily: 'sans-serif'
//  }
//});
//console.log("[init] Mermaid initialized");
//
//function enableSvgPanZoom(selectors = []) {
//  selectors.forEach(selector => {
//    const elements = document.querySelectorAll(selector);
//    elements.forEach(el => {
//      if (el && el.tagName.toLowerCase() === 'svg' && !el.hasAttribute("data-panzoom-enabled")) {
//        try {
//          svgPanZoom(el, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//          el.setAttribute("data-panzoom-enabled", "true");
//          console.log(`[panzoom] ✅ Enabled for custom SVG: ${selector}`);
//        } catch (err) {
//          console.warn(`[panzoom] ❌ Failed for custom SVG (${selector}):`, err);
//        }
//      }
//    });
//  });
//}
//
//document.addEventListener("DOMContentLoaded", function () {
//  console.log("[DOMContentLoaded] 🚀 Starting graph setup");
//
//  if (window.svgPanZoomTargets) {
//    console.log("[custom SVG] Applying panzoom to:", window.svgPanZoomTargets);
//    enableSvgPanZoom(window.svgPanZoomTargets);
//  }
//
//  const graphConfigEl = document.getElementById('graph-config');
//  if (!graphConfigEl) {
//    console.warn("[graph-config] ❌ Missing #graph-config");
//    return;
//  }
//
//  let graphsData;
//  try {
//    graphsData = JSON.parse(graphConfigEl.textContent);
//    console.log("[graph-config] ✅ Parsed:", graphsData);
//  } catch (err) {
//    console.error("[graph-config] ❌ JSON parse error:", err);
//    return;
//  }
//
//  graphsData.forEach((graph) => {
//    const container = document.querySelector(`.graph-block[data-graph-id="${graph.id}"]`);
//    if (!container) {
//      console.warn(`[graph] ❌ No container found for: ${graph.id}`);
//      return;
//    }
//
//    console.log(`[graph] 🧩 Found container for: ${graph.id}`);
//
//    // Create and insert Mermaid graph container
//    const graphDiv = document.createElement("div");
//    graphDiv.id = `graph-${graph.id}`;
//    graphDiv.className = "mermaid";
//    graphDiv.textContent = graph.definition;
//    container.appendChild(graphDiv);
//
//    // Render Mermaid
//    mermaid.init(undefined, `#graph-${graph.id}`);
//    console.log(`[graph] 🎨 Rendered: ${graph.id}`);
//
//    const wantsPanZoom = graph.pan_zoom === true;
//    const zoomLevel = parseFloat(graph.zoom) || 1.0;
//    const panX = parseFloat(graph.pan_x) || 0;
//    const panY = parseFloat(graph.pan_y) || 0;
//
//    console.log(`[graph] 🔍 pan-zoom=${wantsPanZoom}, zoom=${zoomLevel}, panX=${panX}, panY=${panY}`);
//
//    if (wantsPanZoom) {
//      setTimeout(() => {
//        const svgEl = container.querySelector("svg");
//        if (!svgEl) {
//          console.warn(`[panzoom] ❌ SVG not found for graph ${graph.id}`);
//          return;
//        }
//
//        if (svgEl.hasAttribute("data-panzoom-enabled")) {
//          console.log(`[panzoom] ⏭ Already initialized: ${graph.id}`);
//          return;
//        }
//
//        try {
//          const panZoom = svgPanZoom(svgEl, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//
//          panZoom.zoom(zoomLevel);
//          panZoom.pan({ x: panX, y: panY });
//          svgEl.setAttribute("data-panzoom-enabled", "true");
//
//          console.log(`[panzoom] ✅ Applied to: ${graph.id}`);
//        } catch (err) {
//          console.warn(`[panzoom] ❌ Error on graph ${graph.id}:`, err);
//        }
//      }, 400); // allow layout/rendering to settle
//    }
//  });
//});


//// =============================================
//// Mermaid + svg-pan-zoom loader with per-graph control
//// Supports:
////  - pan-zoom toggle via pan-zoom="true"
////  - custom zoom/pan via data-zoom / data-pan-x / data-pan-y
////  - user-defined SVGs via window.svgPanZoomTargets
//// =============================================
//
//// Mermaid setup
//mermaid.initialize({
//  startOnLoad: false,
//  securityLevel: "loose",
//  theme: "base",
//  flowchart: {
//    useMaxWidth: false,
//    htmlLabels: true,
//    nodeSpacing: 25,
//    rankSpacing: 25
//  },
//  themeVariables: {
//    fontSize: '11px',
//    fontFamily: 'sans-serif'
//  }
//});
//console.log("[init] Mermaid initialized");
//
//// Apply panzoom to custom SVGs
//function enableSvgPanZoom(selectors = []) {
//  selectors.forEach(selector => {
//    const elements = document.querySelectorAll(selector);
//    elements.forEach(el => {
//      if (el && el.tagName.toLowerCase() === 'svg' && !el.hasAttribute("data-panzoom-enabled")) {
//        try {
//          svgPanZoom(el, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//          el.setAttribute("data-panzoom-enabled", "true");
//          console.log(`[panzoom] ✅ Enabled for custom SVG: ${selector}`);
//        } catch (err) {
//          console.warn(`[panzoom] ❌ Failed for custom SVG (${selector}):`, err);
//        }
//      }
//    });
//  });
//}
//
//document.addEventListener("DOMContentLoaded", function () {
//  console.log("[DOMContentLoaded] 🚀 Starting graph setup");
//
//  // Handle static custom SVGs
//  if (window.svgPanZoomTargets) {
//    console.log("[custom SVG] Applying panzoom to:", window.svgPanZoomTargets);
//    enableSvgPanZoom(window.svgPanZoomTargets);
//  }
//
//  const graphConfigEl = document.getElementById('graph-config');
//  if (!graphConfigEl) {
//    console.warn("[graph-config] ❌ Missing #graph-config");
//    return;
//  }
//
//  let graphsData;
//  try {
//    graphsData = JSON.parse(graphConfigEl.textContent);
//    console.log("[graph-config] ✅ Parsed:", graphsData);
//  } catch (err) {
//    console.error("[graph-config] ❌ JSON parse error:", err);
//    return;
//  }
//
//  graphsData.forEach((graph) => {
//    const container = document.querySelector(`.graph-block[data-graph-id="${graph.id}"]`);
//    if (!container) {
//      console.warn(`[graph] ❌ No container found for: ${graph.id}`);
//      return;
//    }
//
//    console.log(`[graph] 🧩 Found container for: ${graph.id}`);
//
//    const graphDiv = document.createElement("div");
//    graphDiv.id = `graph-${graph.id}`;
//    graphDiv.className = "mermaid";
//    graphDiv.textContent = graph.definition;
//    container.appendChild(graphDiv);
//
//    // Render Mermaid
//    mermaid.init(undefined, `#graph-${graph.id}`);
//    console.log(`[graph] 🎨 Rendered: ${graph.id}`);
//
//    // Enable pan/zoom if requested
//    const wantsPanZoom = container.getAttribute("pan-zoom") === "true";
//    const zoomLevel = parseFloat(container.getAttribute("data-zoom")) || 1.0;
//    const panX = parseFloat(container.getAttribute("data-pan-x")) || 0;
//    const panY = parseFloat(container.getAttribute("data-pan-y")) || 0;
//
//    console.log(`[graph] 🔍 pan-zoom=${wantsPanZoom}, zoom=${zoomLevel}, panX=${panX}, panY=${panY}`);
//
//    if (wantsPanZoom) {
//      setTimeout(() => {
//        const svgEl = container.querySelector("svg");
//        if (!svgEl) {
//          console.warn(`[panzoom] ❌ SVG not found for graph ${graph.id}`);
//          return;
//        }
//
//        if (svgEl.hasAttribute("data-panzoom-enabled")) {
//          console.log(`[panzoom] ⏭ Already initialized: ${graph.id}`);
//          return;
//        }
//
//        try {
//          const panZoom = svgPanZoom(svgEl, {
//            zoomEnabled: true,
//            controlIconsEnabled: true,
//            fit: true,
//            center: true
//          });
//
//          panZoom.zoom(zoomLevel);
//          panZoom.pan({ x: panX, y: panY });
//          svgEl.setAttribute("data-panzoom-enabled", "true");
//
//          console.log(`[panzoom] ✅ Applied to: ${graph.id}`);
//        } catch (err) {
//          console.warn(`[panzoom] ❌ Error on graph ${graph.id}:`, err);
//        }
//      }, 400);
//    }
//  });
//});



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
