---
title: Pre-FAIR assessment
permalink: /metroline_steps/pre_fair_assessment
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***FAIR evaluation results can serve as a pointer to where your FAIRness can be improved. ([FAIRopoly](https://www.ejprarediseases.org/fairopoly/))***
> 
> {{ current_step.summary }}

## Short description
In this phase you assess whether your (meta)data already meets FAIR criteria, such as persistent unique identifiers for data elements and rich metadata. By using FAIRness assessment tooling you can quantify the level of FAIRness of the data based on its current characteristics and environment. The assessment outcomes can help shape the necessary steps and requirements needed to achieve the desired [FAIRification objectives](define_fairification_objectives) (see [A Generic Workflow for the Data FAIRification Process](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification) and [FAIR in Action Framework by FAIRplus](https://www.nature.com/articles/s41597-023-02167-2)). 

The how-to section describes a variety of assessment tools based on the FAIR principles. 

## Why is this step important 
This step will help you assess the current FAIRness level of your data. Comparing the current FAIRness to the previously defined [FAIRification objectives](define_fairification_objectives) will help you shape the necessary steps and requirements needed to achieve your FAIRification goals and help you create your [solution plan](design_solution_plan), a workplan specifically designed for reaching these goals. Furthermore, the assessment can be repeated in the [Assess FAIRness](asses_fairness) step, allowing you to compare the results and check the progress of your data towards FAIRness.

## How to
### Step 1 - Choose the right tool type for your FAIR Assessment
Decide which type of tool fits your goal(s) best. Broadly, the tools fall into two categories. 
* **Online self-assessment surveys.** Here, the user is presented with an online form, which is filled in manually.
* **(Semi) automated tests.**  Here (semi) automated tests are performed on a dataset by providing the tool with, for example, a link to an already published dataset. 

In both cases, the result gives an indication about the FAIRness of the (meta)data. Additionally, tools may give advice how to improve FAIRness. It is important to bear in mind that outcomes of tools may vary due to, for example, differences in tests performed and subjectivity of self-assessments surveys. See [FAIR Assessment Tools: Towards an “Apples to Apples” Comparisons](https://www.eosc.eu/sites/default/files/2023-01/Report%20on%20the%20FAIR%20Evaluation%20events_final_sub.pdf) for more information this.

While we focus specifically on the FAIRness of (meta)data in this step, it is also possible to assess general FAIR awareness, for example by using the [FAIR Aware tool](https://fairaware.dans.knaw.nl/) provided by DANS.

### Step 2 - Consider using a well-known FAIR assessment tool
The tables below provide an overview of some of the more popular tools from both categories. 

#### Online self-assessment surveys
<table>
  <tr>
    <th>Tool</th>
    <th>Description</th>
    <th>Work on your side</th>
    <th>Key features</th>
  </tr>
  <tr>
    <td><a href="https://ardc.edu.au/resources/working-with-data/fair-data/fair-self-assessment-tool/">ARDC FAIR self assessment</a></td>
    <td>Provided by Australian Research Data Commons, this 12-question online survey provides a visual indication of the FAIRness level of your (meta)data and provides resources on how to improve it. 
        <br><br>
        From October 2023 until May 2024, the site had around 2500 visitors who actively interacted with the page.</td>
    <td>Fill in the survey, potentially with help of a FAIR expert/data steward.</td>
    <td>
      <ul>
        <li>Online survey</li>
        <li>Easy to use</li>
        <li>Small time investment</li>
        <li>Suggests improvements</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><a href="https://zenodo.org/records/3909563#.YGRNnq8za70">The FAIR Data Maturity Model</a></td>
    <td>
        Based on the FAIR principles and sub-principles, the Research Data Alliance created a checklist with FAIR maturity indicators and guidelines. These can be used to assess the FAIRness of (meta)data.
        <br><br>
        The FAIR Data Maturity Model is recommended by, amongst others, <a href="https://confluence.hl7.org/display/SOA/Recommendations">HL7</a>, the world’s leading health IT standards development organisation.
    </td>
    <td>
        Download the <a href="https://zenodo.org/records/3909563/files/FAIR_evaluation_levels_v0.02.xlsx?download=1">Excel file</a> from Zenodo and in the ‘FAIR Indicators_v0.05’ tab, give a score to the 41 different ‘maturity indicators’, by selecting the level from the drop-down menu in the ‘METRIC’- column, that fits the status if your (meta)data best. Potentially perform this with assistance of a FAIR expert/data steward.
        <br><br>
        View the results in the ‘LEVELS' tab. Detailed definitions and examples for all 'maturity indicators’ can be found in the <a href="https://zenodo.org/records/3909563/files/FAIR%20Data%20Maturity%20Model_%20specification%20and%20guidelines_v1.00.pdf?download=1">documentation</a> on Zenodo.
    </td>
    <td>
        <ul>
            <li>Downloadable Excel-based survey</li>
            <li>More elaborate than ARDC</li>
            <li>Gives an indication of your FAIR level.</li>
        </ul>
    </td>
  </tr>
    <tr>
        <td><a href="https://fip-wizard.ds-wizard.org/">FIP Wizard</a></td>
        <td>
            A FAIR Implementation Profile (FIP) is a community’s collective choice of technologies to implement the FAIR principles. The FIP Wizard captures these choices through a questionnaire and publishes them as machine-readable, open data. This promotes reuse, saves effort and fosters standardisation across communities.
        </td>
        <td>
            To use the FIP Wizard, create an account and review the <a href="https://gofair-foundation.github.io/gofair-wiki/docs/fip/content.html">user guide</a> to understand the system and workflow. The wizard provides operates as a question-answer form to fill out.
            <br><br>
            See <a href="creating_a_fair_implementation_profile">Funder Step: Creating a FAIR Implementation Profile (FIP)</a> for more details.
        </td>
        <td>
            <ul>
                <li>Developed by the GO FAIR Foundation</li>
                <li>Generates both human-readable and machine-actionable output</li>
            </ul>
        </td>
    </tr>
</table>

#### Online (semi-) automated tests
<table>
    <tr>
        <th>Tool</th>
        <th>Description</th>
        <th>Work on your side</th>
        <th>Key features</th>
    </tr>
    <tr>
        <td><a href="https://fair-checker.france-bioinformatique.fr/">FAIR-Checker</a></td>
        <td>FAIR-Checker provides a web interface to automatically evaluate FAIR metrics. It provides users with hints on how to further improve the FAIRness of the resources. <br/>FAIRchecker does over 18000 metrics evaluations per month.</td> 
        <td>In the ‘Check' page, paste a URL or DOI and click on 'Test all metrics’. The assessment will run automatically and return a score for 12 FAIR sub-principles. If a sub-principle does not reach the highest score, you can view recommendations on how to improve.</td>
        <td>
            <ul>
                <li>Automatically evaluates FAIRness of a dataset</li>
                <li>Provides a radar chart showing test results</li>
                <li>Suggests improvements for failed tests</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><a href="https://w3id.org/AmIFAIR">The FAIR Evaluator</a></td>
        <td>The FAIR Evaluator provides an online service to test (meta)data resources against the <a href="https://github.com/FAIRMetrics/Metrics/tree/master/MaturityIndicators">FAIR Maturity Indicators</a> in an objective, automated way.<br><br>The public version of The FAIR Evaluator has been used to assess >5500 datasets.</td>
        <td>A guide on how to use the FAIR Evaluator can be found in the <a href="https://faircookbook.elixir-europe.org/content/recipes/assessing-fairness/fair-assessment-fairevaluator.html">FAIR Cookbook.</a></td>
        <td>
            <ul>
                <li>Automatically evaluates FAIRness of a dataset</li>>
                <li>Assessment based on second generation of FAIR Maturity Indicators</li>
                <li>Provides a doughnut chart showing test results</li>
                <li>Provides a log that indicates why a test failed</li>
            </ul>
        </td>
    </tr>
</table>

To find even more tools:  
* **[FAIRassist](https://fairassist.org/).** Offers an overview of available tools;
* **[RDMkit](https://rdmkit.elixir-europe.org/compliance_monitoring#how-can-you-measure-and-document-data-management-capabilities).** Discusses several solutions, such as the FAIR metrics and FAIRshake;
* **[FAIR assessment tools: evaluating use and performance](https://www.sciencedirect.com/science/article/pii/S2452074822000246).** Paper comparing several tools.


### Step 3 - Prepare before you start your FAIR assessment
To successfully do a pre-FAIR assessment, do the following:
* learn from examples (see the [practical examples](#practical-examples-from-the-community) section);
* familiarise yourself with the tool you intend to use;
* involve the necessary experts (see [expertise requirements](#expertise-requirements-for-this-step) section);
* perform the assessment.

The final evaluation will give insight into the current FAIRness of your data. Depending on the tool used, you may receive feedback on how to improve the FAIRness of your data. Thus, the outcome of the pre-FAIR assessment helps you determine the next steps to achieve your FAIRification goals.

## Expertise requirements for this step
The expertise required may depend on the assessment tool you want to use. Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below.
* **FAIR data stewards.** Specialist who can help filling out the surveys and questionnaires.
* **Research software engineers.** Specialists who can help running some of the specialised software.

## Practical examples from the community
For an applied example of The FAIR Evaluator, see [Applying the FAIR principles to data in a hospital: challenges and opportunities in a pandemic](https://jbiomedsem.biomedcentral.com/articles/10.1186/s13326-022-00263-7).

## Training
Relevant training will be added soon.

## Suggestions
{% include metroline_steps/suggestions_released.html %}

