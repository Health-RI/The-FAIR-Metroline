---
title: Assess FAIRness
permalink: /metroline_steps/assess_fairness
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Without this phase, there is a danger of work continuing beyond the point where the benefits to the project justify the continued expenditure of resources. ([FAIR in action](https://pmc.ncbi.nlm.nih.gov/articles/PMC10199076/))***
> 
> {{ current_step.summary }}

## Short description 
In this step, you assess whether the objectives of your FAIRification process have been achieved. As outlined in [A Generic Workflow for the Data FAIRification Process](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification), this may include evaluating the extent to which the original [FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives) have been met and assessing the FAIR status of your data and metadata, for example, by using [FAIR assessment tools]({{site.baseurl}}/metroline_steps/pre_fair_assessment). Depending on your solution plan, this step may mark the completion of your FAIRification journey or serve as an intermediate checkpoint to review progress and, if needed, refine your objectives.

## Why is this step important 
Assessing FAIRness after FAIRification ensures that your dataset truly meets your original goals and reveals where further work is needed. This step is key to: 
* **Verifying FAIR compliance.** Confirms whether your data is truly Findable, Accessible, Interoperable and Reusable, rather than just improved. 
* **Ensuring long-term usability.** Prevents obsolescence by checking if your data remains understandable and accessible over time. 
* **Pinpointing gaps.** Identifies remaining issues—like missing metadata or access barriers—supporting ongoing improvement. 
* **Building trust and transparency.** Clarifies access policies and validates metadata availability, even if the data itself is restricted later. 
* **Boosting reuse and impact.** Well-assessed FAIR datasets are more likely to be shared, cited and reused in future research. 
* **Meeting External Expectations.** A FAIRness assessment ensures your dataset complies with mandates and expectations from institutions, funders (like Horizon Europe or the NIH), journals, and the wider scientific community.  

Aligning with these key points does not only support accountability but also reinforces the credibility and acceptance of your work. 

## How to 
### Step 1 – Check if you reached your (original) FAIRification objectives 
You set out by defining [FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives) at the beginning of your project. You should now check if you reached these objectives, reflecting on them one by one. Keep in mind: 
* How important was the objective? 
  * The objective is a must-have. For example, if one goal is to meet specific funder, institutional, and/or journal requirements, not reaching it may not be an option. 
    * For example, ZonMw requires you to fill in their so-called “[kerntabel](https://www.zonmw.nl/nl/instructies-voor-rapportage-over-fair-datamanagement-met-kerngegevens)” which should provide information on where data is stored and how it can be accessed. This information should be published and have a persistent identifier (doi). 
  * The objective is a nice-to-have. Some goals may be optional or dependent on available resources. For example, achieving fully interoperable data may be too complicated or too time-consuming if no experts are available. 
* Do you have the resources for further improvement? 
  * If funding runs out, further FAIR enhancements may not be realistic and you may have to settle for less ambitious goals. Sometimes. “good enough” is acceptable given time, budget, or resource limits. 
  * Identify any blockers, like missing expertise or tooling, and whether they’re worth addressing now or later. 
* Did any new requirements emerge during the project?
  * FAIRification is an iterative process; your goals may have evolved. 

### Step 2 – Re-assess the FAIRness of your data with tools
After reflecting on your original objectives in step 1, it’s important to objectively assess your data’s FAIRness at this stage. You can do this by using FAIR assessment tools. 
* In the [Pre-FAIR assessment step]({{site.baseurl}}/metroline_steps/pre_fair_assessment), various tools are discussed that can be used to assess fairness of data. By running such a tool in this stage, you can objectively assess how FAIR your data is right now.
* If you did a pre-FAIR assessment, rerunning the same tool in this phase is a great way to compare results to show progress. 

### Step 3 – Enhance the validation with complementary methods
In addition to using assessment tools, you should consider complementary methods to validate and further evaluate the FAIRness of your data and metadata. These options enhance the insights from step 2 and give you practical feedback. 
* **Conduct a peer review.** Engage external reviewers or peers to conduct an independent assessment for objectivity. 
* **Conduct tests.** If, for example, you set out to create machine actionable metadata, run actual tests to verify if this the case. 
  * Confirm that your data is registered in a publicly accessible, searchable repository. Ensure it’s indexed by search engines and is discoverable through well-structured metadata and keywords.
* **Try accessing the dataset as if you were an external user.** Can you find it? Understand it? Reuse it?
  * Test whether machine-actionable metadata actually works by using real scripts or applications to access and interpret it.
  * Ask intended users or colleagues to test useability and accessibility in the ways you intended.

### Step 4 - Document the results 
For internal use, this documentation can serve as a project record for your team or institution, supporting transparency, reproducibility, and future planning.

For external publication, it's good practice to also publish a summary of the FAIRification process alongside the dataset. This provides clarity to others on how FAIR the data is, what limitations exist, and how reuse should be approached.
* Record any gaps or deviations from the initial FAIRification goals. 
* Provide recommendations for further improvements if needed. 

### Step 5 - Continuously monitor and update the resources 
Even if your FAIRification efforts are complete for now, evolving requirements, such as changes in metadata standards, may require future updates. It is therefore essential to continue monitoring your resource to ensure it remains FAIR over time. 

To help keep an overview of the original FAIRification objectives, their status, and possible changes in the process, it might be useful to update this information in your datamanagement plan. Consider going back to [Metroline Step: Define FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives) to redefine the original FAIR objectives.

## Expertise requirements for this step 
The expertise required may depend on the assessment tool you want to use. Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below. 
* **Researcher.** Understands the data content and how it should be used. 
* **FAIR data stewards.** Specialist who can help filling out the FAIR assessment tools (see also [Metroline step: Pre-FAIR assessment]({{site.baseurl}}/metroline_steps/pre_fair_assessment)) 
* **Research software engineers.** Specialists who can help running some of the specialised software. 

## Practical examples from the community 
For an applied example of The FAIR Evaluator tool, see Applying the FAIR principles to data in a hospital: challenges and opportunities in a pandemic. 

## Training
{% include metroline_steps/training_will_be_added.html %}

## Suggestions
{% include metroline_steps/suggestions_development.html %}
