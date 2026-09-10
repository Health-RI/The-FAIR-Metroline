---
title: How to make a  new dataset interoperable from the start?
permalink: scenarios/make_dataset_interoperable
page_id: make_dataset_interoperable
custom_js: metro-timeline
---

## Scenario Overview
Research data can be difficult to combine and reuse when the same concepts are defined or collected differently across studies. Even seemingly straightforward data elements may differ in their meaning, values, units or formats.

When designing a new dataset, you can address these differences from the start by clearly defining what you want to collect and aligning your data elements with existing standards where possible. This makes it easier to understand, compare and combine your data with data from other studies, whether for your own analyses or for reuse by others.

### Before getting started

* Be sure you are clear about your [FAIRifcation Objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives)
* When necessary, make sure you enlist the help from a [FAIR data steward]({{site.baseurl}}/metroline_steps/have_a_fair_data_steward_on_board), if possible
* If there are gaps in your (team's) knowledge, considering following [training]({{site.baseurl}}/metroline_steps/organise_training)



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

## Your Journey

{% include metro-timeline.html stops=site.data.scenarios.make_dataset_interoperable %}

