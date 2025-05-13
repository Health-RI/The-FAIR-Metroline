---
title: Register resource level metadata
permalink: /metroline_steps/register_resource_level_metadata
---

***Disclaimer:** This FAIR Metroline Step focuses solely on the registration of metadata. It does not cover the technical details of metadata schemas or FAIR Data Point, both of which will be detailed in subsequent FAIR Metroline Steps.*

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Perfectly good data resources may go unused simply because no one knows they exist. There are many ways in which digital resources can be made discoverable, including indexing. ([GO FAIR](https://www.go-fair.org/fair-principles/f4-metadata-registered-indexed-searchable-resource/))***
> 
> {{ current_step.summary }}

## Short description 
[Metadata](https://health-ri.atlassian.net/wiki/spaces/HNG/pages/997466980/Glossary#Metadata) is essential for describing information about your resource, whether it is a dataset, article, software, report or other project outputs. In this chapter, we explain how to make metadata about your resources available online so others can find it. This step will help you make your data resources more Findable by registering them in a searchable repository, such as a **metadata catalogue**.

Metadata catalogues are platforms that store and help you find information about various resources. They allow you to search for existing data relevant for your research, saving time in data collection, and enable others to find your work, thereby increasing collaboration opportunities. Examples of metadata catalogues include the [National Health Data Catalogue](https://catalogus.healthdata.nl/) for healthcare and life sciences data and the [BBMRI-NL catalogue](https://catalogue.bbmri.nl/) for biosample information.

Unlike **data repositories** like [Zenodo](https://zenodo.org/) or [DANS data stations](https://dans.knaw.nl/nl/), metadata catalogues do not store the actual resource, but just information about it - the metadata about the resource. Metadata catalogues can link directly to the resource’s location, for example by linking your metadata catalogue entry to your DANS entry through its URL, or let others request access via a contact point or data access forms. Many data repositories also act as metadata catalogues (or even metadata aggregators - catalogues of catalogues), blending the functions of both. For example, when you publish data in DANS, you provide metadata (Title, Description, Keywords) that helps catalogue and find entries within the DANS portal. This blurs the line between metadata catalogues and data repositories (see figure below). Both concepts can also be illustrated by platforms like Google Scholar, which works as a metadata catalogue by indexing information about publications and then linking each entry to external repositories like Elsevier or PLOS where the actual publications can be accessed. 

For more information about Data Repositories, see [Archiving data](https://www.health-ri.nl/node/189) (Health-RI) and [Open Science](https://erc.europa.eu/manage-your-project/open-science) (European Research Council).

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/register_resource_level_metadata/catalogue_vs_repository.png" 
   alt="Catalogue vs Repository" 
   caption="Relationship and differences between a Catalogue and Repository." %}

## Why is this step important 
The key advantage of using metadata catalogues is that you don’t need to publish your resource, such as data, beforehand. This can be very useful if your project has just started data collection or if you have very restrictive data access conditions, but do wish for others to be able to find you. For example, registries keeping data about Rare Disease patients may want to be contacted for the purposes of diagnostic and therapy discovery, without making their actual data available in a repository. If you later decide to publish your resource in a (data) repository for long-term preservation and archiving, you can update the metadata catalogue entry with this new information. Furthermore, metadata catalogues are critical for making research resources, such as data, more visible and accessible.

Metadata catalogues offer a range of benefits to data holders, users and the broader scientific community. 

Benefits for data holders.
* **Increases discoverability.** If you register metadata in catalogues, your data becomes more easily discoverable by others online.
* **Facilitates collaboration.** Making your metadata available increases the likelihood of collaboration with other researchers who find your work through the catalogue.
* **Control over data use.** Metadata catalogues allow you to specify how your data can be accessed and reused, ensuring that you retain control over its distribution.
* **Efficient compliance.** Publishing metadata in catalogues is a low-effort, high-impact step that covers Findability, Accessibility, Interoperability and Reusability aspects for your data, which are now essential for meeting the requirements of numerous funders and institutions.

Benefits for data users.
* **Efficient data search.** Instead of searching across various platforms, metadata catalogues provide a centralised, searchable repository for relevant data.
* **Time-saving.** Reusing already available data saves significant time that would otherwise be spent on new data collection planning and approval.
* **Simplified access requirements.** Clear access protocols provided through metadata reduce the complexity and time involved in requesting data.

Benefits for the scientific community.
* **Prevention of redundancy.** Metadata catalogues reduce duplication of research efforts by making existing data more visible and accessible.
* **Community building.** Catalogues promote the adoption of shared data standards, fostering collaboration and coherence within research communities.
* **Improved transparency.** Clear documentation of data in metadata catalogues ensures research integrity and openness, which promotes trust in scientific findings.
* **Monitoring research impact.** Cataloguing metadata allows for easier tracking of how data is used, cited, and repurposed, providing insights into the broader impact of research efforts.  

## How to 
Registering resource level metadata depends on the context of your project and your expertise in metadata and FAIR principles. Here, we present a generic workflow applicable to most scenarios, but it is advisable to customise this workflow to accommodate your context. This workflow emphasises selecting appropriate metadata catalogues for resources, rather than the technical aspects of metadata schemas. 

### Step 1 - Inventorise resource types
The first step is to identify and categorise the specific types of resources you are managing. While there is no universally accepted standard list, typical examples of resource types include datasets, code and articles. Within the category of datasets, there are further distinctions such as sociodemographic data, clinical data, imaging data, omics data, and biobank data. The type of resource impacts your choice of metadata catalogue. 

**Outcome:** a list of relevant resources along with their respective types.

#### Example
Researcher Eva wants to document metadata for her resource, the [PRISMA](https://www.prisma-studie.nl/) study, and decides to follow the steps on this page. After reviewing the first step, she identified and categorised her resource types as follows:
* Resource type 1: Dataset
    * Dataset type 1: Biosample data
    * Dataset type 2: Questionnaire data

### Step 2 - Determine metadata elements for each resource type
In this step, you need to define the conceptual units of information, known as metadata elements, and collect those elements in a spreadsheet per resource type. Below is an example spreadsheet to capture the resource (sub)type and metadata element with description.

| Resource type | Resource subtype | Metadata element   | Description                                                        |
|---------------|------------------|--------------------|--------------------------------------------------------------------|
| Dataset       | Lab data         | Collection methods | Description of the method or instruments used to collect the data. |
|               |                  | Data sources       | Information about where or from whom the data was collected.       |
| Python code   |                  | Contributors       | Names or IDs of other individuals who contributed to the code.     |

Questions to consider:
* What metadata can be utilised to make resources more Findable?
* What metadata are already in use by others in the same field and can be reused?
For guidance on this process, read [Metroline Step: Assess availability of your metadata.](assess_availability_of_your_metadata)

**Outcome:** a list of metadata elements tailored for each resource type.

#### Example
Having categorised the resource as a dataset, Eva sought to determine which metadata elements would benefit each of her resource types and subtypes. She created a table to organise this information:


| Resource type | Resource subtype   | Metadata                                                                                                                                                                                                                         | 
|---------------|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dataset       |                    | Title<br>Description<br>Keywords about datasets<br>Associated project<br>Contact point to grant access to datasets                                                                                                               |
| Dataset       | Biosample          | Type of study<br>Disease studied<br>Material collected<br>Number of donors<br>Associated publications<br>Associated biobanks<br>Access policy of samples                                                                         |
| Dataset       | Questionnaire data | Information about tools or questionnaires for data collection<br>Collection mode (face-to-face, telephone, or online)<br>Sample design (random, stratified, or cluster)<br>Time Period<br>Population studied<br>Survey questions |

To ensure comprehensive metadata, she referred to existing standards:
* for generic information, she consulted [DCAT](https://www.w3.org/TR/vocab-dcat-3/) and [DublinCore](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/);
* for Biosamples, she used the guidelines from the [Metadata Group on Biobank and Collections](https://www.health-ri.nl/en/about/organisation/biobanks-collections) in Health-RI;
* for questionnaire data, she selected information she deemed relevant, as she was unable to find established community standards.

### Step 3 - Search for metadata catalogues per resource type 
The next step is to identify metadata catalogues. Platforms like [FAIRsharing](https://fairsharing.org/) help researchers locate appropriate metadata catalogues.

Considerations for Metadata Catalogue selection are described below.
* **Relevance to your field.** Is there a metadata catalogue that is widely used and respected within your research community?
* **Persistent identifiers.** Does the metadata catalogue provide globally unique identifiers, such as DOIs, for resources?
* **Reliability.** Is the metadata catalogue managed by a reputable institution with a track record of reliability, including regular backups and secure storage?
* **Trustworthiness.** Does the metadata catalogue adhere to recognised standards for data management, preservation and access?
* **Metadata support.** Does the metadata catalogue support comprehensive metadata schemas relevant to your field?
* **Data licensing.** Does the metadata catalogue allow you to specify the terms under which others can use your data or code?
* **Data versioning.** Does the metadata catalogue support versioning of datasets or code?

More criteria can be found on:
* [How to find a trustworthy repository for your data](https://www.openaire.eu/find-trustworthy-data-repository), provided by OpenAIRE; 
* [Data Repository Guidance](https://www.nature.com/sdata/policies/repositories), provided by Nature.

**Outcome:** a list of Metadata Catalogue candidates for each resource type.

#### Example
After determining the necessary metadata elements for PRISMA data in step 2, Eva consulted a data steward in her department. Together, they compiled a list of available metadata catalogues. Because a repository has cataloguing functionality, existing repositories were also considered.
* Cross-discipline metadata catalogues (allow broad resource types):
  * Health-RI data catalogue ([Nationaal Gezondheidsdataportaal](https://healthdata.nl/));
  * [Radboud Data Repository (ru.nl)](https://data.ru.nl/);
  * DANS ([Data Stations - DANS (knaw.nl)](https://dans.knaw.nl/en/data-stations/)).
* Domain specific metadata catalogues (for specific types of resources):
  * Biosamples. [BBMRI-ERIC data catalogue](https://directory.bbmri-eric.eu/ERIC/directory/#/catalogue);
  * Questionnaires. [The Qualitative Data Repository](https://qdr.syr.edu/).

### Step 4 - Determine metadata catalogues 
In this step, you will evaluate the pros and cons of Metadata Catalogue candidates and make the decisions most appropriate for your context. The general suggestion is to prioritise community standards ([R1.3](https://www.go-fair.org/fair-principles/r1-3-metadata-meet-domain-relevant-community-standards/)) - is there a metadata catalogue which is widely used in your community?
* **Yes.** It is recommended to choose it and adapt your metadata requirements (Step 2) to the predefined metadata elements of the Catalogue. 
* **No.** It is recommended to compare your metadata requirements (Step 2) with the predefined metadata elements from the list of all repository candidates (Step 3) and choose the best matching one (instead of multiple ones).

**Outcome:** a finalised list of metadata catalogues for each resource type.

#### Example
Eva selected the appropriate metadata catalogues for each type of dataset.
* **Biosample data.** BBMRI-ERIC data catalogue.
* **Questionnaire data.** Metadata about the questionnaire data will first be made available on the Health-RI data catalogue together with high-level information about the study. When the questionnaire data is published in a data repository this entry will be updated to reflect the new location of the dataset.

### Step 5 - Enter resource metadata required in the selected metadata catalogues
The final step involves entering the metadata for each resource into the chosen metadata catalogues, following the specific instructions provided by each metadata catalogue. If a resource is registered in multiple metadata catalogues, ensure that the metadata is consistent across all platforms and that the metadata sets are interlinked where possible. Automated updates of metadata are recommended when available.

**Outcome:** successfully registered resource-level metadata in a FAIR manner, ensuring the resources are Findable, Accessible, Interoperable, and Reusable.

#### Example 
Eva followed the [instructions](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279150593) for onboarding data in the Health-RI data catalogue to register the metadata, which is now [available](https://healthdata.nl/datasets/93311669-be7c-4b16-911a-401a18ea692e). 

Eva entered the biosample data into the BBMRI Catalogue Form, which she [downloaded](), and submitted it to the [Health-RI Service Desk](https://www.health-ri.nl/health-ri-servicedesk). The metadata for biosample data were successfully registered, see  
[BBMRI-ERIC Directory](https://directory.bbmri-eric.eu/ERIC/directory/#/collection/bbmri-eric:ID:NL_RB:collection:155?search=PRISMA).

## Expertise requirements for this step 
The level of expertise required for this step will depend on several factors:
* your department’s familiarity with data-sharing practices;
* your personal experience with metadata catalogues and metadata elements relevant to your research domain;
* availability of metadata catalogues within your community.

Depending on these variables, selecting the appropriate metadata catalogue may be a straightforward process or may require input from multiple experts. Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below.
* **Researcher with domain knowledge.** Someone that understands the project, study and data to create detailed and comprehensive metadata.
* **FAIR data steward.** Specialist who can advice on the metadata catalogues to use and can provide advice on how to fill in metadata accurately.
* **Infrastructure professional.** When no suitable metadata catalogue is available or if you need to connect with federated catalogues (such as the [Health-RI Data Catalogue](https://healthdata.nl/)), specialised IT knowledge may be required. This is particularly important when exposing metadata on the web via a [FAIR Data Point](https://www.fairdatapoint.org/) or integrating with other systems.

## Practical examples from the community 
***[The Netherlands ME/CFS Cohort and Biobank Consortium](https://www.health-ri.nl/en/netherlands-mecfs-cohort-and-biobank-nmcb-consortium)***

The Netherlands ME/CFS Cohort and Biobank (NMCB) consortium, in partnership with patient organisations, is leading the way for the development of a national research infrastructure for Myalgic Encephalomyelitis and Chronic Fatigue Syndrome (ME/CFS). 

The current metadata catalogue selected for NMCB is [DataverseNL](https://dataverse.nl/), a national repository service designed specifically for researchers in the Netherlands. It provides a dedicated catalogue for managing and publishing metadata associated with NMCB resources.

Find more information in the [NMCB FAIR Implementation Profile](https://fip-wizard.ds-wizard.org/wizard/projects/64607580-dec0-40db-aca0-5151f96b4833). 

## Suggestions
{% include metroline_steps/suggestions_released.html %}

