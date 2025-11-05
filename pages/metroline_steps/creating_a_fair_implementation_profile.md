---
title: Creating a FAIR Implementation Profile (FIP)
permalink: /metroline_steps/creating_a_fair_implementation_profile
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Ready-made and well-tested FIPs created by trusted communities will find widespread reuse among other communities and could vastly accelerate decision making on well-informed implementations of the FAIR Principles within and particularly between domains. [Reusable FAIR Implementation Profiles as Accelerators of FAIR Convergence](https://link.springer.com/chapter/10.1007/978-3-030-65847-2_13)***
>
> {{ current_step.summary }}

## Short description 
A [FAIR Implementation Profile](https://www.go-fair.org/how-to-go-fair/fair-implementation-profile/) (FIP) is a collection of practical implementation choices made by a community, such as a research project or institute, for all FAIR Principles. Developed by the [GO FAIR Foundation](https://www.go-fair.org/how-to-go-fair/fair-implementation-profile/), it serves as a structured recipe for making data FAIR, based on shared agreements and standards within that community. 

A key element of a FIP is the description of the specific FAIR-enabling resources (FERs) that a community uses to support each FAIR Principle. FERs are the concrete tools, standards and resources that make FAIR data practices possible. Examples include metadata schemas, controlled vocabularies, ontologies such as the [Human Phenotype Ontology](https://bioportal.bioontology.org/ontologies/HP), identifier systems like DOIs and data licences such as [CC BY](https://creativecommons.org/licenses/by/4.0/). Together, these resources form the technical and semantic backbone of FAIR data. 

Once published, a FIP can be reused by other communities to guide their own FAIR data implementation. It can also be used to compare your current FAIR practices, such as the standards used in your datasets, with those of your peers. This helps identify gaps, improve interoperability, and strengthen collaboration within and across domains. 

Pre-made, well-tested FIPs created by trusted communities can be widely reused and greatly speed up the adoption of consistent, well-informed FAIR implementations. FIPs and the FAIR-enabling resources they reference can be searched and explored in [FAIR Connect](https://fairconnect.pro/) and [Nanodash](https://nanodash.knowledgepixels.com/). 

## Why is this step important
The FAIR Principles, by design, do not define specific implementation choices that enable FAIR practices. As each community has its own established preferences and priorities for data reuse, coordinating a broadly accepted and consistent implementation approach remains a global challenge. 

FIPs capture the implementation strategies of various communities and can be used to harmonise the reuse of resources and improve interoperability across domains. Ready-made, well-tested FIPs created by reliable communities can promote widespread reuse and greatly accelerate convergence toward well-informed FAIR implementations. 

By promoting the use of community standards, FIPs directly support FAIR principle R1.3: “(Meta)data meet domain-relevant community standards.”  

## How to
### Step 1 - Choose your creation method
A FIP can be created in two ways: 
* **Option 2a.** Using the [FIP mini-questionnaire](https://docs.google.com/spreadsheets/d/1yx8r2St6ha-lmQtg02Fvwu8nB21uWiTOM8tLIgJ70oE/edit#gid=127295437) in Google Sheets.
* **Option 2b.** Using the [FIP Wizard](https://fip.fair-wizard.com/), a dedicated version of the online data management platform Data Stewardship Wizard.

Both approaches guide you through the same set of questions covering all FAIR Principles, but they differ in setup and output format. 

### Step 2a - Create a FIP using the mini-questionnaire
To start, create your own copy of the FIP mini-questionnaire and begin filling it out. This method is quick and accessible, requiring no special setup. The result is a human-readable FIP that captures your community’s FAIR implementation choices. However, this format is less suitable for machine processing, which makes large-scale analysis or automated comparison between different FIPs more difficult. 

### Step 2b - Create a FIP using the FIP Wizard
The FIP Wizard provides a more advanced and structured environment. You will need to create an account and consult the FIP Wizard user guide to understand the workflow. The system uses a question-and-answer format and generates both human-readable outputs (PDF, Word, Excel, CSV) and machine-actionable outputs ([nanopublications](https://nanopub.net/)). This makes it easier to analyse, compare, and share FIPs across communities. You can consult the [FIP Wzard User Guide](https://wiki.gofair.foundation/docs/fip/content.html) when creating a FIP in the FIP Wizard. 

### Step 3 - Publish your FIP for reuse
Once you’ve created your FIP using the FIP Wizard, you can publish it to make it available for reuse. When you choose to publish, the Wizard packages your FIP as a machine-actionable nanopublication and submits it to the public nanopublication network. After publication, your FIP and the FAIR-enabling resources it references become automatically searchable and reusable through [FAIR Connect](https://fairconnect.pro/) and [Nanodash](https://nanodash.knowledgepixels.com/). 

## Expertise requirements for this step 
Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below.
* researcher with domain knowledge;
* semantic expert / metadata expert;
* ELSI expert for e.g. licensing questions.

## Practical examples from the community 
* The Virus Outbreak Data Network ([VODAN](https://www.go-fair.org/implementation-networks/overview/vodan/))-Africa is a joint activity of CODATA, RDA, WDS, and GO FAIR which has implemented FIPs for their [VODAN-Africa project](https://fip-wizard.ds-wizard.org/projects/9cbf831d-5536-4b97-a5c6-f00522f9ec6b).
* The WorldFAIR Project, a multi-disciplinary project that crosses 11 domains, is a collaboration between CODATA and RDA. It uses FIPs as a methodology for listing the FAIR implementation decisions made within the project. They have summarized their experiences in [this article](https://doi.org/10.5281/zenodo.7378109).
* The European Platform for Neurodegenerative Diseases ([EPND](https://epnd.org/)) has implemented FIPs and uses them to help make data ready for their [data platform](https://discover.epnd.org/).

## Training
{% include metroline_steps/training_will_be_added.html %}


## Suggestions
{% include metroline_steps/suggestions_development.html %}
