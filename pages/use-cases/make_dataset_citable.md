---
title: Make an existing dataset citable in a publication
permalink: use-cases/make_dataset_citable
redirect_from: /scenarios/make_dataset_citable
page_id: make_dataset_citable
custom_js: metro-timeline
---

## Use Case Overview
Many journals require researchers to explain where the data underlying their publications can be found and how they can be accessed. Some also require datasets to be deposited in a suitable repository before a paper can be accepted. These requirements help others verify research findings and, where permitted, reuse the data. However, sensitive data, such as medical data, cannot always be shared openly.

When preparing a publication based on an existing dataset, you can make the data underlying your results identifiable and citable by preserving the version used in your research, registering its metadata and obtaining a persistent identifier. This allows others to identify and reference the dataset, even when the underlying data remain in a restricted archive. Publicly available metadata can also describe the access conditions and explain how access can be requested, where permitted.

<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>I am a Radboudumc researcher preparing an article on lung nodules using existing chest CT scans and radiology reports from 50 patients. I analysed a subset of these data and derived additional variables, including nodule size and classification labels. My journal requires me to document the availability of the data supporting my findings. I want to make the exact dataset used in my research citable, even though the sensitive medical data cannot be shared openly.</p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Low / Medium"
  experts="Data Steward"
  outcome="Dataset is citable in your publication"
  complexity_tooltip="Complying to local and publisher policies requires expertise."
  experts_tooltip="A data steward is needed to navigate and implement the local and publisher policies compliance."
  outcome_tooltip="Persistent identifier for dataset to be used in publication."
%}

{% assign journey_stops = site.data.use-cases.make_dataset_citable | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.make_dataset_citable | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}