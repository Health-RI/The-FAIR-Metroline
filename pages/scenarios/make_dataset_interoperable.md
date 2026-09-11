---
title: How to make a  new dataset interoperable from the start?
permalink: scenarios/make_dataset_interoperable
page_id: make_dataset_interoperable
custom_js: metro-timeline
---

## Scenario Overview
Research data can be difficult to combine and reuse when the same concepts are defined or collected differently across studies. Even seemingly straightforward data elements may differ in their meaning, values, units or formats.
When designing a new dataset, you can address these differences from the start by clearly defining what you want to collect and aligning your data elements with existing standards where possible. This makes it easier to understand, compare and combine your data with data from other studies, whether for your own analyses or for reuse by others.

<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>
        My genomics study protocol includes several data elements that need to be collected, including sex and BMI. I want to align these data elements with existing standards and initiatives so that the data are interoperable from the start.
      </p>
    </div>
  </div>
</div>

{% include scenario-overview.html
  complexity="Medium"
  experts="Data steward"
  outcome="Interoperable dataset"
  complexity_tooltip="Making a dataset interoperable from the start requires knowledge of the data elements that will be collecting, data standard that exist for the domain and the data elements, and knowledge on how to use these standards in data collection."
  experts_tooltip="A data steward can help finding the appropriate standards and help preparing for data collection, for example by creating electronic case report forms."
  outcome_tooltip="A dataset that is aligned with other datasets and a codebook that describes the data elements."
%}

{% assign journey_stops = site.data.scenarios.make_dataset_interoperable | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.scenarios.make_dataset_interoperable | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
### Prerequisites
Before starting this scenario, you should have the following prerequisites in place.

{% include scenario-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}

