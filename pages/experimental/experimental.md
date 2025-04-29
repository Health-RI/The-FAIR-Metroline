---
title: Experimental page
permalink: experimental/experimental
---

Ok, so basically we have two options for mermaid:
* Liquid
* JavaScript
It turns out that if you want to start out with some hidden graphs that are liquid generated, it breaks the graphs (issues with dimensions). So we'll go full JavaScript for this.

<script src="https://cdn.jsdelivr.net/npm/mermaid@11.6.0/dist/mermaid.min.js"></script>

{% assign page_graphs = site.data.graphs.sdr_test %}
{% include graph_logic/on-load.html graphs=site.data.graphs.sdr_test%}
{% include graph_logic/graph-block.html graphs=page_graphs section="section1" %}

{% include graph_logic/button-block.html graphs=page_graphs section="section2" %}
{% include graph_logic/graph-block.html graphs=page_graphs section="section2" %}


