---
title: Make a dataset available for external use
permalink: use-cases/make_dataset_available_for_external_use
redirect_from: /scenarios/make_dataset_available_for_external_use
page_id: make_dataset_available_for_external_use
custom_js: metro-timeline
---

## Use Case Overview
Making an existing research dataset available for reuse allows other researchers to validate findings, make comparisons or use the data for educational purposes. To support reuse without the data holder’s direct involvement, the dataset needs clear documentation, a consistent structure and sufficient metadata to explain its contents and how the data were collected and processed.

Before sharing an existing dataset, you need to check whether all relevant metadata are available, whether the data are sufficiently de-identified and whether sharing is legally permitted. Relevant information may be embedded in the data files or stored separately. Bringing this information together and documenting the conditions for reuse helps other researchers understand and use the dataset independently. 

<div class="metro-examples">
  <h4>Examples</h4>
  <div class="example-tabs">
    <button class="example-tab active" data-example="1">Researcher at University Medical Center</button>
  </div>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>I have published an article based on 20 CT images and now want to make the dataset available for validation, comparison and educational use. The images are stored in a clinical system or a secure institutional folder, with some metadata embedded in the DICOM headers. Before sharing, I need to verify that all relevant metadata are available and that the data is sufficiently de-identified for sharing. I want to provide a documented and structured dataset that other researchers can understand without any of my direct involvement. </p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Medium"
  experts="Data Steward"
  outcome="Dataset published and available for reuse under defined access conditions"
  complexity_tooltip="Preparing a dataset for external reuse involves several tasks, including checking permissions, de-identifying data where necessary, preparing documentation and metadata, and meeting repository requirements. Some tasks may require specialist knowledge, but the process is generally manageable with appropriate support."
  experts_tooltip="A data steward can help organise the dataset and its documentation, choose a suitable repository and prepare the metadata. They can also help identify when privacy, legal or technical expertise is needed."
  outcome_tooltip="The dataset is published with a persistent identifier, sufficient documentation and clearly defined access and reuse conditions. External researchers can find and understand the dataset independently and access or request it as permitted."
%}

{% assign journey_stops = site.data.use-cases.make_dataset_available_for_external_use | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.make_dataset_available_for_external_use | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}