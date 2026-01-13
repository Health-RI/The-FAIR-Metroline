---
title: Transform and expose FAIR (meta)data
permalink: /metroline_steps/transform_and_expose_fair_metadata
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Data that is not exposed in a standardised, machine-readable way might as well not exist. [The FAIR Guiding Principles for scientific data management and stewardship](https://www.nature.com/articles/sdata201618)***
>
> {{ current_step.summary }}

## Short description 
Before following this step, make sure you have already mapped your data and metadata to appropriate (meta)data schemas, as described in [Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model).

This step guides you through **transforming and exposing** both your **data** and **metadata**. These are two closely related but distinct processes. While the semantic models, tools, and storage methods differ (metadata is usually made publicly accessible, while data often remains restricted due to privacy or sensitivity), both transformations are essential to make your resource FAIRer.

**Transforming** involves converting your mapped (meta)data into standardized [RDF](https://www.w3.org/TR/rdf12-concepts/) format. For metadata describing datasets, this typically means using RDF vocabularies such as [DCAT](https://www.w3.org/TR/vocab-dcat-3/), a widely adopted schema for expressing dataset metadata in catalogs. Although DCAT modeling is introduced in the [Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model), this step focuses on the actual transformation and the preparation of your (meta)data for publication.

{% include info-box.html type="info" title="Why use RDF for your (meta)data?" text="
* **Interoperability.** Uses shared vocabularies so your (meta)data can connect seamlessly with other datasets.
* **Machine readability.** Designed for automated discovery, linking, and querying.
* **Flexibility.** Works across diverse formats and structures without losing meaning.
* **Long-term preservation.** Format that remains usable over time.

While RDF may be more effort than a simple table, it is especially valuable when your resource needs to be integrated, discovered, and reused beyond its original context.
" %}

**Exposing** means publishing this transformed (meta)data through trusted platforms, such as the [National Health Data Catalog](https://catalogus.healthdata.nl/), so that your research resources become discoverable, accessible, interoperable, and reusable by others.   

By following this step, you put the FAIR principles into practice with practical advice and tools to improve the reusability and interoperability of your metadata and data. This ensures that it can be effectively matched and reused within the scientific community and beyond.

## Why is this step important
Transforming and exposing your (meta)data in this way makes it FAIR-ready and visible to others under your chosen access conditions (see [Metroline Step: Define access conditions]({{site.baseurl}}/metroline_steps/define_access_conditions)). Building on the metadata model from the 
[Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model), you share your resource in a standardised, machine-readable format. This increases its findability, accessibility and reuse.

In other words, this step:
* **Increases findability.** By representing your (meta)data in RDF and publishing it via trusted catalogues or FAIR Data Points, it becomes part of a searchable ecosystem. Researchers can locate it through precise queries, even if they are looking for specific variables or concepts. Without this, your resource may remain invisible outside your own project.
* **Improves accessibility.** Standardised publication methods mean others can retrieve your (meta)data under the conditions you choose. This ensures legitimate users can access it without needing to contact you directly, reducing barriers to reuse.
* **Enhances interoperability.** Using shared vocabularies and semantic models allows your (meta)data to “speak the same language” as others’ datasets. This means it can be combined, compared, or linked without time-consuming reformatting. This is a crucial step for large-scale, multi-centre, or cross-domain research. Without interoperability, even well-documented data remains siloed.
* **Supports reusability.** Detailed, standardised descriptions and clear licensing empower others to reuse your resource in new studies, saving time and avoiding duplication of effort. Revisiting your own work months or years later becomes far easier when it’s in a consistent, machine-readable format.
* **Provides semantic context.** RDF captures not just values, but their meaning and relationships. This makes it possible for automated systems to connect your (meta)data with related resources and for humans to interpret it correctly.

## How to
This how-to provides guidance for transforming, storing and exposing data (steps 1 and 2) as well as for metadata (step 3). You can start with either, depending on your preference.

### Step 1 - Transform data
Before you can expose your data in a FAIR way, you first need to transform it into a standardised, machine-readable format using semantic models that you previously applied in the step [Metroline Step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model). This often means converting tabular or structured data into RDF. The right tool for transforming data depends on your source format and your technical skills.

{% include info-box.html type="example" title="Examples" text="
* **[OpenRefine](https://openrefine.org/) – [RDF Transform extension](https://github.com/AtesComp/rdf-transform).** Offers a user-friendly, graphical user interface (GUI), way to transform project data into RDF. OpenRefine supports file types like tab separated (TSV), comma separated (CSV), Excel (XLS, XLSX), JSON, XML, RDF as XML, and Google spreadsheets. 
* **[FAIR-in-a-Box](https://github.com/ejp-rd-vp/FiaB).** Convert CSV files into RDF with a step-by-step interface; useful for implementing the [Clinical and Registry Entries Semantic Model (CARE-SM)](https://github.com/CARE-SM). Although you can apply any model through OpenRefine, the process must be done manually. In contrast, FAIR-in-a-box includes built-in templates for CARE-SM, requiring only correctly structured CSV files from you.
* **[Castor EDC](https://www.castoredc.com/).** Supports semantic export templates for transforming study data and metadata to RDF.
" %}


### Step 2 - Store and expose data
Once your data is transformed into RDF, it needs to be stored so it can be efficiently queried, accessed and reused. This is usually done with an RDF triplestore, a database designed for storing and retrieving semantic data using a specialised data querying language [SPARQL](https://www.w3.org/TR/sparql11-query/). Common tools include [GraphDB](http://graphdb.ontotext.com/) and [Blazegraph](https://blazegraph.com/). Triplestores can serve as a backend for web applications or services that work with semantic data.

To make both data and metadata discoverable and accessible, you can publish RDF metadata through a [FAIR Data Point](https://www.fairdatapoint.org/) (FDP). An FDP provides a standard way to publish metadata, structured in three layers: **Catalogue**, **Dataset** and **Distribution**.

Importantly, an FDP is intended for **publishing metadata**, not for hosting datasets themselves. For privacy sensitive or access controlled data, the FDP should describe the dataset and point (through its **Distribution** or **Data Service**) to the secure system where the data resides, for example, a trusted repository, triplestore, or API, where your chosen reuse conditions (such as requiring authentication or data access agreements) are enforced.

This distinction is important: the FDP makes your resource _findable and understandable_, while the actual access control is handled by the system hosting the data.

Combining a triplestore with an FDP provides both user-friendly search interfaces and machine-actionable access. This setup allows users to find datasets, understand their structure and licensing, and access the underlying data directly.


{% include info-box.html type="example" title="Examples" text="
* **GraphDB + FDP.** Use GraphDB for RDF storage and an FDP to publish metadata referencing a dataset, offering both open and controlled access through the FDP interface.
* **Standalone triplestore with embedded metadata.** In some cases, RDF data can be hosted in a triplestore that also serves limited metadata. While this supports technical interoperability, it may be less visible in broader FAIR ecosystems without an FDP.
* **Web APIs with RDF output.** For simpler cases or when full triplestore infrastructure is not feasible, RDF data can be exposed through an lightweight web Application Programming Interface (API) that return linked data representations.
" %}

Choosing the right storage and exposure method depends on your data’s scale, your intended users and your infrastructure. For many research projects, combining a triplestore with an FDP is a robust, standards-based solution for FAIR metadata and data sharing.

### Step 3 – Transform, store and expose metadata
To make your metadata FAIR, it must be semantically enriched, machine-readable and exposed through standard interfaces. This enables both humans and machines to discover and reuse metadata across platforms and domains.

Start by transforming metadata into a structured format using semantic web standards like [RDF](https://www.w3.org/RDF/), and vocabularies such as [DCAT](https://www.w3.org/TR/vocab-dcat-3/), [Dublin Core](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/) or relevant domain ontologies. This ensures interoperability and aligns your metadata with community best practices. For the health domain, [HealthDCAT-AP](https://healthdcat-ap.github.io/) and the more specific [Heath-RI core metadata](https://github.com/Health-RI/health-ri-metadata/tree/master) scheme are a good starting point.

{% include info-box.html type="example" title="Examples of metadata transformation tools" text="
* **[FAIR Data Point reference implementation](https://docs.fairdatapoint.org/en/latest/).** For publishing metadata layers in line with [DCAT](https://www.w3.org/TR/vocab-dcat-3/) specifications, aligning with national and European cataloguing standards. The FDP itself is a metadata exposure tool consistent with DCAT and the FDP specification, serving as a discoverable and interoperable metadata layer.
* **[FAIR-in-a-Box](https://github.com/ejp-rd-vp/FiaB).** Covers both data and metadata and includes CSV to RDF conversion and metadata templates.
* **[OpenRefine](https://openrefine.org/).** RDF transform extension for transforming structured metadata to RDF.
* **[CEDAR Workbench](https://metadatacenter.org/).** Supports the creation of semantically rich metadata through templates to produce annotated datasets.
* **[FAIR Data Station](https://fairds.fairbydesign.nl/).** Manages [ISA metadata](https://isa-tools.org/) with RDF output. This output needs to be exposed in a triplestore. 
* **[Castor EDC (FDP Component)](https://fdp.castoredc.com/fdp).** Contains a template to fill out metadata and exposes that information in a way that is semantically compatible with DCAT and FDP specifications. 
"%}

## Expertise requirements for this step 
Transforming and exposing FAIR (meta)data effectively requires a mix of domain knowledge, semantic expertise and technical skills. Ideally, teams should involve:
* **Domain experts.** Provide context and ensure that the transformed (meta)data accurately reflects the research content.
* **Semantic modellers or ontologists.** Advise on selecting and applying the right ontologies, vocabularies and semantic models.
* **FAIR data stewards or infrastructure professionals.** Coordinate the process and set up the systems needed to store and expose data and metadata in a FAIR-compliant way.

While some basic exposure tasks may not require advanced technical knowledge, setting up robust pipelines (e.g. triplestores, FAIR Data Points) and ensuring semantic interoperability benefits greatly from the combined expertise above.

## Practical examples from the community
**VASCA Registry (Castor EDC + FAIR Data Point)**<br>
The VASCA registry (Registry of Vascular Anomalies) implemented the CDE semantic data model and uses the DCAT metadata schema to publish metadata in three layers: catalogue, dataset and distribution. It stores machine-readable RDF data in Castor EDC’s FAIR Data Point, supporting de novo FAIRification, meaning data is FAIR from the moment it is collected through the eCRF.

More information:
* [VASCA registry metadata (human-readable)](https://fdp.castoredc.com/fdp/catalog/vasca)
* [VASCA RDF output (TTL format)](https://fdp.castoredc.com/fdp/catalog/vasca?format=ttl)
* [De-novo FAIRification via an Electronic Data Capture system](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification)
* [The de novo FAIRification process of a registry for vascular anomalies](https://ojrd.biomedcentral.com/articles/10.1186/s13023-021-02004-y)

**PRISMA Study (Radboudumc FAIR Data Point)**<br>
The PRISMA study applies the Health-RI core metadata schema and the DCAT metadata schema to expose its study metadata in a machine-readable, standardised format. By using a FAIR Data Point, PRISMA ensures that its clinical study metadata is accessible through trusted, FAIR-aligned infrastructure.

More information:
* [PRISMA metadata in the Radboudumc FAIR Data Point](https://fdp.radboudumc.nl/catalog/fa48b19f-f390-4023-872d-f0f0024bfcec)

## Training
* FAIR Cookbook - [An inventory of tools for converting data to RDF](https://faircookbook.elixir-europe.org/content/recipes/interoperability/rdf-conversion.html)

## Suggestions
{% include metroline_steps/suggestions_released.html %}
