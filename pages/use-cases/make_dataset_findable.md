---
title: Make an existing dataset findable in a catalogue
permalink: use-cases/make_dataset_findable
redirect_from: /scenarios/make_dataset_findable
page_id: make_dataset_findable
custom_js: metro-timeline
---

## Use Case Overview
Research institutions and funders may require researchers to make their data findable. Journals may also require authors to explain whether and how the data supporting their publications can be accessed.

One way to make an existing dataset findable is to register descriptive metadata in a suitable catalogue, such as the National Health Data Catalogue. This allows others to discover the dataset, assess its relevance and understand any access restrictions, even when the underlying data are not openly available.



<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher at University Medical Center</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>I am a researcher at Radboudumc. To meet my institution's FAIR-related requirements, I want to make my existing dataset findable through the National Health Data Catalogue.</p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Medium"
  experts="Data Steward"
  outcome="Findable Dataset"
  complexity_tooltip="Making a dataset findable requires coordinating metadata quality, access conditions, and catalogue requirements. While no data transformation is needed, aligning metadata with a FAIR Data Point and national catalogue standards adds moderate complexity."
  experts_tooltip="A data steward is needed to guide the metadata assessment, align it with catalogue requirements, and publish the metadata to the FAIR Data Point for harvesting."
  outcome_tooltip="A dataset whose metadata is registered in the National Health Data Catalogue, making it discoverable by other researchers and enabling potential collaboration and reuse."
%}

{% assign journey_stops = site.data.use-cases.make_dataset_findable | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.make_dataset_findable | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}