---
title: FAIR Metroline steps
---

## Overview Metroline steps
{% for step in site.data.metroline_steps %}
{% if step.url and step.url != blank %}
**[{{ step.title }}]({{ site.baseurl }}/{{ step.url }})**. {{ step.summary }}
{% else %}
**{{ step.title }}**. {{ step.summary }}
{% endif %}
{% endfor %}

