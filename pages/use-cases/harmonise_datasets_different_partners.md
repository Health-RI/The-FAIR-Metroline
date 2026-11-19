---
title: How to harmonise datasets collected by different partners
permalink: use-cases/harmonise_datasets_different_partners
redirect_from: /scenarios/harmonise_datasets_different_partners
page_id: harmonise_datasets_different_partners
custom_js: metro-timeline
---

## Use Case Overview
Collaborative research projects often involve partners collecting similar data independently. Differences in variable definitions, units, coding and file formats can make it difficult to analyse these datasets together. Harmonisation aligns comparable data with agreed definitions and structures so they can support joint analysis.

Partners first agree on which variables they need for the joint analysis. They compare available dataset descriptions to assess whether the variables are comparable and then agree on how the relevant data may be accessed and used.  They document the transformations and any remaining differences so the analysis team can interpret the harmonised data and reproduce the process.


<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>
        Our multicentre study combines data that two partner hospitals collected independently, including height and other baseline measurements. I want to harmonise these data elements so that we can analyse both datasets together under agreed access conditions.
      </p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Medium"
  experts="Researcher, Data steward, Research software engineer, Data scientist, ELSI expert, Project manager"
  outcome="Harmonised dataset"
  complexity_tooltip="Requires coordination and agreements between partners, plus documented data transformations, but no semantic modelling. Complexity increases with more partners, variables or cross-border personal data."
  experts_tooltip="A researcher defines which variables the joint analysis needs and judges whether the partner data are comparable. A data steward compares the partners’ codebooks, helps reuse existing definitions and documents the harmonisation. A research software engineer writes reproducible scripts to transform the partner datasets. A data scientist checks the harmonised data and uses them for the joint analysis. An ELSI expert advises on consent, GDPR and the agreements needed for joint use. A project manager coordinates the partners, agreements and timelines in larger collaborations."
  outcome_tooltip="A combined dataset with shared definitions and units, documented in a codebook and mapping table, ready for joint analysis under agreed access conditions."
%}

{% assign journey_stops = site.data.use-cases.harmonise_datasets_different_partners | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.harmonise_datasets_different_partners | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}

