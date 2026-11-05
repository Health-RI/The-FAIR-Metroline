---
title: FAIR Metroline use cases
permalink: fair_metroline_use_cases
# the tumour data use case was archived (_archive/pages/tool-scenarios/transform_onco_data.md)
redirect_from: [/fair_metroline_scenarios, /tool-scenarios/transform_onco_data, /use-cases/transform_onco_data]
---

{% capture intro %}Which FAIR steps you need depends on your goal: to make existing data findable in a catalogue, for example, you can skip a step like Design eCRF. Pick the use case closest to your goal and follow its route through the steps and tools.{% endcapture %}
{% include page-intro.html icon="use-cases" lead="Use cases show the FAIR steps you need for a common goal, in order." text=intro %}

{% assign use_cases = site.data.use_cases_list %}
{% include use-case-cards.html use_cases=use_cases %}