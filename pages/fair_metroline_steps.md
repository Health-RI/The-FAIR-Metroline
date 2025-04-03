---
title: FAIR Metroline steps
---

## Overview Metroline steps
{% for step in site.data.metroline_steps %}
{% if step.url != "" %}
**[{{ step.title }}]({{ site.baseurl }}{{ step.url }})**. {{ step.summary }}
{% else %}
**{{ step.title }}**. {{ step.summary }}
{% endif %}
{% endfor %}

