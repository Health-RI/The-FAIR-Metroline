---
title: Use ontologies in the model
permalink: /metroline_steps/use_ontologies_in_the_model
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Ontologies provide a flexible approach to integrating data and sharing meaning and may be better able to assist in inferring meaning in complex situations. [Liyanage H, Krause P, de Lusignan S. Using ontologies to improve semantic interoperability in health data. BMJ Health & Care Informatics.](https://doi.org/10.14236/jhi.v22i2.159)***
>
> {{ current_step.summary }}

## Short description 
This step starts from the existing [semantic (meta)data model](https://fairmetroline.org/metroline_steps/create_or_reuse_a_semantic_model) that organises your domain's entities, attributes and value sets with clear project-level meaning. Building on that model, this step links its elements to ontology terms to make their meanings explicit, computable and interoperable. Ontologies are formal, logic-based representations of domain knowledge that define types of entities, relations and constraints, enabling explicit semantics and consistent computational interpretation. By adding this semantic layer, models become not only well-structured but also interoperable across systems.

## Why is this step important
A (meta)data model can express semantics for its project context, but those meanings are often implicit or local. The next challenge is to make them interpretable across systems. Ontologies provide the shared semantic layer that enables this. They make model elements formally defined and logically connected beyond their original context, turning isolated data structures into interoperable, machine-understandable representations. The following aspects highlight the main contributions of ontology use to semantic precision, data integration and FAIR alignment:
* **Shared meaning.** Ontologies use formal semantics and axioms (formal rules that software can check) to make each model element's meaning explicit across systems.
* **Data integration.** By providing precise, shared semantics, ontologies reduce false matches where labels align but meanings differ, enabling reliable combination and comparison across systems.
* **Automated reasoning and validation.** By encoding semantics formally, ontologies can be processed by logic reasoners (e.g. [HermiT](http://www.hermit-reasoner.com/) or [Pellet](https://github.com/stardog-union/pellet), both available for free use), software that can infer missing connections, check for inconsistencies (such as conflicting definitions or hard classifications) and flag contradictions.
* **FAIR alignment.** Using ontologies provides a formal, shared representation that makes meaning computable, directly supporting the [FAIR principle I1](https://www.go-fair.org/fair-principles/i1-metadata-use-formal-accessible-shared-broadly-applicable-language-knowledge-representation/). Adopting recognised community ontologies also advances conformance with domain standards, aligning with [R1.3](https://www.go-fair.org/fair-principles/r1-3-metadata-meet-domain-relevant-community-standards/).

{% include info-box.html type="example" title="Example" text="
As an illustrative example of these advantages, suppose System A uses the label “myocardial infarction” and System B uses “heart attack” to denote the same clinical concept. Both are bound to the same ontology IRI (Internationalized Resource Identifier) (A = B). A third System C uses “stroke”, which is bound to a different IRI (B ≠ C). By substitution, it follows that A ≠ C as well. In practice, this prevents false merges (heart attack ≠ stroke) while still integrating data where the label differs but the meaning is identical (myocardial infarction = heart attack). If a broader or narrower relation exists (e.g. “ischemic heart disease” broader than “myocardial infarction”), queries can still aggregate correctly without conflating distinct concepts.
"%}


## How to
Before starting, choose an ontology development methodology to guide your process—this applies whether you are creating a new model, extending or reusing an existing one and whether you are annotating newly collected data or aligning previously collected data. Well-known approaches include [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf), [Methontology](https://oa.upm.es/5484/1/METHONTOLOGY_.pdf), [SABiO – Systematic Approach for Building Ontologies](https://ceur-ws.org/Vol-1301/ontocomodise2014_2.pdf) and the [NeOn Methodology](https://oeg.fi.upm.es/index.php/en/methodologies/59-neon-methodology/index.html). These provide structured workflows for requirement gathering, conceptualisation, formalisation and evaluation, helping ensure your ontology or mappings are coherent, reusable and aligned with best practices. The following steps describe how to connect model elements to ontology terms and manage these bindings over time.

### Step 1 - Identify what needs annotation
* List the model elements that represent concepts or enumerated values, such as classes, attributes, value sets and common data elements.
* Record current labels, definitions and intended use to guide later term selection.

### Step 2 - Select appropriate ontologies
* Search trusted registries that cover your domain and application scope, such as: [BioPortal](https://bioportal.bioontology.org/), [Ontology Lookup Service (OLS)](https://www.ebi.ac.uk/ols/index), [Open Biological and Biomedical Ontologies (OBO) Foundry](https://obofoundry.org/), [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/dataset/lov/) and [BARTOC (Basic Register of Thesauri, Ontologies & Classifications)](https://bartoc.org/).
* Evaluate the ontologies' coverage, granularity, community adoption, maintenance status and licence conditions. For more information about that, check, e.g. [“Ten Simple Rules for Selecting a Bio-ontology”](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004743), the [OBO Foundry Principles](https://obofoundry.org/principles/fp-000-summary.html) and the [NCBO Ontology Recommender 2.0](https://bioportal.bioontology.org/recommender).
* Prefer ontologies with persistent, dereferenceable IRIs, clear versioning and open licences (e.g. Creative Commons Attribution (CC BY), Open Data Commons Attribution License (ODC-By), Creative Commons Zero (CC0)).
* Before creating new mappings, check whether equivalent mappings already exist (for example, in [FAIRsharing](https://fairsharing.org/), or [BioPortal mappings](https://bioportal.bioontology.org/mappings)). Reusing existing mappings promotes consistency and reduces effort.
* Document chosen sources and versions before mapping.

### Step 3 – Bind model elements to ontology terms
* Choose the most specific term that fits the intended meaning and avoid overly broad terms.
* Record both the label and IRI for each binding (e.g. an IRI such as [https://purl.obolibrary.org/obo/NCIT_C28421](https://purl.obolibrary.org/obo/NCIT_C28421) for “Male”).
* Capture mapping intent where useful, using predicates from Simple Knowledge Organization System (SKOS), such as `skos:exactMatch`, `skos:closeMatch`, `owl:equivalentClass` and `rdfs:subClassOf`. You can check the SKOS documentation [here](https://www.w3.org/2009/08/skos-reference/skos.html).
* Keep bindings separate from the source ontology. Do not change the original ontology’s IRIs.
* Store bindings in a structured, machine-readable form (e.g. [Resource Description Framework (RDF)](https://www.w3.org/TR/rdf11-primer/), [Web Ontology Language (OWL)](https://www.w3.org/OWL/), [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-reference/) or a dedicated mapping file such as [Simple Standard for Sharing Ontological Mappings (SSSOM)](https://w3id.org/sssom/)) with provenance fields such as who mapped, when, source version and rationale. Always include the ontology version IRI or release date for reproducibility.
* When no exact term exists, use the closest appropriate term and record the gap (i.e., note that no exact ontology term was found and why). Record this both in your mappings and in the documentation. For example, you can add an annotation in OWL (use `rdfs:comment` or `skos:note`) and add provenance in the mapping (e.g. using [SSSOM](https://mapping-commons.github.io/sssom/)). If the gap is significant, consider proposing a new term to the ontology maintainers.
* Use the fewest ontologies possible to make interoperability and maintenance easier. Using a large number of different ontologies, for instance, may make it difficult to check that terms are not contradictory.

{% include info-box.html type="example" title="Example" text="
Local value “Neck cancer” has no exact term, so you temporarily link it to “Head and neck cancer” using [https://purl.obolibrary.org/obo/DOID_5520](https://purl.obolibrary.org/obo/DOID_5520) with a `skos:closeMatch` and add a comment such as “No exact term for ‘Neck cancer’; new-term request submitted at https://example.org/issue/12345.”.
"%}

### Step 4 – Implement, validate and share
* Represent the model and its annotations using RDF or OWL and express constraints using [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/).
* Use dereferenceable IRIs for both your model elements and referenced ontology terms. 
  * Where you control the identifiers, create persistent IRIs that dereference to human- and machine-readable descriptions. For external ontology terms, reuse their IRIs as-is. If a required term's IRI does not dereference, still use it as-is and add a reference link (e.g. using rdfs:seeAlso) to a stable catalogue record.
* Include ontology citations and versions in the model metadata and changelog.
* Validate mappings and constraints automatically as part of your quality checks. Resolve any unsatisfiable classes or constraint violations before publication and keep validation reports as part of your documentation.
* Recommended tools for implementation and validation include:
  * [Protégé](https://protege.stanford.edu/). Ontology editing and reasoning (supports HermiT, Pellet)
  * [ROBOT (Ontology Build Tool)](https://robot.obolibrary.org/). Command-line ontology manipulation 
  * [OpenRefine](https://openrefine.org/). Cleaning and reconciling tabular data with ontologies
  * [TopBraid SHACL API](https://github.com/TopQuadrant/shacl) or [pySHACL (Python implementation of SHACL)](https://github.com/RDFLib/pySHACL). SHACL validation
  * [SSSOM Toolkit](https://github.com/mapping-commons/sssom-py). Managing mappings in SSSOM format
* Publish the annotated model and bindings in a stable, publicly accessible location with a clear licence (e.g. GitHub, FAIRsharing, or institutional repositories).
* Mappings and annotations themselves can be shared under permissive licences (e.g. CC BY 4.0 or CC0), unless source ontology licences impose restrictions.
* Even when data cannot be openly shared (e.g. due to privacy or legal restrictions), publish the model and bindings so that others can understand, align and interoperate with your work.

### Step 5 – Maintain and Govern Bindings
Ontologies evolve over time, so mappings and bindings must be reviewed and updated to remain valid and interpretable. Regular maintenance ensures your model stays aligned with current standards and avoids broken or outdated references.
* **Plan regular reviews.** Check for new ontology releases at fixed intervals (e.g. every 6 or 12 months).
* **Watch for deprecations.** Replace any deprecated or merged terms with their recommended alternatives and keep notes of these changes.
* **Update and record.** Use version control (e.g. Git) to track all mapping changes and maintain a changelog including the ontology version used and the reason for each update.
* **Migrate if needed.** When key ontology terms change, adjust your annotated data or mappings using tools such as ROBOT or simple scripts.
* **Re-validate.** After each update, re-run SHACL validation or reasoning checks to confirm that the model remains coherent.

As the volume of (meta)data and repositories grows, continuous ontology maintenance can become a significant burden. Establish governance rules that clarify which bindings will be maintained, how often they are reviewed and by whom, and make these rules part of your project and repository documentation.

## Expertise requirements for this step
Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below. 
* **Ontology experts.** Select appropriate ontologies, apply alignment patterns and evaluate ontology quality and scope.
* **Metadata experts.** Ensure coverage of required metadata elements and provide clear documentation for users.
* **Semantic web technology experts.** Represent bindings in RDF, OWL and SKOS; maintain internal coherence of the model; design persistent IRIs, implement SHACL validation and automate mapping publication workflows.

## Practical examples from the community 
* [CARE-SM (Clinical and Registry Entries Semantic Model)](https://github.com/CARE-SM). Annotates clinical registry concepts using OBO Foundry-aligned ontologies for precise semantics and cross-resource mapping.
* [ELIXIR (European Life-science Infrastructure for Biological Information) Bioschemas](https://bioschemas.org/). Extends [Schema.org](https://schema.org/) and uses ontology terms to improve dataset discovery on the web.
* [Model (Investigation–Study–Assay)](https://isa-tools.org/). Links experimental metadata fields to [Ontology for Biomedical Investigations (OBI)](https://obi-ontology.org/) and [Chemical Entities of Biological Interest (ChEBI)](https://www.ebi.ac.uk/chebi/) terms to support consistent interpretation and validation.

## Training
One interesting educational resource is the [Ontology mapping with Ontology Xref Service (OxO)](https://faircookbook.elixir-europe.org/content/recipes/interoperability/ontology-alignment-oxo.html) provided in the FAIRCOOKBOOK. This specific recipe shows how to use EMBL-EBI ontology Xref Service (OxO) to map ontology terms between source and target vocabularies.

An interesting resource is the [OBO Semantic Engineering Training](https://oboacademy.github.io/obook/) (Open Biological and Biomedical Ontologies Organized Knowledge). Although developed for a particular project, its content offers a practical demonstration of how to address a genuine case.

## Suggestions
{% include metroline_steps/suggestions_development.html %}

