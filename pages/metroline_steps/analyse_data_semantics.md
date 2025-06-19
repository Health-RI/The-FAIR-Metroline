---
title: Analyse data semantics
permalink: /metroline_steps/analyse_data_semantics
page_id: analyse_data_semantics
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***… selecting a relevant subset of the data and defining driving user questions(s) are highly relying on being familiar with the data ([Generic](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification))***
> 
> {{ current_step.summary }}

## Short description 
Understanding and clearly defining the meaning (semantics) of (meta)data is an important preparation for [creating the semantic model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model), as well as for data collection via, for example, [electronic case report forms]({{site.baseurl}}/metroline_steps/design_ecrf) (eCRFs). In this step, the aim is to ensure you gain a clear and unambiguous understanding of the (meta)data elements. The step provides guidance for both existing data and data that is to be collected.

To illustrate the issue, consider the example where you receive a dataset with a variable called “date”. Without clearly defined semantics, it is unclear whether this means “date of data collection”, “admission date”, “date of birth”, or something else. This must be resolved before you can start analyzing the data or move forward with your FAIR goals, such as applying a semantic (meta)data model. In the How to section of this page we provide instructions to achieve this, along with an example following the different steps.

The outcome of this step is a set of data elements (variables) with clear and unambiguous semantics, known as a codebook. For metadata, the outcome is a set of clearly defined metadata elements. This codebook provides information about the structural content of the data and can be made available following the approach described in 
[Metroline Step: Register record level metadata]({{site.baseurl}}/metroline_steps/register_record_level_metadata). Note that finding machine-actionable items from ontologies for the data elements is not yet part of this step, but is described in [Metroline Step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model). 

## Why is this step important
Several of the Metroline steps that follow rely on being familiar with your data. For example, in order to [create or reuse your semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model), it is crucial to understand the meaning and relationships of variables.

While performing this step, keep your FAIRification goals in mind. If you have a clear idea of your [FAIRification goals]({{site.baseurl}}/metroline_steps/define_fairification_objectives), it might be easier to define what elements should be present in your (meta)data and how these elements should be represented.

For example, in a dataset a variable to collect sex-related data might be called ‘sex’. If the semantics of such variable are not provided or not analysed, it would be unclear if it means ‘biological sex at birth', ‘phenotypic sex’, or ‘gender’. These issues have to be solved before you start with 
[Metroline Step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model) or 
[Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model).

## How to
This How to-section describes three steps to take in order to make your (meta)data elements clear and unambiguous. It is applicable to both FAIRification of existing data or de novo data collection. In both cases, you will perform the following steps (in different order):
* **[Compile Information.](#step-compile-information)** Compile all the information of (meta)data elements, (meta)data values, and (meta)data structure. We describe this step separately for existing (meta)data elements or elements that are to be collected.
* **[Check for an existing standard/codebook.](#step-check-for-an-existing-standardcodebook)** For both existing and de novo (meta)data, check if there are codebooks or standards that are (partially) compatible with your (meta)data elements.
* **[Check and improve (meta)data semantics.](#step-check-and-improve-metadata-semantics)** Make sure that the meaning of the (meta)data elements is clear and unambiguous.

After completing these steps, you will end up with a set of clearly defined (meta)data elements.

To see which steps are relevant for your case, please follow the flowchart below.  

{% include graph_logic/init-graphs.html %}
<div class="image-wrapper">
  <div class="graph-block" data-graph-id="main_flow"></div>
</div>


{% include info-box.html type="example" title="Example - part 0" text="
For easier understanding, we will follow the example of the below set of metadata elements. The steps we are following in our example can be seen with the red arrows in the flowchart above.

| Metadata field / Variable | Original value                          |
|---------------------------|-----------------------------------------|
| Dataset Name              | Health Data                             |
| Date of Upload            | 01/02/2023                              |
| Keywords                  | BP, HR, Conditions                      |
| Creator                   | Dr. Smith                               |
| Description               | Patient health data including BP and HR |
| Format                    | CSV                                     |
| Source                    | Hospital A                              |
| Rights                    | Open                                    |

In this example, we are working with existing metadata. According to the flowchart, we should start with [Check for an existing standard/codebook a)](#a-for-existing-metadata-1).
" %}

### Step: Compile information
Compile all the information of (meta)data elements, (meta)data values, and (meta)data structure. Examine the (meta)data in the way it is currently stored, including its format (e.g. JSON, CSV) and how the information is organised within it. This step helps to identify inconsistencies, ambiguities, and errors in the data. 

If you are not the original creator of the data, if possible, try to get the creator involved to help with the questions you may have.

For detailed information about this step, visit [Metroline Step: Assess availability of your metadata]({{site.baseurl}}/metroline_steps/assess_availability_of_your_metadata).

#### a) For existing (meta)data
Locate all relevant sources in which the (meta)data is stored. You can compile the information in a spreadsheet, as shown in the example below, including the following:
* Which variables are present in the (meta)data?
  * For example, check the eCRFs used to collect the data.
* What are the value ranges for each variable, as in determine the type of values each variable can have?
  * For example Dataset Name has a range of Text (e.g., "Health Data").
* What are the allowed value ranges for data elements. 
  * For example, for the variable ‘sex', are only ‘male' and 'female’ present, or also ’intersex'?
* Are there any existing relationships between the variables in your (meta)data and do they make sense?
  * For example, the “sex” variable is an attribute of “patient”, which may imply that the semantics of this “sex” variable is “sex of patient”. 


{% include info-box.html type="example" title="Example - part 2" text="

In our example, we are working on FAIRifying existing metadata of a dataset. Let’s compile and examine the information we have.

| Metadata field / Variable | Original value                          | Original variable description                       | Original value range                                           |
|---------------------------|-----------------------------------------|-----------------------------------------------------|----------------------------------------------------------------|
| Dataset Name              | Health Data                             | The name of the dataset.                            | Text                                                           |
| Date of Upload            | 44958                                   | The date on which the dataset was uploaded          | Date values in the format MM/DD/YYYY                           |
| Keywords                  | BP, HR, Conditions                      | Terms that describe the main topics of the dataset  | Text, some keywords are abbreviations                          |
| Creator                   | Dr. Smith                               | The person or organisation that created the dataset | Text, in our example title and last name                       |
| Description               | Patient health data including BP and HR | A brief summary of the dataset                      | Text                                                           |
| Format                    | CSV                                     | A file format of the dataset                        | Text, in our example a short string indicating the file format |
| Source                    | Hospital A                              | The origin of the dataset                           | Text, in our case the name of the institution                  |
| Rights                    | Open                                    | The usage rights or licence of the dataset          | Text                                                           |

We now have a compiled a table of information for our example metadata. Looking at the flowchart, we see that we can now proceed to the step [Check for an existing standard/codebook b)](#b-for-new-metadata) to check if there is a standard that fits our compiled elements. 
" %}

#### b) In case you are aiming to collect FAIR (meta)data from the start
Start by identifying the data elements/variables you plan to collect. Defining these elements early ensures that your dataset is structured, standardized, and aligned with FAIR principles. To guide this process, consider using [Competency Questions (CQs)](https://www.sciencedirect.com/topics/computer-science/competency-question) - questions that help clarify which data is necessary and how it will be used.

Here are some resources you can refer to in this step:
* [Creating data/variable dictionary](https://faircookbook.elixir-europe.org/content/recipes/interoperability/creating-data-dictionary.html) - helps define variable names, formats and descriptions for your data.
* [Creating a metadata profile](https://faircookbook.elixir-europe.org/content/recipes/interoperability/creating-minimal-metadata-profiles.html) - describes how to create a minimal set of metadata with the help of competency questions.

Once you have identified your data elements, determine the expected value range for each variable where possible. This helps maintain data quality and consistency. Examples include:
* ‘Biological sex at birth’ → Text; the values ‘female', 'male', 'intersex' are allowed
* ‘Age’ → Non-negative integer, indicating the age in years

Clearly defining these aspects from the start supports data integrity, interoperability, and future reuse.

Also keep in mind the relationships between your data elements and make sure it is clear which variables belong together.
* For example, if you add variables for “Biological sex at birth” and “Age” make sure it’s clear that it refers to “Patient”.

You should end up with a compiled table of information, like you can see in the table below [step a)](#a-for-existing-metadata) and continue to Step [Check for an existing standard/codebook b)](#b-for-new-metadata) (for new (meta)data).

### Step: Check for an existing standard/codebook
#### a) For existing (meta)data
Check if your (meta)data comes with a codebook or metadata standard. In case it does, it is recommended to still check if the semantics of the codebook or standard are clear or need improvement. Jump to this part of the how-to [here](#step-check-and-improve-metadata-semantics).

If the (meta)data is not coming with a codebook or standard, proceed to [Compile information](#a-for-existing-metadata).


{% include info-box.html type="example" title="Example - part 1" text="In our example, we are working on FAIRifying existing metadata. We have checked our metadata, but it does not come with a metadata standard, so we’ll have to [compile all information of our existing metadata](#a-for-existing-metadata) first." %}


#### b) For new (meta)data
Before defining your own, check if there is a codebook or metadata standard you can use for the information you compiled before. Using established standards helps to make your (meta)data more interoperable and reusable.

You can find relevant standards and codebooks by:
* Consulting domain experts (for data) or FAIR data stewards/semantic experts (for metadata)
* Explore community-driven repositories

Below are listed some of the resources you could explore:
* For clinical and biomedical data:
  * [CDASH](https://www.cdisc.org/standards/foundational/cdash). Standardised way to collect and structure clinical trial data. 
  * [ART-DECOR](https://decor.nictiz.nl/ad/#/home). A tool for developing, managing, and sharing clinical data sets, templates, and terminologies. 
  * [OpenEHR](https://openehr.org/). A widely used standard for structuring and sharing electronic health records (EHR).
* For metadata standards:
  * [FAIRsharing](https://fairsharing.org/). A curated registry of metadata standards, repositories, and data policies across scientific domains. 
  * [RDA Metadata Standards Catalog](https://rdamsc.bath.ac.uk/). A collection of metadata standards maintained by the Research Data Alliance (RDA). 
  * [Dublin Core Metadata Initiative](https://www.dublincore.org/). A widely adopted metadata schema for dataset descriptions. 
  * [DCAT](https://www.w3.org/TR/vocab-dcat-3/). A W3C standard for structuring datasets in catalogs.

You can find more about metadata standards and ontologies at the following link: [Links and Additional reading - How to FAIR](https://howtofair.dk/links-additional-reading/#more-on-metadata-standards-and-ontologies-).

If you find a codebook or standard that might fit your (meta)data, check if the definitions are compliant with the ones in your data. Are the value ranges correct? How well does it match your (meta)data elements? In the best case, you find a resource that fully matches your (meta)data. It could also be the case, that you find a partially matching standard, or none. Depending on the outcome of the search, do one of the following:
* If you **find a fully compatible codebook or metadata standard**, apply it directly. You can find more relevant information in the Metroline step [Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model).
* If you find a **partial match**, use the relevant elements and document any modifications for missing components. For the missing components, also proceed to step [Check (meta)data semantics](#step-check-and-improve-metadata-semantics).
* If **no suitable standard exists**, proceed to the step [Check (meta)data semantics](#step-check-and-improve-metadata-semantics), where you will define and structure metadata elements to ensure consistency and interoperability.

{% include info-box.html type="info" text="Health-RI, together with domain representatives, will be aiming to develop domain-specific national (meta)data standards in the future." %}

{% include info-box.html type="example" title="Example - part 3" text="After having compiled all elements in our metadata, let’s say we explored the relevant repositories and, for the purpose of following the example through all of the steps, couldn’t find one that would be applicable to our example metadata. According to the flowchart, we should now move to the Check and improve (meta)data semantics step." %}

### Step: Check and improve (meta)data semantics
In order to end up with clearly defined (meta)data elements, we should check the semantics to identify things that are unclear or ambiguous. Next, we can improve these ambiguities. For this, first check:
* Is the **definition or description** of the (meta)data elements clear and unambiguous? For those with ambiguous meaning, try to improve their definition.
  In the example of collecting data on a patient’s 'sex', it might be unclear if it means ‘biological sex at birth'  or ‘administrative gender’.
* It might help to look into the intended **value range** of a variable - is the exact range known and is it clear enough?
  In another example, 'age' of a subject can be expressed in years, but in some cases, such as studies with small children, could also be expressed in months. It should therefore be clearly stated if the value range for age should be expressed in years or months.

In case the definitions or value ranges for any elements are **not clear**, try to pinpoint the issues per element and based on that apply improvements to all elements with issues.

This [recipe in the FAIR cookbook](https://faircookbook.elixir-europe.org/content/recipes/interoperability/creating-data-dictionary.html#elements-that-should-be-included-when-building-a-data-dictionary) gives some additional guidance on specifying the semantics of elements of your data.

{% include info-box.html type="example" title="Example - part 4" text="
In the below spreadsheet we can see what the issues are with our current metadata and applied improvements in order to make the meaning of them clearer.<br>
For example, we split the element Creator into Creator Name and Creator Identifier, to improve the identification of the Creator. We also defined the format in which the Date of Upload should be stated to prevent confusion with dates/months.

| Metadata field/Variable | Original value                                      | Issue                                                                                       | New variable description                                                             | New value range                    | New value                                                                                                                                                             |
|-------------------------|-----------------------------------------------------|---------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dataset Name            | Health Data                                         | Generic and not descriptive.                                                               | The name of the dataset.                                                            | Text                              | Patient Health Records 2023                                                                                                                                            |
| Date of Upload          | 1-2-2023                                            | Ambiguous format (MM/DD/YYYY or DD/MM/YYYY).                                               | Date when the dataset was uploaded, in ISO 8601 format (YYYY-MM-DD).                | Date in ISO 8601 format (YYYY-MM-DD) | 2023-02-01                                                                                                                                                            |
| Keywords                | BP, HR, Conditions                                  | Abbreviations used without context.                                                        | Keywords describing the main topics covered by the dataset.                         | Text                              | Blood Pressure, Heart Rate, Hypertension                                                                                                                              |
| Creator Name            | Dr. Smith                                           | Generic name without additional identifying information.                                   | Full name of the dataset creator.                                                   | Text                              | Dr. John Smith                                                                                                                                                        |
| Creator Identifier      | None                                                | Missing in the original example metadata, we need the identifier to make sure we refer to the correct agent. | ORCID of the creator.                                                              | ORCID identifier                   | ORCID: 0001-0002-3456-7890                                                                                                                                            |
| Creator Institute       | None                                                | Missing in the original example metadata, we added it to make the creator more identifiable. | Affiliation of the dataset creator.                                                | Text                              | Hospital A                                                                                                                                                            |
| Description             | Patient health data including BP and HR            | Lacks detail.                                                                               | Extended description providing context and details about the dataset.               | Text                              | Detailed patient health records including measurements of blood pressure (BP) and heart rate (HR), along with diagnosed medical conditions and prescribed medications. |
| Format                  | CSV                                                 | None                                                                                         | Data format of the dataset.                                                         | Text                              | CSV                                                                                                                                                                   |
| Source Name             | Hospital A                                          | Lacks detail, too generic.                                                                 | Specific department and institution where the data was sourced.                     | Text                              | Hospital A, Department of Cardiology                                                                                                                                   |
| Source Identifier       | None                                                | Missing in the example to unambiguously identify the institute.                            | ROR identifier that is specific to the (research) institute.                        | ROR identifier                    | [https://ror.org/example](https://ror.org/example)                                                                                                                    |
| Rights                  | Open                                                | Too broad.                                                                                  | Licensing terms specifying the rights for data usage.                               | URL to CC License                 | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)                                                                                                              |

" %}

### Step: Go to the next Metroline Step
Congratulations, you have now successfully analyzed your (meta)data semantics. You should now have a set of data elements (variables) with clear and unambiguous semantics - a codebook. For metadata, you should be left with a set of clearly defined metadata elements.

From here, there are three possible next steps, depending on your needs:
* [Metroline Step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model). This step uses work done in this step as a basis to find correct ontologies that can be coupled to your data elements.
* [Metroline Step: Register record level metadata]({{site.baseurl}}/metroline_steps/register_record_level_metadata). If you first want to make your codebook available, you can do so in this step.
* [Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model). If you’ve found a fully compatible semantic model that wasn’t included with your dataset or you were starting with new data collection, you can skip model creation and directly apply it to your (meta)data.

{% include info-box.html type="example" title="Example - part 5" text="
Great job! After checking and improving our metadata semantics, we can now move to the next Metroline step.
"%}

## Expertise requirements for this step 
Below are experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team).
* **Semantic data / modelling specialists.** Can help understanding the data’s structure and ambiguity.
* **Domain expert.** Can help understanding the data’s elements and their potential ambiguity.
* **FAIR data steward.** Can help identifying ambiguity in the data elements.

## Practical examples from the community
{% include metroline_steps/looking_for_examples.html %}

## Training
{% include metroline_steps/training_will_be_added.html %}

## Suggestions
{% include metroline_steps/suggestions_released.html %}

