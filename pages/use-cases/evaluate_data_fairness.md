---
title: How to evaluate the FAIRness of your data
permalink: use-cases/evaluate_data_fairness
redirect_from: /scenarios/evaluate_data_fairness
page_id: evaluate_data_fairness
custom_js: metro-timeline
---

## Use Case Overview

A FAIRness assessment helps you understand how well your dataset and its metadata align with the FAIR principles (Findable, Accessible, Interoperable and Reusable). You may need an assessment to check whether your dataset meets FAIR-related requirements from your institute, funder, journal or repository, or to identify improvements before sharing the dataset or depositing it in a repository.

The assessment looks at how your dataset is identified, described, stored and made available for reuse, for example its identifiers, metadata, file formats, access conditions and licence. With support from a data steward, you choose a suitable assessment tool, carry out the assessment and record the findings. The outcome is a report describing what is already in place, what is missing and which improvements are needed.

<div class="metro-examples">
  <h4>Example: Researcher</h4>
  <div class="example-content">
    <div class="example-panel active" data-example="1">
      <p>My institute has FAIR data requirements that datasets must meet before they are deposited in a repository. I want to assess my dataset and identify what needs improving. Together with a data steward, I will check aspects such as identifiers, metadata, file formats, access conditions and licence. I want to document the findings and determine what I need to address before depositing the dataset.</p>
    </div>
  </div>
</div>

{% include use-case-overview.html
  complexity="Low"
  experts="Data Steward, Researcher"
  outcome="FAIRness assessment report"
  complexity_tooltip="Assesses a single dataset with an existing tool and support from a data steward, without changing the data itself. Effort increases when you assess several datasets or must meet extensive requirements."
  experts_tooltip="A researcher provides the dataset and its documentation and answers questions about how the data were collected and described. A data steward helps choose the tool and interpret the results, and advises on which improvements to address first."
  outcome_tooltip="FAIRness assessment report with identified gaps and prioritised improvements."
%}

{% assign journey_stops = site.data.use-cases.evaluate_data_fairness | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.evaluate_data_fairness | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops %}

