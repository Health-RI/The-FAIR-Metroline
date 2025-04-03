---
title: Experimental page
---

Dear me,
There's to things going on here. You can either use mermaid liquid, using %, or use javascript. Issue I had, was visibility after rendering; immediately hiding a graph causes issues, which you can solve with onload. Is that still necessary if you use full-blown mermaid liquid though, since that's client-side? Should I try? It would make things easier.

<script src="https://cdn.jsdelivr.net/npm/mermaid@11.6.0/dist/mermaid.min.js"></script>
{% include graph_logic/on-load.html graphs=site.data.graphs.sdr_test %}
<script src="assets/js/graphController.js"></script>
{% include graph_logic/graph-block.html graphs=site.data.graphs.sdr_test section="section1" %}



{% include graph_logic/button-block.html graphs=site.data.graphs.sdr_test section="section2" %}
{% include graph_logic/graph-block.html graphs=site.data.graphs.sdr_test section="section2" %}


you need to add stuff to your config (maybe):

mermaid:
  src: "https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"

and your Gemfile (definitely):
group :jekyll_plugins do
  gem "jekyll-mermaid"

{% raw %}
{% mermaid %}
graph LR
  A[Define FAIRification Objectives] --> B[Build your team]
  B --> C[Have a FAIR data steward on board]
  C --> D[Pre-FAIR Assesment]

  click A "./metroline_steps/define_fairification_objectives"
  click C "./metroline_steps/have_a_fair_data_steward_on_board"
  click D "./metroline_steps/pre_fair_assessment"

{% endmermaid %}
{% endraw %}

There's also this:
<!--
<script>
  mermaid.initialize({ startOnLoad: true });
</script>
-->
Is that better than using onload the way we do now? How would that work wrt initial visibility?