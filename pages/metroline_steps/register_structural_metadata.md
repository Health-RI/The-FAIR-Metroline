---
title: Register structural metadata
permalink: /metroline_steps/register_structural_metadata
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***Structural metadata are data about how a dataset or resource came about, but also how it is internally structured. [How to FAIR](https://howtofair.dk/how-to-fair/metadata/)***
>
> {{ current_step.summary }}

## Short description 
Structural metadata (previously introduced on [Metroline Step: Assess availability of your metadata]({{site.baseurl}}/metroline_steps/assess_availability_of_your_metadata)) includes information about what data is collected and its format (e.g. “birth date” - YYYYMMDD) and, if applicable, the code systems and values applied. Similar to how an index at the beginning of a book refers to all its chapters and pages, it gives the reader an idea about the content and its definitions. For data resources, this is typically referred to as the **codebook** or **data dictionary**. You can find more information about how to generate one on [Metroline Step: Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics).

Once you’ve created this codebook, you should consider making it available to ensure clarity, usability and trust in your dataset. This step helps you select data repositories that fit your research domain and points to tools that can further increase the FAIRness of your structural metadata.

## Why is this step important
Registering (or publishing) structural metadata is crucial for ensuring the effective reuse and harmonisation of data structures across various research. This step enhances understanding of how data is structured and organised, making data more meaningful and accessible and improving precision in data retrieval.

In other words, this step:
* **Reduces ambiguity.** Structural metadata provides clear definitions for data elements, supporting interpretation and harmonisation across datasets and reducing the risk of misinterpretation.
* **Provides structural context.** Describes how data elements are organised and related, including variable definitions, data formats and relationships between variables.
* **Can support findability.** When structural metadata is published in searchable registries and linked to datasets, it can help users identify resources containing relevant variables or data elements.
* **Enhances interoperability.** Harmonised data definitions ensure that concepts are clearly and precisely described, enabling easier integration and combination across datasets.
* **Enhances reusability.** By clearly describing the data elements, the data can be reused in the future by yourself or by other projects with different research objectives.
* **Improves reproducibility.** Metadata about the structure of your data provides insight into how the original data was structured, even if the original data is no longer available.

Keep in mind your [FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives). Structural metadata can support subsequent FAIRification activities, such as development of semantic models (see e.g. [FAIR Metroline Step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model)), by making data structures and definitions available to others.

## How to
### Step 1 - Prepare your codebook

For more information on how to choose which data elements to collect and how to create the codebook, see the following pages: [Metroline Step: Apply common data elements]({{site.baseurl}}/metroline_steps/apply_common_data_elements), [Create a Codebook](https://ddialliance.org/create-a-codebook) and [Metroline Step: Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics).

The information you need to provide in your metadata is largely defined by the community you are part of and can vary significantly between research domains. 

* For instance, in microscopy research, an image is linked to details about the individual from whom a tissue sample was obtained. Here, characteristics such as age, sex and diagnosis of that person serve as metadata about the sample, as well as the settings of the image itself, offering context about the microscopy image. 

* However, in patient registry or clinical studies, this same information is considered the primary data, with their structural metadata including information about which variables are collected and the value ranges without specifying the individual record (e.g., Age, captured as an integer value).

{% capture infobox_text1 %}
A group of Data Stewards conducted a campus-wide survey to assess current data management practices among their researchers. After collecting and preparing the data for sharing, they developed a codebook to document the dataset structure and definitions.

<div class="table-container">
<table class="no-wrap">
   <caption class="table-caption">
      Table: Snippet of codebook describing the survey dataset.
   </caption>
   <thead>
    <tr>
      <th>Question</th>
      <th>Variable_name</th>
      <th>Variable_label</th>
      <th>Value = 0</th>
      <th>Value = 1</th>
      <th>Value = 2</th>
      <th>Value = 3</th>
      <th>Value = 4</th>
      <th>Value = 5</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1. Where are you employed?</td>
      <td>Q001</td>
      <td>Where are you employed?</td>
      <td></td>
      <td>Radboud university medical centre (RUMC)</td>
      <td>Radboud University (RU)</td>
      <td>Donders Centre for Cognitive Neuroimaging</td>
      <td>Donders Institute for Brain, Cognition and Behaviour</td>
      <td>Other</td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_1</td>
      <td>Audio or video recordings data</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_2</td>
      <td>Behavioral and cognitive data</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_3</td>
      <td>Genetic and/or genomic data</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_4</td>
      <td>Health records data</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_5</td>
      <td>Laboratory data</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_6</td>
      <td>Medication data (i.e., pharmaceutical treatments)</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3. What type(s) of research data do you work with? (Multiple Choice)</td>
      <td>Q003_7</td>
      <td>Medical Imaging data (e.g., tomography, infrared, magnetic resonance, ultrasound, x-ray)</td>
      <td>Not selected</td>
      <td>Yes</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>

<div class="table-container">
<table>
   <caption class="table-caption">
      Table: Snippet of the shared survey Dataset.
   </caption>
  <thead>
    <tr>
      <th>Q001</th><th>Q003_1</th><th>Q003_2</th><th>Q003_3</th><th>Q003_4</th><th>Q003_5</th><th>Q003_6</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td></tr>
    <tr><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td></tr>
    <tr><td>1</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
    <tr><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
    <tr><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
    <tr><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>
    <tr><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>1</td></tr>
  </tbody>
</table>
</div>
{% endcapture %}

{% include info-box.html type="example" title="Example" text=infobox_text1%}


### Step 2 - Select the most appropriate data repository for publishing
Once the codebook is ready (see [Metroline Step: Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics)), you can determine where and how it should be published. Depending on the research domain or data type, repository requirements and metadata standards may already influence how structural metadata is collected and formatted earlier in the research lifecycle. Structural metadata can be published in various forms, and the most suitable option often depends on the context of the research project and the [FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives).

For certain projects, it might be practical to publish the codebook together with the research data in a repository, creating a cohesive and accessible package. However, in some projects where data cannot be published (e.g. due to privacy concerns, legal restrictions, or intellectual property rights), it is appropriate to publish the codebook independently in a specialised catalogue, such as an [ART-DECOR](https://decor.nictiz.nl/ad) instance hosted by Nictiz.

When selecting a repository or catalogue:
* Use domain-specific repositories where possible (a repository that is commonly used in your research domain). If you don’t know what repositories are used in your domain, you can make use of [re3data](https://www.re3data.org/) or [FAIRsharing](https://fairsharing.org/) to browse through repositories. Many filters can be applied (e.g., generation of a persistent identifier, selecting a country, data access level,  etc.), making it possible to select a data repository that fits your needs.
   * If there is no domain-specific repository, you can make use of generic or institutional repositories (e.g., DANS Data Stations Life Sciences, Zenodo, Radboud Data Repository for Radboudumc researchers, or DataverseNL for Amsterdam UMC, UMC Utrecht, and Erasmus MC).
* Select a repository that makes it possible to publish documentation open access, even if the data is under restricted access. This way researchers can get an idea of what your data looks like, before actually needing to access the data.
* If possible, try to choose a repository that supports publishing metadata (or the codebook) in machine-readable formats, such as JSON/XML/RDF.
* Keep in mind the funder requirements – do they require you to publish in a specific repository?
* Some journals recommend specific repositories for researchers to use (e.g., [PLOS One Recommended Repositories](https://journals.plos.org/plosone/s/recommended-repositories) or [Nature's Scientific Data Repository Guidance](https://www.nature.com/sdata/policies/repositories)).

{% include info-box.html type="example" title="Example" text="
The researchers decided to make use of the institutional data repository (Radboud Data Repository) to publish their data. Following best practices, they included the codebook alongside the dataset to enhance understandability.
"%}

### Step 3 - Publish the codebook in the selected data repository
This step involves publishing the structural metadata in the selected data repository. 
Preferably the metadata is machine-actionable (see [Step 4](#step-4---enhance-findability-and-interoperability-of-structural-metadata)), but publishing your codebook as-is at this point may already suffice to reach your [FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives).
Make sure that the codebook is published open access, even when the data is under restricted access. Some repositories that support this are DANS Data Stations Life Sciences (generic repository), Radboud Data Repository, and DataverseNL (institutional repositories).

{% include info-box.html type="example" title="Example" text="
The codebook was uploaded in a [Data Sharing Collection](https://doi.org/10.34973/6s67-q643) from the Radboud Data Repository along with the dataset. This repository allows certain files in a collection to be flagged as [documentation files](https://data.ru.nl/doc/help/helppages/user-manual/archive-publish/fair-review.html). By marking the codebook as documentation, it is ensured that anyone downloading information about the dataset could immediately access and understand the content of the dataset, without needing to open the actual file.
"%}
 
### Step 4 - Enhance findability and interoperability of structural metadata
{% include info-box.html type="tip" title="Tip" text="This particular step might require onboarding of a data steward to assist with the process."%}

While stopping at Step 3 is already a good practice, ensuring that information about your data content is documented and made available, there are cases where you may want to further increase your FAIR maturity through additional mechanisms.

#### Findability
For surveys, patient registries and other data types, it can be helpful to explicitly describe in the metadata what is actually being collected from the individuals (for example age, diagnosis and age at diagnosis). In such cases, platforms that present this information visually, like the one shown in the figure below, might offer a solution.

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/register_structural_metadata/ART-DECOR_screenshot.png" 
   alt="ART-DECOR dataset" 
   caption="ART-DECOR view of structural metadata describing an example dataset’s variables." %}

Depending on your field and data type, different tools may be available. Most of these tools support interoperability, which is also essential for FAIR data practices:
* **Clinical studies and patient registries.** ART-DECOR allows you to publish structured metadata about your dataset, including data elements in XML format (see example [here](https://art-decor.org/ad/#/covid19f-/datasets/dataset)).
* **Patient Registries.** [ERDRI.mdr](https://eu-rd-platform.jrc.ec.europa.eu/mdr/) is a metadata repository that enables the publication of sampled data elements.
* **Survey and/or any tabular datasets (rows and columns).** [DDI](https://ddialliance.org/) provides tools to convert your codebook into RDF or XML. Ideally, these files should be hosted in repositories that support these formats, but they can also be shared alongside your data following the guidance above.

Make sure that, when structural metadata is shared separately from the dataset itself, the dataset’s resource-level metadata includes clear and maintained links to the structural metadata. For example, if your institution shares resource-level metadata via a FAIR Data Point, make sure that links to the structural metadata are also included there.

#### Interoperability
Your original codebook file alone may not be sufficient to make your data interoperable. Two key characteristics are required:
* **Machine-readable structure.** Formats such as JSON (or JSON-LD), XML, OWL, or RDF help machines understand your data.
* **Use of persistent identifiers.** For example, using an ORCID to identify the dataset creator. This principle applies to other metadata fields as well:

<div class="table-container">
<table>
  <thead>
    <tr>
      <th>Concept</th>
      <th>FAIR-term</th>
    </tr>
  </thead>
  <tbody>
      <tr>
         <td>Muscle Weakness</td>
         <td><a href="http://purl.obolibrary.org/obo/HP_0001324">http://purl.obolibrary.org/obo/HP_0001324</a></td>
      </tr>
  </tbody>
</table>
</div>

To achieve interoperable metadata, consider using the following tools:
* **FAIR Data Station.** [FAIR Data Station](https://docs.fairbydesign.nl/docs/index.html) helps generate metadata templates for Biology and Omics Studies based on selected variables. It validates your codebook and produces an RDF file.
* **CSV on the web.** [CSV on the web](https://csvw.org/) is a standard that describes the columns and rows of a given data file in csv. Therefore, it can be used across domains. The final format can be expressed in JSON or RDF and shared alongside your dataset.

If you have experience using other(s), please, leave a comment!

{% capture infobox_text2 %}
Spreadsheets, such as Excel files, can be difficult to process automatically without additional metadata describing their structure and meaning. To improve interoperability, the Data Stewards generated machine-actionable metadata describing the dataset’s structure.

Using [CSV on the web](https://csvw.org/), a vocabulary designed to enhance metadata actionability, they created a JSON file that accurately reflects the content of the codebook. This effort significantly increased the dataset’s machine-readability and integration potential. Where possible, terms were mapped to ontologies. For example, Yes/No values were linked to:
* False: [SNOMEDCT/64100000](http://purl.bioontology.org/ontology/SNOMEDCT/64100000)
* True: [SNOMEDCT/31874001](http://purl.bioontology.org/ontology/SNOMEDCT/31874001)

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/register_structural_metadata/structural_metadata.png" 
   alt="structural metadata" 
   caption="Comparison of the original codebook (top) and a snippet of the generated JSON file (left), showing the corresponding fields." %}

The next step is to make this JSON file available. It can remain within the same data collection and/or be hosted elsewhere, such as on GitHub or a JSON hosting service. When the structural metadata is made available separately from the dataset itself, make sure that clear and maintained links to it are included in the dataset’s resource-level metadata.

Guidance on maintaining metadata integrity can be found in the following Metroline resources: 
[Metroline Step: Assess availability of your metadata]({{site.baseurl}}/metroline_steps/assess_availability_of_your_metadata) and [Metroline Step: Register resource level metadata]({{site.baseurl}}/metroline_steps/register_resource_level_metadata).
{% endcapture %}

{% include info-box.html type="example" title="Example" text=infobox_text2 %}

## Expertise requirements for this step 
This step requires the following experts as described in the [Metroline Step: Build the team]({{site.baseurl}}/metroline_steps/build_the_team) step.
* **Researcher.** Provide the metadata/codebook.
* **Data Steward.** Find solutions and implement them or support the Researcher in the implementation.

## Practical examples from the community 
{% include metroline_steps/looking_for_examples.html %}

## Training
The training available for the registering structural metadata is still limited. However, some resources include the Official European Training on Open Data. They provide courses on the DCAT and DCAT-AP standards, which are the foundation for European public sector metadata structuring. The material is freely available here: [Improving open data and metadata quality | data.europa.eu](https://data.europa.eu/en/academy/improving-open-data-and-metadata-quality) 

## Suggestions
{% include metroline_steps/suggestions_released.html src=page.title%}
