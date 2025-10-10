---
title: Create or reuse a semantic (meta)data model
permalink: /metroline_steps/create_or_reuse_a_semantic_model
---

{% include assign_current_step.html %}

{% include development_status.html step=current_step %}

>***'Generating a semantic model is often the most time-consuming step of data FAIRification. However, we expect the modelling effort to diminish as more and more models are made available for reuse over time. Thus, it is important to first check whether a semantic model already exists for the data and the metadata that may be reused. For cases where no semantic model is available a new one needs to be generated.' [Jacobsen et al. Data Intelligence (2020)](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification)***
>
> {{ current_step.summary }}

## Short description 
A semantic (meta)data model describes the meaning of your (meta)data elements in a structured, machine-readable, and ideally precise and unambiguous manner. It helps transform your data into a FAIR artefact that can be discovered, queried, and reused, supporting consistency, interoperability, and discoverability, especially across systems and communities (see [Metroline step: Apply (meta)data model]({{site.baseurl}}/metroline_steps/apply_metadata_model)). Before creating a new model, always check whether an existing (meta)data model can be reused or adapted.

## Why is this step important?
Creating or reusing a semantic (meta)data model makes your data and metadata understandable not just to you, but also to others who may want to access, combine, and reuse it. This step aligns with the FAIR principles F2, I1, I2, I3, R1, and R1.3, and is important for several reasons:

- **Enable reuse.** Ensures that data can be discovered, correctly understood, and reused, even in ways you might not have anticipated (F2, I1, I3, R1.3).
  - For models annotated with ontologies: the hierarchical structure of ontologies also enhances findability—for instance, a model for 'neck cancer' can be found through broader searches for 'rare disease' or 'cancer'. You find more information on the use of ontologies [here](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/277151776/Metroline+Step+Use+ontologies+in+the+data+model).

- **Promote standardisation.** Reusing established models where possible supports alignment with community practices, promotes convergence and avoids redundant work (I2, R1.3).

- **Ensure clarity.** Clearly defining what each data element means, their relationships and possible values helps others interpret your data accurately and use it in new contexts (F2, I1, I3, R1.3).

- **Support interoperability.** Well-defined and accessible definitions allow different systems and organisations to work together effectively using your data under clear conditions (I1, I2, I3).

## How to
Adopting a structured approach to creating a semantic model is the foundation for making your project's data consistent and FAIR. Before selecting vocabularies or designing a new model, choose a modelling methodology that fits your needs. This will help you structure the process, select appropriate tools, and engage stakeholders effectively.

Commonly used methodologies include:
- [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf) or [Methontology](https://faculty.kutztown.edu/frye/secure/CSC480SW/Resources/Methontology2005.pdf) for structured, concept-level modelling.
- [SABiO](https://ceur-ws.org/Vol-1301/ontocomodise2014_2.pdf) (or its extended version [SABiOx](http://www.inf.ufes.br/~vitorsouza/wp-content/papercite-data/pdf/aguiar-souza-ontobras24.pdf), for modelling large domains) for creating well-founded models based on conceptual modelling best practices and foundational ontologies.
- [NeOn](https://oeg.fi.upm.es/index.php/en/methodologies/59-neon-methodology/index.html) or [LOT methodology](https://lot.linkeddata.es/) if your goal involves reuse, modularity, or Linked Data.

The following steps provide a general framework for this process. They are meant to be used in combination with your chosen methodology, which should always be your main source of guidance.

To illustrate these steps, we'll use a *running example:* the "HRI Clinic," a small practice looking to standardise its patient visit records. Each record contains the patient's name, the visit date, the reason for the visit (e.g., "annual check-up" or "flu symptoms"), and the doctor they saw.

### Step 1 – Prepare your data for modelling
This initial step ensures exactly what pieces of information should be included in the semantic model. This simply means deciding what's "in" and what's "out" by identifying the specific concepts from your subject area that the model will represent.

*Example:* As preparation, the HRI Clinic defines the following main elements as part of their model's scope: `PatientID`, `VisitDate`, `ReasonForVisit`, and `Doctor`.

Additional information on preparation can be found in the [Metroline Step: Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics) page.

### Step 2 – Search for existing models
Before creating a new model, first investigate existing semantic metadata models to see if one (or more) can be reused. To support this decision (taken in step 3), gather the following information from each potential reuse candidate model:

- **Scope and domain coverage**: Does the model represent the entities and relationships relevant to your context?
- **Granularity**: Is it too general or too detailed for your needs?
- **Community adoption**: Is it actively maintained and used in your field?
- **Licensing and openness**: What are the conditions for reusing and extending the model?

Start by searching in well-maintained repositories. The [OntoUML/UFO Catalog](http://w3id.org/ontouml-models/) is an example of a catalogue of models that you can use to check for existing models. For ontologies, you can check the following resources:

| **Search engine** | **Short description** |
|---|---|
| [BioPortal](https://bioportal.bioontology.org/) | BioPortal is a repository of biomedical ontologies. |
| [Ontology Lookup Service (OLS)](https://www.ebi.ac.uk/ols4/ontologies) | The OLS (by EMBL-EBI) is a repository for biomedical ontologies that aims to provide a single point of access to the latest ontology versions. |
| [The Open Biological and Biomedical Ontology (OBO) Foundry](http://obofoundry.org/) | Develops interoperable ontologies for biomedical sciences. Participants follow and contribute to the development of a set of principles to ensure that ontologies are logically well-formed and scientifically accurate. |
| [BARTOC](https://bartoc.org/) | The Basic Register of Thesauri, Ontologies & Classifications (BARTOC) is a database of Knowledge Organization Systems and KOS related registries with the goal to list as many Knowledge Organization Systems as possible at one place. |
| [Ontobee](https://ontobee.org/) | Ontobee is a web-based linked data server and browser specifically designed for ontology terms. It supports ontology visualisation, query, and development, provides a web interface for displaying the details and its hierarchy of a specific ontology term. |
| [AgroPortal](https://agroportal.lirmm.fr/) | Browser for ontologies for agricultural science based on NBCO BioPortal. |
| [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/) | Focuses on RDF vocabularies used in Linked Data publishing. |

If no suitable model is found in these resources, consult recent literature in your field to identify modelling efforts that could be adapted.

Examples of widely reused metadata models:
- [DCAT](https://www.w3.org/TR/vocab-dcat-3/)/[DCAT-AP](https://op.europa.eu/en/web/eu-vocabularies/dcat-ap): Metadata model for datasets and catalogues (used in open data portals).
- [Schema.org](http://Schema.org): Lightweight vocabulary for web-exposed metadata (e.g., used by Google Dataset Search).
- [Health-RI metadata model](https://zenodo.org/records/17100310): The Health-RI Core Metadata Schema is an RDF-based specification developed for the Dutch National Health Data Catalogue. It aligns with DCAT-AP NL and draft HealthDCAT-AP, it includes Health-RI-specific and ELSI-related fields. The schema defines main and supporting classes with structured properties to describe - among others - datasets, catalogues, and data services.

Examples of widely reused data models:
- [BEAT-COVID metadata model](https://github.com/LUMC-BioSemantics/beat-covid/tree/master/fair-metadata-model) is a metadata model that allows the metadata of Beat-COVID 19 data resources to be stored and managed by FAIR data points.
- [CARE-SM](https://github.com/CARE-SM/CARE-Semantic-Model): The Clinical and Registry Entries is a semantic data model designed to represent healthcare patient information, with a focus on rare disease patients.
- The [OMOP Common Data Model](https://ohdsi.github.io/CommonDataModel/index.html) is another data model that provides standardised vocabularies.

If a model is partially suitable, it can often be extended or mapped.

*Example:* after conducting a literature review, the HRI Clinic team decided to use the CARE-SM model to annotate their data. This model already describes information relevant to their scope and is mapped to other resources, such as OMOP and HL7 FHIR.

### Step 3 – Reuse, extend, or create
Once candidate models or vocabularies are identified, decide whether to reuse one as-is, use parts of it and extend it to fit your context, or create a new one. Most semantic modelling methodologies have workflows or guidelines to support your decision. Use the information gathered from the previous step, the methodologies guidance and the following general recommendations during your decision making process.

- **Reuse**
  - Use the model as-is if it meets your requirements in terms of scope, semantics, and technical format. This is the preferred approach for maximising interoperability, promoting standardisation, and avoiding redundancy.
  - *Tip:* Reuse models that are well-documented, actively maintained, and permissively licensed. In most cases, you will reuse parts of the model according to your scope. When doing so, make sure the model remains consistent (e.g. no relationships are missing between the concepts to be reused).
  - *Example:* Adopting the Data Catalogue Vocabulary (DCAT), a W3C standard, directly to describe datasets in an open data catalogue.

- **Extend**
  - Extend an existing model when it partially fits your needs but lacks certain domain-specific elements. This may involve either a core, general-purpose model (e.g. Schema.org, DCAT) or a domain-specific ontology (e.g. SNOMED‐CT, DDI).
  - *Tip:* Do not modify the original model. Instead, you create an extension that builds on it while preserving compatibility. In practice, this means adding your own classes or properties and linking them to the original model using semantic linking methods such as rdfs:subClassOf, skos:broader, or owl:equivalentClass. This approach ensures that your additions are interoperable and aligned with community standards. This can also include merging different existing models that together cover your domain of interest. If doing so, check whether the source models semantically align in their definition of overlapping concepts.
  - *Example:* Extending Schema.org's Dataset class with a biomedical domain-specific subclass, such as BiomedicalDataset, to capture additional context. Examples of further extensions of Schema.org include [Bioschemas](https://bioschemas.org/profiles/).

- **Create**
  - Create a new model only when no suitable model exists, and when reuse or extension is not feasible. This approach requires greater expertise in ontology engineering and should follow established best building practices.
  - *Tip*: Even when creating from scratch, it is strongly recommended to reuse existing vocabularies where possible for attributes and relations. In this case, following modelling methodologies is highly recommended. Make sure your model is properly validated using adequate tools and by consulting domain experts.
  - *Example:* Designing a new semantic model for an emerging domain where no standard ontologies yet exist, following SABiO methodology.

Always document the rationale behind your choice. This supports transparency, facilitates reuse, and helps others integrate with your model.

*Example:* the HRI Clinic decides to use only parts of the CARE-SM for their use case. Specifically, they reuse the *Demographics* and *Treatment and Interventions* modules, which are sufficient for their purposes. Within those modules, they select only the concepts related to their use case.

### Step 4 – Use standard technologies, document and share
Use established semantic web technologies to encode your model in a machine-readable and interoperable way. A common best practice is to implement the model using semantic web technologies. These technologies help encode your model in a way that both humans and machines can interpret consistently.

- **RDF** – For structuring data as triples
- **OWL** – For defining classes and relationships
- **SHACL** – For validating the data structure and constraints

To promote FAIRness:
- Use persistent, dereferenceable URIs for all classes, properties, and instances of your model. This ensures that others (or machines) can resolve and interpret your resources over time.
- Include human-readable labels and descriptions for each concept, ideally in multiple languages, to support both usability and semantic clarity.

If extending an existing model, follow the technical conventions of the reused vocabulary to maintain compatibility. When sharing your model, always:
- Publish it in a stable, publicly accessible location such as [GitHub](https://github.com/), [FAIRsharing](https://fairsharing.org/), or [BioPortal](https://bioportal.bioontology.org/) to facilitate community access and feedback.
- Assign an open and clear license (e.g., [CC-BY](https://creativecommons.org/share-your-work/cclicenses/), [ODC-BY](https://opendatacommons.org/licenses/by/)) to define usage rights and promote legal reuse.
- Provide metadata describing the model's purpose, target audience, and scope, and include authorship and institutional information.
- Maintain versioning by using version numbers in both the documentation and the URI pattern (e.g., [https://example.org/vocab/1.2/](https://example.org/vocab/1.2/)). This allows users to reference specific versions and track changes over time.

Even when your data cannot be openly shared (e.g. due to privacy or legal restrictions), the semantic model and its metadata can and should be FAIR. Publishing the model separately enables others to understand and align with your structure, even if the underlying data remains restricted.

*Example:* The HRI Clinic modelling team decides to use RDF to structure their data into triples and OWL to define their data's rules and relationships. The clinic publishes their simplified version of CARE-SM on GitHub (including a clear license, version and credit to the original model).

## Expertise requirements for this step
Creating or reusing a semantic (meta)data model typically involves multiple experts, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team).

- **Metadata experts.** Bring a strong understanding of what metadata is, how it differs from data, and how it supports documentation, discovery, and reuse by both humans and machines. This expertise is essential from the start of the modelling process, as it underpins how data is meaningfully described and exposed.
  - *When reusing or extending a model*: for instance, help assess whether existing metadata fits the intended purposes.
  - *When creating a model*: for instance, support the definition of metadata for the model itself, including license and authorship.

- **Semantic modelling experts.** Understand how to use conceptual and ontological modelling approaches to define the precise meaning of data elements. Familiar with modelling languages such as UML (conceptual models) and OWL (ontologies), they ensure the model is unambiguous and interoperable across tools and systems.
  - *When reusing or extending a model*: check if reused or added concepts are fit for purpose and their definitions ontologically sound.
  - *When creating a model*: help define the scope, structure, and relations in line with modelling best practices.

- **Vocabulary and ontology experts.** Know how to identify and assess semantic resources, such as general-purpose vocabularies (e.g. DCAT) and domain-specific ontologies (e.g. DDI, SNOMED CT), and how to align terms with them.
  - *When reusing, extending or creating a model*:
    - Help evaluate if vocabularies capture intended meanings and whether local schema elements can be mapped to existing standards.
    - Promote consistency and reuse across systems, especially in regulated domains such as health or environmental sciences, where adherence to community standards is often required.

- **Semantic web technology experts.** Have experience implementing models using RDF, OWL, and SHACL, core standards for making models machine-readable and technically valid. This expertise is particularly relevant when implementing, extending, or validating the structure of a selected model in a semantic framework.
  - *When reusing, extending or creating a model*:
    - Help represent mappings explicitly between internal schema elements and external vocabularies.
    - Ensure structure and constraints are formally expressed and validated, in alignment with the FAIR principles.

## Practical examples from the community
Below are examples of how research communities and infrastructures have created or reused semantic (meta)data models to improve interoperability and support FAIR implementation. These cases demonstrate reuse, extension, alignment with standards, and use of semantic web technologies.

**DCAT-AP (Data Catalog Vocabulary Application Profile)**

[DCAT-AP (Data Catalog Vocabulary Application Profile)](https://op.europa.eu/en/web/eu-vocabularies/dcat-ap) demonstrates reuse of a general-purpose vocabulary and alignment with public data standards.
- Widely reused across European public data portals to describe datasets in a structured and interoperable way.
- Extends the [W3C DCAT](https://www.w3.org/TR/vocab-dcat-3/) vocabulary and enables semantic alignment across national and institutional catalogues.

**Schema.org**

[Schema.org](http://Schema.org) shows how lightweight semantic modelling can enhance findability and integrate with web-based publishing pipelines.
- Used by a variety of organisations, including the [European Life-sciences Infrastructure for Biological Information (ELIXIR)](https://elixir-europe.org/), the [Global Biodiversity Information Facility (GBIF)](https://www.gbif.org/), and individual repositories, to improve discoverability of datasets via [Google Dataset Search](https://datasetsearch.research.google.com/).
- Metadata is structured using Schema.org terms and often mapped from internal metadata schemas.

**ISA Model (Investigation–Study–Assay)**

[ISA Model (Investigation–Study–Assay)](https://www.isacommons.org/) illustrates both model reuse and extension with community ontologies for complex experimental workflows.
- Adopted in the life sciences to represent experimental metadata in a structured and semantically rich way.
- Often used in combination with domain-specific ontologies such as [Ontology for Biomedical Investigations (OBI)](https://obi-ontology.org/) and [Chemical Entities of Biological Interest (ChEBI)](https://www.ebi.ac.uk/chebi/), and aligned with community reporting standards like [Minimum Information about any (x) Sequence (MIxS)](https://genomicsstandardsconsortium.github.io/mixs/) or the [European Nucleotide Archive (ENA)](https://www.ebi.ac.uk/ena/browser/checklists) checklists.

**OBI (Ontology for Biomedical Investigations) + Minimum Information about any (x) Sequence (MIxS)**

[OBI (Ontology for Biomedical Investigations)](https://obi-ontology.org/) + [Minimum Information about any (x) Sequence (MIxS)](https://genomicsstandardsconsortium.github.io/mixs/) shows domain-specific reuse and mapping of internal fields to standard ontologies.
- OBI provides formal representations for protocols and study designs, while MIxS defines structured metadata for microbial studies.
- Reused in projects such as [MGnify](https://www.ebi.ac.uk/metagenomics) and [BioSamples](https://www.ebi.ac.uk/biosamples/), with custom mappings to internal schemas to support submission validation and data integration.

**GO FAIR Implementation Networks (INs)**

[GO FAIR Implementation Networks (INs)](https://www.go-fair.org/implementation-networks/) highlights community-driven modelling and domain-level semantic standardisation.
- Various Implementation Networks (e.g., for agriculture, personalised health, or nanomaterials) have developed or reused semantic models to align experimental data with domain ontologies and regulatory requirements.

**Health-RI metadata schema**

The [Health-RI metadata schema](https://github.com/Health-RI/health-ri-metadata/) demonstrates reuse and extension of DCAT-based standards, including explicit schema mapping and RDF serialisation for FAIR publishing.
- The Dutch Health-RI initiative has developed a core metadata schema for its [National Health Data Catalogue](https://www.healthdata.nl/en/services/national-health-data-catalogue).
- Based on DCAT-AP and extended with [HealthDCAT-AP](https://healthdcat-ap.github.io/).
- Defines a structured set of metadata elements with controlled vocabularies, usage guidelines, and SHACL validation rules.
- Supports mapping local metadata to the Health-RI model, enabling conversion to RDF and publication via a [FAIR Data Point](https://www.fairdatapoint.org/).

**CARE Semantic Model (CARE-SM)**

[CARE Semantic Model (CARE-SM)](https://care-sm.readthedocs.io/en/latest/index.html) demonstrates a community-driven approach led by the European Joint Programme on Rare Diseases (EJP RD).
- Built on the Semanticscience Integrated Ontology (SIO), to define every concept in the data model, using upper-level classes and properties.
- Each instance is associated with a domain-specific class from the OBO Foundry to ensure semantic clarity.

## Training
{% include metroline_steps/training_will_be_added.html %}

## Suggestions
{% include metroline_steps/suggestions_development.html %}
