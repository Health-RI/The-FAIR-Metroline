---
title: Define FAIRification objectives
permalink: /metroline_steps/define_fairification_objectives
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***A FAIRification objective is the end goal that the owners of a resource \[e.g. dataset, database, protocols, analysis workflow] are looking to achieve with the process of FAIRification. ([EJP RD FAIRification Guidelines](https://github.com/ejp-rd-vp/FAIRificationGuidance/blob/main/FAIRificationObjectives.pdf))***
>
> {{ current_step.summary }}

## Short description
FAIRification enhances data Findability, Accessibility, Interoperability, and Reusability (FAIR) by improving documentation, metadata, and standardisation. It applies to both new and existing data. Defining FAIRification objectives is the first step in this process and can be guided by models such as [FAIRopoly](https://www.ejprarediseases.org/fairopoly/), [A Generic Workflow for the Data FAIRification Process](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification), and the [FAIR in Action Framework](https://www.nature.com/articles/s41597-023-02167-2).

These objectives may be set by institutes, funders, or journals to promote data reuse (see FAIRsharing). As a researcher, aligning with FAIRification efforts can increase visibility, recognition, and opportunities for collaboration. Spend some time considering your FAIRification objectives. What is your FAIR driving force?

## Why is this step important 
Setting clear FAIRification objectives is essential for several reasons.
* **Clarify purpose.** Provides direction for FAIRification in studies and projects, ensuring clear roles and responsibilities.
* **Enhance collaboration.** Facilitates communication among team members and stakeholders, ensuring shared understanding of FAIR goals.
* **Measure progress.** Establishes measurable milestones, supporting tracking and continuous improvement.

FAIR objectives help identify which steps in the [FAIR Metroline]({{site.baseurl}}/index) are relevant to your FAIRification journey, ensuring a structured and efficient approach.

## How to
### Step 1 - Get familiar with the FAIR principles
Get acquainted with the FAIR principles through resources like the [GO FAIR Foundation (GFF) website](https://www.gofair.foundation/) and your institute’s Research Data Management (RDM) department. These principles are foundational for defining FAIRification objectives.

### Step 2 - Identify FAIR requirements
As you define your FAIRification objectives, take time to review the relevant requirements from various sources.
* **Funders and consortia.** Check whether your project funders, the consortium you are involved in, or the journal where you intend to publish have specific FAIR requirements. [FAIRsharing](https://fairsharing.org/) offers a comprehensive overview of these policies.
* **Institutional requirements.** Investigate any FAIR requirements set by your institute. For example, you may be required to upload your (meta)data to designated repositories or catalogues to comply with institutional policies.
* **Project-specific requirements.** Think about any FAIRification goals specific to your project, such as adding more metadata for reusability, organising new data collections in an interoperable format, or ensuring that key data is made FAIR in real time.

As the Data Management Plan (DMP) is usually created early in a project, it’s important to set your FAIRification objectives at the outset. Tools like [DMP Online](https://dmponline.dcc.ac.uk/) and the [Data Stewardship Wizard (DSW)](https://ds-wizard.org/)  can help align your FAIRification goals with institutional and funder expectations.

### Step 3 - Weigh FAIRification impact, benefits and effort
Consider the impact of your FAIRification efforts early on to ensure your objectives align with the broader benefits. For instance:
* **Benefits for the researcher.** Your FAIRification efforts can lead to more visibility, recognition and reuse of the work, potentially leading to new collaboration opportunities, more publications, more citations, etc.
* **Cost-benefit ratio.** Does the end result outweigh the efforts you are putting in?
* **Reuse of data.** In what way do potential reusers of your data (e.g. researchers, other users of the data) benefit most from the results of your FAIRification efforts?
* **Stakeholder benefits.** What other stakeholders (e.g. patients, general population, clinicians) would benefit from making your data more FAIR?
* **Research question.** How does the driving research question impact your FAIRification objectives?

### Step 4 - Decide the appropriate FAIRification level
Decide on the desired FAIR level for your project or study. Conducting a pre-FAIR assessment (see [Metroline step: Pre-FAIR Assessment]({{site.baseurl}}/metroline_steps/pre_fair_assessment)) helps to determine whether a lightweight FAIR approach (e.g. improving from non-structured to structured metadata) or a more extensive one (e.g. transforming a relational database into fully ontologised linked data) is suitable for your needs.

### Step 5 - Identify the resources required for the FAIRification
Identify the resources you will need to complete your FAIRification process and assess their availability. Consider the following:
* Is there someone in your team who has run a FAIRification project before?
* Is there expertise or central support available in your institute?
* Do you need to hire specific expertise?
* Do you need specific software or additional hardware to meet your FAIRification objectives?

See [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team) for more information on team requirements.

### Step 6 - Create an actionable plan around clear objectives
Organise and describe the steps and resources identified in the previous step necessary for reaching your FAIRification objective(s). This can be a separate plan (see [Metroline Step: Design Solution Plan]({{site.baseurl}}/metroline_steps/design_solution_plan)) or part of your Data Management Plan (DMP). Make sure to formulate your FAIRification objectives as specifically as possible and, where possible, incorporate research questions. For example:
* I require interoperable data, because I need to connect two different datasets to answer question X;
* I want to make my data more findable for researchers in my field by publishing it in repository Z.

## Expertise requirements for this step 
Defining FAIRification objectives is typically a collaborative effort by a range of experts, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team).
* **Researchers with domain knowledge.** Provide context to the FAIRification efforts from the perspective of a domain.
* **FAIR data stewards.** Help define FAIRification objectives to meet the project’s, funder’s, journal’s and/or institute’s requirements.
* **Semantic experts.** Assist in specifying the metadata/modelling aspects of FAIRification objectives.
* **ELSI experts.** Help identify the legal compliance and ethical aspects of FAIRification objectives.

## Practical examples from the community 
Below you can find several examples of projects with the FAIR objectives they set.

***[European Joint Programme on Rare Diseases (EJP RD)](https://www.ejprarediseases.org/)***
<br>Programme aiming to create an effective rare diseases research ecosystem.

FAIRification objectives include, for example (see for more information the [FAIRopoly website](https://www.ejprarediseases.org/fairopoly/)):
* an interoperable registry, requiring standardised and machine-readable data;
* identification of patient cohorts for clinical trials, requiring to collect standardised and reusable data;
* a Rare Diseases research ecosystem, requiring data to be completely FAIR so that information can be queried at the source.

***[Metachromatic leukodystrophy initiative (MLDi)](https://www.mldinitiative.com/)***
<br>The MLDi is an international patient registry for MLD and an academic collaborative network

FAIRification objectives include (see also the MLDi demonstrator project page):
* sustainable MLDi registry, requiring interoperability with future and existing (international) MLD databases;
* reusable MLDi data, by creating a web-based semantic model to improve interoperability;
* FAIR as team effort, requiring people with the right expertise.


***[Dutch National Health Data Catalogue](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279150593)***
<br>The National Health Data Catalogue is an overview of health and life sciences research data in the Netherlands

For onboarding metadata into the catalogue, the following FAIRification objectives apply:
* the (meta)data must be findable by humans and computers;
* provide information on how the data can be accessed;
* metadata must be [mapped](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279281676) to the [DCAT-AP core schema](https://github.com/Health-RI/health-ri-metadata/) and provided via a [FAIR Data Point](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279183386);
* include a [machine-readable license](https://spdx.dev/learn/handling-license-info/) (see also [DCAT-AP info](https://docs.geostandaarden.nl/dcat/dcat-ap-nl30/#distribution-licence)) and provenance information on how the data was created.

## Training
At this stage of the FAIR Metroline, even before beginning training, a useful resource to look at, especially for the life sciences, is:
* The [FAIR Toolkit](https://fairtoolkit.pistoiaalliance.org/) for Life Science Industry by Pistoia Alliance

## Suggestions
{% include metroline_steps/suggestions_released.html %}
