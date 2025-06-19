---
title: Evaluating the FAIRness of your data
permalink: scenarios/evaluate_data_fairness
page_id: scenario_evaluate_fairness
---

## Description
This scenario illustrates which Metroline steps apply to "Evaluating the FAIRness of your data". Since it's a small scenario with no actual FAIR improvements, steps such as "Design solution plan" and "Assess FAIRness" are not part of the workflow. Thus, the workflow consists of three steps:
* **Define FAIRification objectives** to properly define your goals.
* **Have a FAIR data steward on board** to make sure you have the necessary support.
* **Pre-FAIR assessment** to assess the FAIRness of your data.


## Workflow
{% include graph_logic/init-graphs.html %}
<div class="image-wrapper mermaid-no-min-height">
  <div class="graph-block" data-graph-id="graph1"></div>
</div>

<div id="stepContentWrapper">
    <div id="stepContent"></div>
</div>


## Applied example
In this practical example, a researcher's institute has defined minimum FAIR data requirements. The researcher wants to assess the current FAIRness of their data to determine whether they already comply with these institutional standards.

### Define FAIR objectives

| Step                                                                                                                                               | Applied                                                                                                                                                                                                                                                       |
|----------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [1 - Understand the FAIR principles](../metroline_steps/define_fairification_objectives#step-1---understand-the-fair-principles){:target="_blank"} | I have a basic understanding of the FAIR principles.                                                                                                                                                                                                          |
| 2 - Identify FAIR requirements                                                                                                                     | Institutional requirements. My institute has set minimal FAIR requirements for data. I want to get an indication if I meet these requirements.                                                                                                                |
| 3 - Assess impact                                                                                                                                  | Currently, the impact is minimal, since it's just exploratory.                                                                                                                                                                                                |
| 4 - Define the target FAIR level                                                                                                                   | Not applicable. I would like a general indication of my data’s FAIRness to determine whether it complies with my institute’s requirements.                                                                                                                    |
| 5 - Identify required resources                                                                                                                    | I'll need help from a FAIR data steward to find out how FAIR my data currently is. My institute has data stewards.                                                                                                                                            |
| 6 - Organise and outline necessary steps                                                                                                           | * **Objective 1.** Evaluate the FAIRness of my dataset.<br>* **Objective 2.** Gain insight on how to further improve the FAIRness of my dataset.<br> If do not meet my institute's FAIR requirements yet, I will use these insights to set up new objectives. |


### Have a FAIR data steward on board
Since FAIR is not my expertise, I enlist the help of a FAIR data steward who brings FAIR knowledge.

| Step                                                     | Applied                                                                                                                                                                                                                                        |
|----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1 - Identify the right data steward                      | I need a research-oriented data steward.                                                                                                                                                                                                       |
| 2 - Determine the steward’s position in the organisation | Department- or division-based. Our department has dedicated data stewards.                                                                                                                                                                     |
| 3 - Hire or consult a data steward                       | I need to consult a data steward that has knowledge about:<br> 1. Compliance. Advise on institutional compliance with RDM policies and regulations.<br>2. Data sharing & publishing. Identify gaps in support for data sharing and publishing. |
| 4 - Ensure support and compliance                        | Not applicable, this aspect is for the data steward's manager to take care of.                                                                                                                                                                 |

_SdR. Not 100% sure what to write for step 3 here_

### Pre-FAIR assessment
I do this step together with the FAIR data steward from the previous step. 

| Step                                                       | Applied                                                                                                                                                                                                         |
|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1 - Types of tools                                         | Since the data isn't published yet, we decide an online self-assessment survey is most suitable.                                                                                                                |
| 2 - Popular tools                                          | After discussing our options, we pick the ARDC FAIR self assessment. This tool:<br>* helps assess how FAIR our data currently is;<br>* provides suggestions on how to further improve the FAIRness of the data. |
| 3 - Effective approach to conducting a pre-FAIR assessment | Since I have the help of a professional FAIR data steward, I'm confident we'll get accurate results.                                                                                                            |

### Finished
After completing the pre-FAIR assessment, the researcher has:
* knowledge about the FAIRness of our data (objective 1);
* knowledge on how to further improve the FAIRness (objective 2).

This knowledge can be used to define new FAIRification objectives if necessary.

