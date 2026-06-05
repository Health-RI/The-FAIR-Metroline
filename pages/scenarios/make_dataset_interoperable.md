---
title: How to make a  new dataset interoperable from the start?
permalink: scenarios/make_dataset_interoperable
page_id: make_dataset_interoperable
custom_js: metro-timeline
---

## Scenario Overview
Design new dataset so it is interoperable from the start, including alignment to existing standards or reference datasets.

Before getting started:

* Be sure you are clear about your FAIRifcation Objectives
* When necessary, make sure you enlist the help from a FAIR data steward, if possible
* If there are gaps in your (team's) knowledge, considering following training



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
  complexity_tooltip="Making a dataset findable requires coordinating metadata quality, access conditions, and catalogue requirements. While no data transformation is needed, aligning metadata with a FAIR Data Point and national catalogue standards adds moderate complexity."
  experts_tooltip="A data steward is needed to guide the metadata assessment, align it with catalogue requirements, and publish the metadata to the FAIR Data Point for harvesting."
  outcome_tooltip="A dataset that is interoperable."
%}

## Your Journey

{% include metro-timeline.html stops=site.data.scenarios.make_dataset_interoperable %}

