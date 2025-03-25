---
title: Have a FAIR data steward on board
permalink: /metroline_steps/have_a_fair_data_steward_on_board
---

>***FAIR evaluation results can serve as a pointer to where your FAIRness can be improved. (FAIRopoly)***
>
> A pre-FAIR assessment evaluates the current state of your data and its alignment with the FAIR principles. Performing this assessment early makes you aware of possibilities for increasing the FAIRness of your data, which in turn increases its impact and ensures its long-term usability.

## Short description
In this phase you assess whether your (meta)data already meets FAIR criteria, such as persistent unique identifiers for data elements and rich metadata. By using FAIRness assessment tooling you can quantify the level of FAIRness of the data based on its current characteristics and environment. The assessment outcomes can help shape the necessary steps and requirements needed to achieve the desired FAIRification objectives (see A Generic Workflow for the Data FAIRification Process and FAIR in Action Framework by FAIRplus). 

The how-to section describes a variety of assessment tools based on the FAIR principles. 

## Why is this step important 
This step will help you assess the current FAIRness level of your data. Comparing the current FAIRness to the previously defined FAIRification objectives will help you shape the necessary steps and requirements needed to achieve your FAIRification goals and help you create your solution plan, a workplan specifically designed for reaching these goals. Furthermore, the assessment can be repeated in the Assess FAIRness step, allowing you to compare the results and check the progress of your data towards FAIRness.

## How to
### Step 1 - Types of tools
Decide which type of tool fits your goal(s) best. Broadly, the tools fall into two categories. 
* Online self-assessment surveys. Here, the user is presented with an online form, which is filled in manually.
* (Semi) automated tests.  Here (semi) automated tests are performed on a dataset by providing the tool with, for example, a link to an already published dataset. 

In both cases, the result gives an indication about the FAIRness of the (meta)data. Additionally, tools may give advice how to improve FAIRness. It is important to bear in mind that outcomes of tools may vary due to, for example, differences in tests performed and subjectivity of self-assessments surveys. See FAIR Assessment Tools: Towards an “Apples to Apples” Comparisons for more information this.

While we focus specifically on the FAIRness of (meta)data in this step, it is also possible to assess general FAIR awareness, for example by using the FAIR Aware tool provided by DANS.

### Step 2 - Popular tools
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
    <td><b>ARDC FAIR self assessment</b></td>
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
    <td><b>The FAIR Data Maturity Model</b></td>
    <td>
        Based on the FAIR principles and sub-principles, the Research Data Alliance created a checklist with FAIR maturity indicators and guidelines. These can be used to assess the FAIRness of (meta)data.
        <br><br>
        The FAIR Data Maturity Model is recommended by, amongst others, HL7, the world’s leading health IT standards development organisation.
    </td>
    <td>
        Download the Excel file from Zenodo and in the ‘FAIR Indicators_v0.05’ tab, give a score to the 41 different ‘maturity indicators’, by selecting the level from the drop-down menu in the ‘METRIC’- column, that fits the status if your (meta)data best. Potentially perform this with assistance of a FAIR expert/data steward.
        <br><br>
        View the results in the ‘LEVELS' tab. Detailed definitions and examples for all 'maturity indicators’ can be found in the documentation on Zenodo.
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
        <td><b>The FIP Wizard</b></td>
        <td>
            A FAIR Implementation Profile (FIP) is a community’s collective choice of technologies to implement the FAIR principles. The FIP Wizard captures these choices through a questionnaire and publishes them as machine-readable, open data. This promotes reuse, saves effort and fosters standardisation across communities.
        </td>
        <td>
            To use the FIP Wizard, create an account and review the user guide to understand the system and workflow. The wizard provides operates as a question-answer form to fill out.
            <br><br>
            See Funder Step: Creating a FAIR Implementation Profile (FIP) for more details.
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
        <td><b>FAIR-Checker</b></td>
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
        <td><b>The FAIR Evaluator</b></td>
        <td>The FAIR Evaluator provides an online service to test (meta)data resources against the FAIR Maturity Indicators in an objective, automated way.<br><br>The public version of The FAIR Evaluator has been used to assess >5500 datasets.</td>
        <td>A guide on how to use the FAIR Evaluator can be found in the FAIR Cookbook.</td>
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
* FAIRassist offers an overview of available tools;
* several tools are evaluated and compared in FAIR assessment tools: evaluating use and performance;
* RDMkit discusses several solutions.

### Step 3 - Effective approach to conducting a pre-FAIR assessment 
To successfully do a pre-FAIR assessment, do the following:
* learn from examples (see the practical examples section);
* familiarise yourself with the tool you intend to use;
* involve the necessary experts (see expertise requirements section);
* perform the assessment.

The final evaluation will give insight into the current FAIRness of your data. Depending on the tool used, you may receive feedback on how to improve the FAIRness of your data. Thus, the outcome of the pre-FAIR assessment helps you determine the next steps to achieve your FAIRification goals.

## Expertise requirements for this step 
The expertise required may depend on the assessment tool you want to use. Experts that may need to be involved, as described in Metroline Step: Build the Team, are described below.
* FAIR data stewards. Specialist who can help filling out the surveys and questionnaires.
* Research software engineers. Specialists who can help running some of the specialised software.

## Practical examples from the community 
For an applied example of The FAIR Evaluator, see Applying the FAIR principles to data in a hospital: challenges and opportunities in a pandemic.

## Training
Relevant training will be added soon.

## Suggestions
This page has been written and reviewed by field experts through a rigorous process and has reached the “released” status. Learn more about the contributors here and explore the development process here. If you have any suggestions, visit our How to contribute page to get in touch.
