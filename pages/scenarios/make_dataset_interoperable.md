---
title: How to make a  new dataset interoperable from the start?
permalink: scenarios/make_dataset_interoperable
page_id: make_dataset_interoperable
custom_js: metro-timeline
---

## Scenario Overview
Design new dataset so it is interoperable from the start, including alignment to existing standards or reference datasets.

<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>My genomics research project's study protocol includes several data elements which should be collected. The data elements I need to collect are "sex" and "bmi". I want to make sure I collect these data in an interoperable way from the start.</p>
    </div>
  </div>
</div>

{% include scenario-overview.html
  complexity="Medium"
  experts="Data Steward"
  outcome="Interoperable Dataset"
  complexity_tooltip="Making a dataset interoperable from the start requires knowledge of the data elements that will be collecting, data standard that exist for the domain and the data elements, and knowledge on how to use these standards in data collection."
  experts_tooltip="A data steward can help finding the appropriate standards and help preparing for data collection, for example by creating electronic case report forms."
  outcome_tooltip="A dataset that is interoperable and a codebook that describes the data elements."
%}

{% assign journey_stops = site.data.scenarios.make_dataset_interoperable | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.scenarios.make_dataset_interoperable | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
## Prerequisites

{% include scenario-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include metro-timeline.html stops=journey_stops %}

