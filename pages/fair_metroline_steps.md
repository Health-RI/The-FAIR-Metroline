---
title: FAIR Metroline steps
---

## Overview Metroline steps
<div class="steps">
{% for step in site.data.metroline_steps %}
  <details class="step">
    <summary>
      {{ step.icon }}
      <strong>{{ step.title }}</strong>
    </summary>
    <div class="step-panel">
      <p>{{ step.summary }}</p>
      {% if step.url and step.url != blank %}
        <p><a href="{{ site.baseurl }}/{{ step.url }}">Visit full page ↗</a></p>
      {% endif %}
    </div>
  </details>
{% endfor %}
</div>

<style>
  .step { border: 1px solid #e5e7eb; border-radius: .75rem; padding: .5rem .75rem; margin: .5rem 0; }
  .step > summary { cursor: pointer; list-style: none; }
  .step > summary::-webkit-details-marker { display: none; }
  .step > summary::after { content: '▸'; float: right; }
  .step[open] > summary::after { content: '▾'; }
  .step-panel { margin-top: .5rem; }
</style>