---
title: Assess availability of your metadata
permalink: /metroline_steps/assess_availability_of_your_metadata
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Metadata is the descriptor, and data is the thing being described' [FAIR Principles: Interpretations and Implementation Considerations](https://www.sciengine.com/DI/doi/10.1162/dint_r_00024)***
> 
> {{ current_step.summary }}

## Short description 
Metadata refers to the contextual information about a resource (e.g. a dataset), often described as “data about data”. Metadata can come in many different types and forms. 

* **Descriptive metadata.** This is the type of metadata you might be most familiar with as it is often collected in repositories such as Zenodo (see the example of [how Zenodo describes the resources](https://help.zenodo.org/docs/deposit/describe-records/) on its repository). This generic metadata includes details on what the resource is about (e.g., data from patient health records), who created it (e.g., a research team at Radboudumc) and when it was collected. Typically, it also discloses information about the possible uses of the resource (e.g., applicable licensing) and access restrictions (e.g., available for public use/restricted access).
* **Administrative metadata.** This refers to how the resource came to be (provenance of the data, [FAIR principle R1.2](https://www.go-fair.org/fair-principles/r1-2-metadata-associated-detailed-provenance/)), what protocols were followed and what tools were used. The purpose of this metadata is to ensure that you, your colleagues or others can reproduce the initial research.
* **Structural metadata.** Depending on the type of resource, this refers to a detailed description of your resource that goes beyond the generic information explained above. For instance, in the context of a dataset containing data collected from a questionnaire, content metadata could include the questions asked and the allowed range of values. This type of metadata is also often described in a codebook or data dictionary.

In this step, the focus will be on assessing the availability of your metadata. This involves identifying and collecting all types of metadata gathered for your resource, checking its quality and ensuring it is as accurate and complete as possible.

## Why is this step important 
To be able to [register resource level metadata](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/272924765) (for instance in a repository or catalogue) you need to make sure you have/collect the appropriate and correct metadata.  

Furthermore it is: 
* **Beneficial for you and your team.** Having comprehensive and detailed metadata ensures that anyone, including yourself, can understand and work on the data effectively even when some time has passed since collection. This is an example of good data management practices and contributes to data remaining usable and meaningful over time and saves time when setting up new projects. 
* **Beneficial for the organisation.** Complete and error-free metadata makes it easier for organisations to migrate information about its projects between systems, especially when newer software versions are available. 
* **Promotes higher research impact.** Good metadata records reflect well on the researcher’s outputs. Potential data reusers might be put off by documentation issues and may not be inclined to use the data.
* **Improves the quality of your data.** Good metadata should describe the data accurately and unambiguously, which in turn improves the overall quality of the data and enhances transparency and reproducibility. This enables others to verify results and build upon them.
* **Helps with data discovery.** Complete metadata improves the ability for you and your team to locate and retrieve data quickly. Additionally, if this metadata is published, it can boost reuse of data, lead to new collaborations and enhance recognition of existing work.
* **Complies with funders’ and journals’ requirements.** Many funding agencies and publishers now require metadata to be published to increase the efficiency and visibility of the research they support.

{% include info-box.html title="Regarding the National Health Data catalogue." text="Health-RI is in the process of defining a metadata scheme for adding metadata (onboarding) to the Health-RI metadata portal. To allow for onboarding of a resource, the minimal metadata set must be provided. It is therefore essential that you assess whether this minimal set is collected/available or whether additional metadata needs to be collected." %}

## How to
The steps below help you identify existing metadata about your resource and their possible location.

### Step 1 - Identify where information about your resource is stored
Start by considering where information about your resource is already contained. Typically, institutions have systems that require a certain level of documentation. Investigate these systems. 

_**Example:** Eva, a researcher at Radboudumc, wants to assess what metadata is available about her project. She starts by consulting her Data Management Plan (DMP). She then remembers that she added metadata about her project to the [PaNaMa](https://panama-rms.eu/) registry and the [Radboud Data Repository](https://data.ru.nl/)._ 

**Step output:** Systems and documents identified. These could include the DMP, project or research management systems such as PaNaMa, systems involved in ethical approval and (local) data repositories. 

### Step 2 - Extract, review and validate your metadata
Once you've identified where your metadata might reside, it's time to extract and evaluate it. Errors and inconsistencies can naturally creep into your records over time, especially when many people are involved. Guidelines and project contexts can also change. This step helps ensure that the metadata is still understandable and accurate. Use the following questions to guide you. 

* Are there typos in the metadata? 
* Is any required information missing, such as fields left blank or skipped unintentionally, and do you have a reference (e.g. metadata standard or template) to assess what should be present?
* Is the information correct? Collected information might be outdated. 
* Are vocabularies used properly? Is the language outdated or not accurate anymore?
* Are metadata terms used consistently? (e.g., Radboudumc vs rumc) 

_**Example:** After reviewing her metadata across various platforms, Eva realises some information is outdated. The abstract of her Data Management Plan no longer aligns with her adjusted research question. Her data collection protocol has changed due to a new data collection system recently implemented by Radboudumc. She also notices that the PaNaMa entry has many blank recommended fields, and the Radboud Data Repository keywords include terminologies that might not facilitate discoverability of her resource (e.g., by using the term "neoplasm" instead of "cancer" or "tumor" more widely searched as keywords). Additionally, terms like "gender" and "sex" are used interchangeably across the descriptions in all those systems._ 

**Step output:** A list of identified issues in the metadata to be resolved/updated. 

### Step 3 - Update the metadata through the necessary corrections
**Tip:** Try to find “one source of truth” in your organisation/project. For instance for resources you would change the information in the place where the DOI points to. 

_**Example:** Eva decides to update her Data Management Plan because it's crucial for her PhD thesis. She also updates and fills out missing fields in the Radboud Data Repository to make her dataset available for reuse by others._ 

**Step output:** Metadata is updated, based on step 2 output. 


You are now ready to take the next step with your metadata: 
* **Share or publish your metadata.** [Metroline Step: Register resource level metadata]({{site.baseurl}}/metroline_steps/register_resource_level_metadata) 
* **Expand your metadata to include domain specific metadata.** [Domain-specific metadata schema development](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/545783826)
* **follow a semantic model to describe your metadata (under construction.** [Metroline Step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model) )

## Expertise requirements for this step 
Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below.
* Data manager/Data steward/Data librarian, Researcher (Scientist) or someone else who knows the context and content of the project.

## Practical examples from the community 
* The [Health-RI metadata schema](https://github.com/Health-RI/health-ri-metadata) is an example of **descriptive metadata** within the context of the [Dutch National Health Data Infrastructure](https://www.healthdata.nl/en).
* An example of **administrative metadata** is provided by [ArrayExpress](https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-MTAB-11745), which includes details such as experimental protocols.
* The [FAIRGenomes codebook](https://decor.nictiz.nl/ad/#/fairgenomes-/project/overview), hosted on ART-DECOR, serves as an example of **structural metadata**.

## Training
* [Fundamentals of Scientific Metadata: Data and Metadata](https://carpentries-incubator.github.io/scientific-metadata/instructor/data-metadata.html#metadata)  
* [Metadata - How to FAIR](https://howtofair.dk/how-to-fair/metadata/#what-are-metadata) 
* [Improving open data and metadata quality \| data.europa.eu](https://data.europa.eu/en/academy/improving-open-data-and-metadata-quality)
* [HealthDCAT AP \| European Health Information Portal](https://www.healthinformationportal.eu/healthdcat-ap)

## Suggestions
{% include metroline_steps/suggestions_released.html %}

