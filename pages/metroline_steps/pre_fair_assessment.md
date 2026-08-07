---
title: Pre-FAIR assessment
permalink: /metroline_steps/pre_fair_assessment
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***FAIR evaluation results can serve as a pointer to where your FAIRness can be improved. ([FAIRopoly](https://www.ejprarediseases.org/fairopoly/))***
> 
> {{ current_step.summary }}

## Short description
In this phase you assess whether your (meta)data already meets FAIR criteria, such as persistent unique identifiers for data elements and rich metadata. By using FAIRness assessment tooling you can quantify the level of FAIRness of the data based on its current characteristics and environment. The assessment outcomes can help shape the necessary steps and requirements needed to achieve the desired [FAIRification objectives](define_fairification_objectives) (see [A Generic Workflow for the Data FAIRification Process](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification) and [FAIR in Action Framework by FAIRplus](https://www.nature.com/articles/s41597-023-02167-2)). 

The how-to section describes a variety of assessment tools based on the FAIR principles. 

## Why is this step important 
This step will help you assess the current FAIRness level of your data. Comparing the current FAIRness to the previously defined [FAIRification objectives](define_fairification_objectives) will help you shape the necessary steps and requirements needed to achieve your FAIRification goals and help you create your [solution plan](design_solution_plan), a workplan specifically designed for reaching these goals. Furthermore, the assessment can be repeated in the [Assess FAIRness](assess_fairness) step, allowing you to compare the results and check the progress of your data towards FAIRness.

## How to
### Step 1 - Choose the right tool type for your FAIR Assessment
Decide which type of tool fits your goal(s) best. Broadly, the tools fall into two categories. 
* **Online self-assessment surveys.** Here, the user is presented with an online form, which is filled in manually.
* **(Semi) automated tests.**  Here (semi) automated tests are performed on a dataset by providing the tool with, for example, a link to an already published dataset. 

In both cases, the result gives an indication about the FAIRness of the (meta)data. Additionally, tools may give advice how to improve FAIRness. It is important to bear in mind that outcomes of tools may vary due to, for example, differences in tests performed and subjectivity of self-assessments surveys. See [FAIR Assessment Tools: Towards an “Apples to Apples” Comparisons](https://www.eosc.eu/sites/default/files/2023-01/Report%20on%20the%20FAIR%20Evaluation%20events_final_sub.pdf) for more information this.

While we focus specifically on the FAIRness of (meta)data in this step, it is also possible to assess general FAIR awareness, for example by using the {% include toolassemblies/show-badges.html ids="fair-aware" %} tool provided by DANS.

### Step 2 - Consider using a well-known FAIR assessment tool
The tool pages below provide an overview of some of the more popular tools from both categories.

#### Online self-assessment surveys
{% include toolassemblies/show-tiles.html ids="ardc-fair-self-assessment-tool, fair-data-maturity-model, fip-wizard, fair-aware" %}

#### Online (semi-) automated tests
{% include toolassemblies/show-tiles.html ids="fair-checker, fair-evaluator" %}

To find even more tools:  
* **{% include toolassemblies/show-badges.html ids="fairassist" %}.** Offers an overview of available tools;
* **[RDMkit](https://rdmkit.elixir-europe.org/compliance_monitoring#how-can-you-measure-and-document-data-management-capabilities).** Discusses several solutions, such as the FAIR metrics and FAIRshake;
* **[FAIR assessment tools: evaluating use and performance](https://www.sciencedirect.com/science/article/pii/S2452074822000246).** Paper comparing several tools.


### Step 3 - Prepare before you start your FAIR assessment
To successfully do a pre-FAIR assessment, do the following:
* learn from examples (see the [practical examples](#practical-examples-from-the-community) section);
* familiarise yourself with the tool you intend to use;
* involve the necessary experts (see [expertise requirements](#expertise-requirements-for-this-step) section);
* perform the assessment.

The final evaluation will give insight into the current FAIRness of your data. Depending on the tool used, you may receive feedback on how to improve the FAIRness of your data. Thus, the outcome of the pre-FAIR assessment helps you determine the next steps to achieve your FAIRification goals.

## Practical examples from the community
For an applied example of The {% include toolassemblies/show-badges.html ids="fair-evaluator" %}, see [Applying the FAIR principles to data in a hospital: challenges and opportunities in a pandemic](https://jbiomedsem.biomedcentral.com/articles/10.1186/s13326-022-00263-7).

## Training
**DMP Instructional Trainings**<br>
Relevant Trainings for this session might those who initially deal with Data Management Plans. Data Management Plans tend to be the starting point to draft a plan to eventually FAIRIFY the data. Every University Hospital and University in The Netherlands has their own DMP relevant training. One way to find them is to look for them in the Health-RI portfolio of [Services](https://www.healthdata.nl/en/services?rendered_item=DMP).

**Specific Trainings on FAIRIFICATION of data**<br>
Other relevant trainings deal directly with the FAIR principles and how they can be applied to research data. The FAIR Data to Boost Research and Diagnosis organized by the World Duchenne Organization is an example. To see more information about this particular training visit: [FAIR Data to Boost Research & Diagnostic \| National Health Data Portal](https://www.healthdata.nl/en/services/fair-data-boost-research-diagnostic)

The Go FAIR Foundation also offers multiple Training a year dedicated to FAIR awareness. For more information look into: [Upcoming training \| GO FAIR Foundation](https://www.gofair.foundation/upcoming-training). It’s however important to notice that these trainings do have a cost. 

## Suggestions
{% include metroline_steps/suggestions_released.html src=page.title%}
