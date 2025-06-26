---
title: Apply common data elements
permalink: /metroline_steps/apply_common_data_elements
---

{% include assign_current_step.html %}

{% include development_status.html step=current_step %}

>***The use of Common Data Elements (CDEs) can facilitate cross study comparisons, data aggregation and meta-analyses, simplify training and operations, improve overall efficiency, promote interoperability between different systems, and improve the quality of data collection. [Sheehan et al., 2016](https://pmc.ncbi.nlm.nih.gov/articles/PMC5133155/)***
>
> {{ current_step.summary }}

## Short description 
As explained in [Common Data Elements: Lessons from NIH Experience](https://www.nlm.nih.gov/NIHbmic/CDEprocessrecommendations17Jan2014.pd), a Common Data Element (CDE) is a standardised representation of a variable used in clinical or analytical projects. It includes a clearly defined question and a specified format or set of acceptable responses. Ideally, the CDE should be interpretable by both humans and machines without ambiguity.

To see whether an item can be considered a CDE, the following checklist can be applied: 

<div class="table-container">
<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Question</th>
      <th>Explanation</th>
      <th>Must be "Yes" for CDE?</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Is it used across studies or datasets?</td>
      <td>A CDE should be designed for reuse and interoperability.</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Does it define a specific variable (e.g. age, blood pressure)?</td>
      <td>Not just general data structure, but actual data content.</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Does it specify how the variable is measured or captured (e.g. question text, field type)?</td>
      <td>Helps ensure consistent data entry.</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Is it documented with metadata (e.g. definition, units, permissible values)?</td>
      <td>Enables data reuse and harmonisation.</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>5</td>
      <td>In case of permissible values, does it include standard response values or value sets (e.g. yes/no, coded options)?</td>
      <td>Ensures semantic consistency.</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>6</td>
      <td>(Optional but ideal*) Is it linked to an ontology or controlled vocabulary (e.g. SNOMED, LOINC)?</td>
      <td>Enhances machine readability.</td>
      <td>*</td>
    </tr>
  </tbody>
</table>
</div>

To illustrate how CDEs can be used, consider the example for the [CMS Discharge Disposition](https://cde.nlm.nih.gov/deView?tinyId=cRUgcKV8co) element (table below) from the NIH CDE repository. The CDE's data label is shown in purple, possible response values, such as Home, Hospice or Long-term care are shown in red, and their concept identifiers in yellow. The concept identifiers help annotate (or map) the corresponding response values to ensure (semantic) interoperability and machine-readability. Typically, these machine-readable terms are represented with codes or URL links. For example, the concept "Home" is referred by the NCIT code C18002, which is also represented by [a URL](http://purl.obolibrary.org/obo/NCIT_C18002). Moreover, this annotation is crucial for integrating CDEs from different sources and allows computers to determine whether elements that appear similar are indeed ontologically matched (conceptually equivalent).  

<div class="table-container">
<table>
   <caption style="caption-side: top; font-weight: bold; padding: 5px;">
      Table: CDE for CMS Discharge Disposition 
   </caption>
   <tbody>
   <!-- Metadata block -->
      <tr>
         <th style="background-color: #e6e6fa;">Data element label</th>
         <td style="background-color: #e6e6fa;">CMS Discharge Disposition</td>
      </tr>

      <tr>
         <th>Question Text</th>
         <td>What was the patient's CMS discharge status code?</td>
      </tr>
      <tr>
         <th>Definition</th>
         <td>The CMS code specifying the status of the patient after being discharged from the hospital.</td>
      </tr>
      <tr>
         <th>Data Type</th>
         <td>Value List</td>
      </tr>

      <tr><td colspan="2"></td></tr>

      <!-- Header row -->
      <tr>
         <th style="background-color: #f8d7da;">PV Labels</th>
         <th>PV Definitions</th>
         <th style="background-color: #fff3cd;">PV Concept Identifiers</th>
         <th>PV Terminology Sources</th>
      </tr>

      <!-- Data rows -->
      <tr>
         <td style="background-color: #f8d7da;">Home</td>
         <td>A person's permanent place of residence. C18002</td>
         <td style="background-color: #fff3cd;">C18002</td>
         <td>NCI Thesaurus</td>
      </tr>
      <tr>
         <td style="background-color: #f8d7da;">Hospice</td>
         <td>An establishment that provides palliative and supportive care for terminally ill patients and their families via physical, psychological, social and other forms of care. C53532</td>
         <td style="background-color: #fff3cd;">C53532</td>
         <td>NCI Thesaurus</td>
      </tr>
      <tr>
         <td style="background-color: #f8d7da;">Long-term care</td>
         <td>A healthcare facility that provides rehabilitative, restorative, and/or ongoing skilled nursing care to patients or residents in need of assistance with activities of daily living. C53530</td>
         <td style="background-color: #fff3cd;">C53530</td>
         <td>NCI Thesaurus</td>
      </tr>
      <tr>
         <td style="background-color: #f8d7da;">Left against advice</td>
         <td>A designation that a patient has chosen not to heed the directions that medical staff has advised, and has chosen to leave the facility. C99969</td>
         <td style="background-color: #fff3cd;">C99969</td>
         <td>NCI Thesaurus</td>
      </tr>
      <tr>
         <td style="background-color: #f8d7da;">...</td>
         <td>...</td>
         <td style="background-color: #fff3cd;">...</td>
         <td>...</td>
      </tr>
   </tbody>
</table>
</div>


On this page we provide you with resources to help you find CDEs and provide guidance on how to proceed if no CDEs are available. Once you have identified the relevant CDEs for your research you can use them as a starting point to build, for example, your electronic Case Reports Forms (see [Metroline step: Design eCRF]({{site.baseurl}}/metroline_steps/design_ecrf)).


## Why is this step important
Benefits of using Common Data Elements are highlighted below.
* **Saves time and effort.** Reusing well-defined CDEs eliminates the need to create variables from scratch, speeding up study design and eCRF development, and ultimately enabling reuse of eCRFs with incorporated CDEs.
* **Facilitates data sharing and pooling.** When multiple datasets use the same CDEs, they can be aggregated, compared or analysed together more easily, especially in multi-centre studies or registries.
* **Improves data quality.** Standardised definitions reduce ambiguity and variation in data entry, helping to minimise errors and increase consistency across sources.
* **Supports interoperability.** CDEs annotated with ontologies enable semantic alignment between systems, making it easier to integrate and interpret data automatically.
* **Aids in meeting potential requirements.** CDEs focus on improving interoperability and reusability, key requirements for funding, publishing and regulatory compliance, such as CDISC’s CDASH for clinical trials.
* **Leverages community expertise.** Many CDEs are developed by domain experts, reviewed by peers and tested in real-world settings, offering reliable, consensus-based definitions.

## How to
To promote standardisation, data sharing and interoperability, researchers should start with reusing existing CDEs whenever possible. Follow the steps below to identify and apply suitable CDEs for your study or data collection effort.

### Step 1 - Consider your research context
Before searching for CDEs, clarify the following:
* What **research domain** are you working in (e.g. oncology, neurology, rare diseases)?
* Are you working with a **specific disease** or **population**?
* Are you collecting **clinical, epidemiological, omics or imaging data**?
* Are there any specific measures or methods you're planning to investigate or implement (e.g. vital signs, COVID-19 Complication Type, Morris Water Maze)

This will help you target the most relevant repositories in the next step.

{% include info-box.html type="example" title="Example" text="
Setting up a **Rare Disease** Patient Registry to keep **clinical** information about patients within a **specific disease group** (neuromuscular, vascular, etc...) to enable **research** for new diagnosis, natural history and evaluate effect of treatment strategies.
"%}


### Step 2 - Finding CDEs
* First, check if there are regulatory or domain specific CDE requirements/recommendations. For example:
  * The European Commission's [Common Data elements for Rare Diseases Registration](https://eu-rd-platform.jrc.ec.europa.eu/set-of-common-data-elements_en)
  * The CRDC [Standard Data Elements for oncology](https://cadsr.cancer.gov/onedata/Home.jsp)
  * NINDS [Common Data Elements for neuroscience](https://commondataelements.ninds.nih.gov/)
  * CDISC’s [CDASH for clinical trials](https://www.cdisc.org/standards/foundational/cdash)
* Second, if no domain specific requirements/recommendations are available or you need additional elements, consider searching for CDEs in a general repository such as the [NIH CDE Repository](https://cde.nlm.nih.gov/home). This repository includes endorsed elements that have been reviewed by the NIH CDE Governance Committee and comply with FAIR principles. 
* Third, if you can't find any CDEs for reuse, ask an expert in the field to help you find appropriate standards or try looking for a well-accepted codebook in, for example, [ART-DECOR](https://decor.nictiz.nl/ad/#/home).

{% include info-box.html type="example" title="Example" text="
The decision is made to collect data for the patient registry following the [Common Data Elements (CDEs) for Rare Diseases](https://eu-rd-platform.jrc.ec.europa.eu/set-of-common-data-elements_en), as required by the European Commission.
"%}

### Step 3 - Reuse, adapt and build upon the CDEs
Once you've identified relevant Common Data Elements (CDEs), you can:
* **Reuse directly.** If the CDE fully meets your needs (it has a clear definition, appropriate value set and proper ontology mappings) use the CDE as-is. This is the most robust path to semantic interoperability and consistency. 
* **Adapt with care.** If a CDE is structurally useful but needs minor changes, for example additional categories or translation, document all modifications clearly in for instance a data dictionary or codebook. Be aware that any adaptations may reduce comparability with other datasets.

Your dataset will likely include CDEs alongside context-specific variables. Augment the CDEs with variables you are missing. Ensure your codebook distinguishes between reused, adapted and new elements.

{% include info-box.html type="warning" title="Important" text="
Whenever possible, reuse or preserve the ontology codes that come with a CDE (e.g. SNOMED CT, LOINC, HPO). This enables machine-readable alignment and integration.
"%}

If a CDE does not yet include annotations, such as concept identifiers, as shown in the yellow box in the figure in the Short description, aim to add these annotations yourself. Ensure you document your annotations and adaptations explicitly, and consider sharing your contributions and modifications with the original source of the CDE to support future updates. Failure to properly document such changes can lead to semantic divergence when used by other teams, even if the CDE appears identical at first glance. To learn more about codebooks, see [Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics).

{% capture infobox_text1 %}
In addition to the set of common data elements for rare diseases registration, study and disease specific data elements were [identified and agreed upon](https://pmc.ncbi.nlm.nih.gov/articles/PMC9166638/) through collaboration among various European Reference Networks (ERNs). These additional elements were determined on a study-to-study basis and included patient-reported outcomes, such as those captured by the [OVAMA Questionnaire](https://ovama.org/ovama-questionnaire/).

The [initial data elements](https://eu-rd-platform.jrc.ec.europa.eu/set-of-common-data-elements_en) provided by the European Commision Joint Research Centre were not annotated with ontology codes. As part of a European Project, a group of Rare Disease and Data Experts collaboratively made decisions on how to annotate these elements while developing a structured data model. For example, the [data element sex](https://github.com/CARE-SM/CARE-Semantic-Model/wiki/CARE-SM-Sex) was annotated using the NCIT ontology. The label of this element is represented in the table below as NCIT:Sex Code, and its possible values are listed after.

<div class="table-container">
<table>
  <tbody>
    <tr>
      <td><strong>NCIT:Sex Code</strong>: <a href="http://purl.obolibrary.org/obo/NCIT_C160908">http://purl.obolibrary.org/obo/NCIT_C160908</a></td>
    </tr>
    <tr>
      <td><strong>NCIT:Female</strong>: <a href="http://purl.obolibrary.org/obo/NCIT_C16576">http://purl.obolibrary.org/obo/NCIT_C16576</a></td>
    </tr>
    <tr>
      <td><strong>NCIT:Male</strong>: <a href="http://purl.obolibrary.org/obo/NCIT_C20197">http://purl.obolibrary.org/obo/NCIT_C20197</a></td>
    </tr>
    <tr>
      <td><strong>NCIT:Undetermined</strong>: <a href="http://purl.obolibrary.org/obo/NCIT_C124294">http://purl.obolibrary.org/obo/NCIT_C124294</a></td>
    </tr>
    <tr>
      <td><strong>NCIT:Unknown</strong>: <a href="http://purl.obolibrary.org/obo/NCIT_C17998">http://purl.obolibrary.org/obo/NCIT_C17998</a></td>
    </tr>
  </tbody>
</table>
</div>
{% endcapture %}

{% include info-box.html type="example" title="Example" text=infobox_text1 %}

## Expertise requirements for this step 
Experts that may need to be involved, as described in Metroline Step: Build the Team, are described below.
* **Researcher.** Understands the scientific context of the data being collected.
* **Data steward.** Ensures the technical accuracy and consistency of how CDEs are applied.

## Practical examples from the community 
**Patient Registries on Rare Diseases**<br>
The Joint Research Centre has defined [Common Data Elements to be collected by all Rare Disease (RD) registries](https://eu-rd-platform.jrc.ec.europa.eu/set-of-common-data-elements_en) and collecting them will improve interoperability with other ERN registries that are obligated to collect these data items. So far, 16 minimal Rare Disease data elements have been identified as essential for further research in the field. This list includes the variables to be collected and how they should be annotated.

## Training
* [Webinar in the NIH CDE Repository](https://www.youtube.com/watch?v=H35FVD31tEs)
{% include metroline_steps/training_will_be_added.html %}


## Suggestions
{% include metroline_steps/suggestions_development.html %}
