---
title: I want my existing dataset to be citable in my publication
permalink: scenarios/make_dataset_citable
page_id: make_dataset_citable
custom_js: metro-timeline
---

## Scenario Overview
I'm publishing a research paper based on an existing dataset. 
I want to make sure that the dataset is citable in my publication.
The dataset may contain sensitive data, so open access may not be an option. 
However, I still want to make sure that the dataset is findable and referenceable, which requires the assignment of a persistent identifier, even if access to the data remains restricted.

Before getting started:

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
      <p>I am a Radboudumc researcher preparing a research article on lung nodules detected in chest CT scans.</p>
      <p>The study uses an existing dataset consisting of CT images from 50 patients, along with corresponding radiology reports.</p>
      <p>The dataset was originally collected as part of routine clinical care and was later extracted for research purposes after verifying that appropriate consent had been obtained. During the analysis, I used a subset of the data and derived additional variables, including nodule size and classification labels.</p>
      <p>As I prepare the manuscript for submission, I need to ensure that the dataset underlying the results can be properly cited. This enables readers to identify exactly which data were used and supports transparency, traceability and reproducibility.</p>
      <p>Because the dataset contains sensitive medical imaging data, it cannot be made openly reusable. Journals recognise such constraints, for example in Nature’s guidance on sharing expectations for sensitive data. However, the dataset still needs to be findable and referenceable. This requires the assignment of a persistent identifier, even if access to the data remains restricted.</p>
    </div>
  </div>
</div>

{% include scenario-overview.html
  complexity="Low / Medium"
  experts="Data Steward"
  outcome="Citable dataset"
  complexity_tooltip="Complying to local and publisher policies requires expertise."
  experts_tooltip="A data steward is needed to navigate and implement the local and publisher policies compliance."
  outcome_tooltip="Persistent identifier for dataset to be used in publication."
%}

## Your Journey

{% include metro-timeline.html stops=site.data.scenarios.make_dataset_citable %}

