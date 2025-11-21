---
title: Data Lifecycle
permalink: toolassemblies/data_lifecycle
toc: false
---
<div class="container pt-3">
    <div class="row">
        <div class="col">
            <div class="svg-container" style="width:100%;height:60vh;overflow:auto;display:flex;align-items:center;justify-content:center;">
              {% include toolassemblies/reactive_datalifecycle.svg %}
            </div>
        </div>
      <div class="col">
        <h2 id="display-stage-name">{{ site.data.lifecycle_stages[0].name }}</h2>
        <p id="display-stage-description">{{ site.data.lifecycle_stages[0].text }}</p>
      </div>
    </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const iconTexts = {
      {% for item in site.data.lifecycle_stages %}
        "{{ item.id }}": { text: "{{ item.text | escape }}", name: "{{ item.name | escape }}" },
      {% endfor %}
    };

    Object.keys(iconTexts).forEach(function(id) {
      const el = document.getElementById(id);
      if (el) {
        el.style.cursor = 'pointer';
        el.addEventListener('click', function () {
          document.getElementById('display-stage-name').textContent = iconTexts[id].name;
          document.getElementById('display-stage-description').textContent = iconTexts[id].text;
        });
      }
    });
  });
</script>
