---
title: How to standardise terminology in an existing dataset
permalink: use-cases/standardise_terminology_existing_dataset
redirect_from: /scenarios/standardise_terminology_existing_dataset
page_id: standardise_terminology_existing_dataset
custom_js: metro-timeline
---

## Use Case Overview
Existing datasets may contain unclear variable names, abbreviations or different terms for the same concept. This can make the data difficult to interpret, combine and reuse. Standardising terminology involves clarifying these meanings and linking relevant variables and values to established terms or identifiers, supporting both your own analyses and reuse by others.

<div class="metro-examples">
  <h4>Example: Researcher</h4>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>I am responsible for an existing dataset that was collected by a previous project team. It contains a diagnosis variable with values such as 'MI', 'heart attack' and 'myocardial infarction', as well as the value 'Cardiac event'. I want to confirm what these values mean, link them to established clinical terms and document how the original values relate to the standardised codes, so that other researchers interpret them consistently.</p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Medium"
  experts="Researcher, Data Steward"
  outcome="Dataset uses standardised, documented terminology"
  complexity_tooltip="No semantic model or technical infrastructure is needed, but you must know your domain, judge how well terms match and often contact the original researchers to confirm meanings."
  experts_tooltip="The researcher is responsible for the dataset, confirms definitions with the original research team or documentation and checks that the selected standard terms match the data. The data steward helps find suitable CDEs, codebooks and terminologies, check licence conditions and document and publish the mappings."
  outcome_tooltip="Your dataset uses standard terms and identifiers. The codebook and mapping table show how the original values were interpreted and which uncertainties remain, so others can judge whether the data suit their reuse."
%}

{% assign journey_stops = site.data.use-cases.standardise_terminology_existing_dataset | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.standardise_terminology_existing_dataset | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}