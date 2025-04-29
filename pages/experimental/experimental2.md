---
title: Experimental page
permalink: experimental/experimental2
---

Ok, so basically we have two options for mermaid:
* Liquid
* JavaScript
It turns out that if you want to start out with some hidden graphs that are liquid generated, it breaks the graphs (issues with dimensions). So we'll go full JavaScript for this.

For the liquid version you need to add stuff to your config:

mermaid:
  src: "https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"

and Gemfile:
group :jekyll_plugins do
  gem "jekyll-mermaid"


There's also this:
<!--
<script>
  mermaid.initialize({ startOnLoad: true });
</script>
-->
Is that better than using onload the way we do now? How would that work wrt initial visibility?