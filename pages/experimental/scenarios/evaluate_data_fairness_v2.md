---
title: Evaluating the FAIRness of your data
permalink: experimental/scenarios/evaluate_fairness_v2
page_id: test_page
---

{% include graph_logic/init-graphs.html %}

This page has two distinct workflow sections.

<div class="image-wrapper mermaid-no-min-height">
  <div class="graph-block" data-graph-id="graph1"></div>
</div>

some Text

<div class="image-wrapper mermaid-with-min-height">
  <div class="graph-block" data-graph-id="graph2"></div>
</div>

some more text
<div class="image-wrapper mermaid-no-min-height">
    <div class="graph-block" data-graph-id="graph3"></div>
</div>




<div id="stepContentWrapper">
    <div id="stepContent"></div>
</div>



{% assign filtered_graphs = include.graphs | where: "section", include.section %}
<div class="image-wrapper no-scale-mermaid">
  {% for graph in filtered_graphs %}
    <div id="{{ graph.id }}" class="mermaid" section="{{ graph.section }}">
      {{ graph.definition }}
    </div>
  {% endfor %}
</div>



<style>
/* Override Mermaid-generated SVG styles */
.highlighted rect, 
.highlighted polygon, 
.highlighted path {
    stroke: #c00 !important;
    stroke-width: 4px !important;
}

#stepContentWrapper { 
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #ccc;
    padding: 1rem;
    margin-top: 1rem;
    background: #f9f9f9;
    border-radius: 8px;
}

#stepContent {
    font-size: 0.9rem;       /* Base font size scaled down */
    line-height: 1.4;
}

/* Scale all heading levels proportionally */
#stepContent h1 {
    font-size: 2em;          /* = 1.8rem */
    margin-bottom: 0.5em;
}
#stepContent h2 {
    font-size: 1.5em;        /* = 1.35rem */
    margin-bottom: 0.4em;
}
#stepContent h3 {
    font-size: 1.2em;        /* = 1.08rem */
    margin-bottom: 0.3em;
}
#stepContent h4 {
    font-size: 1em;          /* = 0.9rem */
    margin-bottom: 0.3em;
}
#stepContent h5 {
    font-size: 0.85em;       /* = 0.765rem */
    margin-bottom: 0.2em;
}

/* Optional cleanup for spacing consistency */
#stepContent p,
#stepContent li {
    margin-bottom: 0.6em;
}

</style>