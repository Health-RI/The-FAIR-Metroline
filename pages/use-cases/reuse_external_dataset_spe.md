---
title: How to reuse an external dataset in a secure processing environment
permalink: use-cases/reuse_external_dataset
redirect_from: /scenarios/reuse_external_dataset
page_id: reuse_external_dataset
custom_js: metro-timeline
---

## Use Case Overview
Reusing research data can save time, reduce the burden of new data collection and support new analyses. Before using a dataset collected by others, you need to check whether its study population, measurements and data quality meet your research requirements. You also need to understand the data and establish whether your intended use is permitted. This scenario covers data that may only be analysed within a secure processing environment (SPE).

<div class="metro-examples">
  <h4>Example: Researcher</h4>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>
        My study requires real-world heart rate measurements from adults with type 2 diabetes. Collecting new measurements would take time and place an additional burden on participants, so I explore whether an existing dataset could meet my needs. I search the National Health Data Catalogue (NGDC), assess a potentially suitable dataset and request access. The data are made available in an agreed SPE.
      </p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Medium"
  experts="Researcher, Data steward, ELSI Expert"
  outcome="External data reused in your study, with approved results."
  complexity_tooltip="You need an access request, agreements and work within a secure environment with output checks. You do not need to collect new data or build models"
  experts_tooltip="Requires a researcher to define what data are needed, analyse them and report the reuse. A data steward is recommended to assess suitability and support the access request. Involve an ELSI expert where agreements or conditions need legal or ethical review."
  outcome_tooltip="External data reused in your study, with documented processing steps and results approved for export."
%}

{% assign journey_stops = site.data.use-cases.reuse_external_dataset_spe | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.reuse_external_dataset_spe | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}

