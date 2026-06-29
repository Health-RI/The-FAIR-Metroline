---
title: Use ontologies in the model
permalink: /metroline_steps/use_ontologies_in_the_model
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***Ontologies provide a flexible approach to integrating data and sharing meaning and may be better able to assist in inferring meaning in complex situations. [Liyanage H, Krause P, de Lusignan S. Using ontologies to improve semantic interoperability in health data. BMJ Health & Care Informatics.](https://doi.org/10.14236/jhi.v22i2.159)***
>
> {{ current_step.summary }}

## Short description 
This step starts from the existing [semantic (meta)data model](https://fairmetroline.org/metroline_steps/create_or_reuse_a_semantic_model) that organises your domain's entities, attributes and value sets with clear project-level meaning. Building on that model, this step links its elements to ontology terms to make their meanings explicit, computable and interoperable. Ontology annotation may cover metadata elements, data model elements and value sets, benefiting both metadata and data layers. Ontologies are formal, logic-based representations of domain knowledge that define types of entities, relations and constraints, enabling explicit semantics and consistent computational interpretation. By adding this semantic layer, the model becomes not only well-structured but also interoperable across systems.

## Why is this step important
A (meta)data model can express semantics for its project context, but those meanings are often implicit or local. The next challenge is to make them interpretable across systems. Ontologies provide the shared semantic layer that enables this. They make model elements formally defined and logically connected beyond their original context, turning isolated data structures into interoperable and machine-understandable representations.

The following aspects highlight the main contributions of ontology use to semantic precision, data integration and FAIR alignment:
* **Shared meaning.** Ontologies use formal semantics and axioms (formal rules that software can check) to make each model element's meaning explicit across systems.
* **Data integration.** By providing precise, shared semantics, ontologies reduce false matches where labels align but meanings differ, enabling reliable combination and comparison across systems. To ensure accuracy and reliability, consult experts.
* **Automated reasoning and validation.** By encoding semantics formally, ontologies can support automated checks with logic reasoners such as [HermiT](http://www.hermit-reasoner.com/) or [Pellet](https://github.com/stardog-union/pellet), both available as free tools. These checks are typically configured by data stewards, ontology experts or semantic web technology experts during implementation or quality checks. They can help infer missing connections, check for inconsistencies such as conflicting definitions or incompatible classifications and flag contradictions.
* **FAIR alignment.** Using ontologies provides a formal, shared representation that makes meaning computable, directly supporting the [FAIR principle I1](https://www.go-fair.org/fair-principles/i1-metadata-use-formal-accessible-shared-broadly-applicable-language-knowledge-representation/). Adopting recognised community ontologies also advances conformance with domain standards, aligning with [R1.3](https://www.go-fair.org/fair-principles/r1-3-metadata-meet-domain-relevant-community-standards/).

{% include info-box.html type="example" title="Example" text="
As an illustrative example of these advantages, suppose System A uses the label “myocardial infarction” and System B uses “heart attack” to denote the same clinical concept. Both are mapped to the same ontology IRI (Internationalized Resource Identifier) (A = B). A third System C uses “stroke”, which is mapped to a different IRI (B ≠ C). By substitution, it follows that A ≠ C as well. In practice, this prevents false merges (heart attack ≠ stroke) while still integrating data where the label differs but the meaning is identical (myocardial infarction = heart attack). If a broader or narrower relation exists, for example “ischemic heart disease” being broader than “myocardial infarction”, queries can still aggregate correctly without conflating distinct concepts.
"%}

## How to
Before starting, choose an ontology development methodology to guide your process. This applies whether you are creating a new model, extending or reusing an existing one, or annotating newly collected data or aligning previously collected data. Well-known approaches include [Ontology Development 101](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf), [Methontology](https://www.researchgate.net/publication/50236211_METHONTOLOGY_from_ontological_art_towards_ontological_engineering), [SABiO – Systematic Approach for Building Ontologies](https://ceur-ws.org/Vol-1301/ontocomodise2014_2.pdf) and the [NeOn Methodology](https://oeg.fi.upm.es/index.php/en/methodologies/59-neon-methodology/index.html). These provide structured workflows for requirement gathering, conceptualisation, formalisation and evaluation, helping to ensure that your ontology or mappings are coherent, reusable and aligned with best practices.

Where needed, seek support early from relevant experts, such as ontology, metadata or semantic web technology experts.

The steps below describe how to connect model elements to ontology terms and manage these mappings over time. In the steps below, a mapping means a recorded link between a model element, such as a class, attribute or value, and an ontology term.

### Step 1 - Identify what needs annotation
* List the model elements that represent concepts or enumerated values, such as classes, attributes, value sets and common data elements.
* Record current labels, definitions and intended use to guide later term selection.

### Step 2 - Select appropriate ontologies
* Search trusted registries that cover your domain and application scope, such as [BioPortal](https://bioportal.bioontology.org/), [Ontology Lookup Service (OLS)](https://www.ebi.ac.uk/ols/index), [Open Biological and Biomedical Ontologies (OBO) Foundry](https://obofoundry.org/), [Linked Open Vocabularies (LOV)](https://lov.linkeddata.es/dataset/lov/) and [BARTOC (Basic Register of Thesauri, Ontologies & Classifications)](https://bartoc.org/).
* Evaluate the ontologies' coverage, granularity, community adoption, maintenance status and licence conditions. For more information, see for example [Ten Simple Rules for Selecting a Bio-ontology](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004743), the [OBO Foundry Principles](https://obofoundry.org/principles/fp-000-summary.html) and the [NCBO Ontology Recommender 2.0](https://bioportal.bioontology.org/recommender).
* Prefer ontologies with persistent, dereferenceable IRIs (Internationalised Resource Identifiers, globally unique web identifiers that can be resolved online to retrieve information about a concept), clear versioning and open licences (e.g. Creative Commons Attribution (CC BY), Open Data Commons Attribution License (ODC-By) and Creative Commons Zero (CC0)).
* Before creating new mappings between model elements and ontology terms, check whether equivalent mappings already exist, for example in [FAIRsharing](https://fairsharing.org/) or [BioPortal mappings](https://bioportal.bioontology.org/mappings). Reusing existing mappings promotes consistency and reduces effort.
* For domain-specific models, also check whether established code lists or terminology subsets exist that can inform ontology term selection or support reuse of existing mappings.
* Document chosen sources and versions before mapping.

### Step 3 – Bind model elements to ontology terms
* Choose the most specific term that fits the intended meaning and avoid overly broad terms.
* Record both the label and IRI for each mapping (e.g. an IRI such as `https://purl.obolibrary.org/obo/NCIT_C28421` for "Male").
* Capture mapping intent where useful, using predicates from Simple Knowledge Organization System (SKOS), such as `skos:exactMatch`, `skos:closeMatch`, `owl:equivalentClass` and `rdfs:subClassOf`. See the [SKOS documentation](https://www.w3.org/2009/08/skos-reference/skos.html) for further guidance.
* Keep mappings separate from the source ontology. Do not change the original ontology’s IRIs.
* Store mappings in a structured, machine-readable form, such as [Resource Description Framework (RDF)](https://www.w3.org/TR/rdf11-primer/), [Web Ontology Language (OWL)](https://www.w3.org/OWL/), [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-reference/) or a dedicated mapping file such as [Simple Standard for Sharing Ontological Mappings (SSSOM)](https://w3id.org/sssom/). Include provenance fields such as who mapped the term, when the mapping was created, the source version and the rationale. Always include the ontology version IRI or release date for reproducibility.
* When no exact term exists, use the closest appropriate term and record the gap, i.e. note that no exact ontology term was found and why. Record this in both your mappings and documentation. For example, you can add an annotation in OWL using `rdfs:comment` or `skos:note` and add provenance in the mapping, for example using [SSSOM](https://mapping-commons.github.io/sssom/). If the gap is significant, consider proposing a new term to the ontology maintainers.
{% include info-box.html type="example" title="Example" text="
A local value \"Neck cancer\" has no exact term, so you temporarily map it to \"Head and neck cancer\" using `https://purl.obolibrary.org/obo/DOID_5520` with a `skos:closeMatch` and add a comment such as \"No exact term for 'Neck cancer'; new-term request submitted at `https://example.org/issue/12345`\".
"%}
* Use the fewest ontologies possible to make interoperability and maintenance easier. Using a large number of different ontologies, for instance, may make it difficult to check that terms are not contradictory.

### Step 4 – Implement, validate and share
* Represent the model, including its annotations and mappings, in a machine-readable semantic web format such as RDF or OWL. This enables the semantic (meta)data model to become interoperable and reusable through ontology mappings. Where validation rules are needed, express constraints using [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/).
* Use dereferenceable IRIs for both your model elements and referenced ontology terms.
* Where you control the identifiers, create persistent IRIs that dereference to both human-readable and machine-readable descriptions. For external ontology terms, reuse their IRIs as-is. If a required term's IRI does not dereference, still use it as-is and add a reference link, for example using `rdfs:seeAlso`, to a stable catalogue record.
* Include ontology citations and versions in the model metadata and changelog.
* Validate mappings and constraints automatically as part of your quality checks. Resolve any unsatisfiable classes or constraint violations before publication and keep validation reports as part of your documentation.
* Recommended tools for implementation and validation include:
  * [Protégé](https://protege.stanford.edu/) for ontology editing and reasoning (includes support for HermiT and Pellet);
  * [ROBOT (Ontology Build Tool)](https://robot.obolibrary.org/) for command-line ontology manipulation;
  * [OpenRefine](https://openrefine.org/) for cleaning and reconciling tabular data with ontologies;
  * [TopBraid SHACL API](https://github.com/TopQuadrant/shacl) or [pySHACL (Python implementation of SHACL)](https://github.com/RDFLib/pySHACL) for SHACL validation;
  * [SSSOM Toolkit](https://github.com/mapping-commons/sssom-py) for managing mappings in SSSOM format.
* Publish the annotated model and mappings in a stable, publicly accessible location with a clear licence, for example GitHub, FAIRsharing or institutional repositories.
* Mappings and annotations themselves can be shared under permissive licences, for example CC BY 4.0 or CC0, unless source ontology licences impose restrictions.
* Even when data cannot be openly shared, for example due to privacy or legal restrictions, publish the model and mappings so that others can understand, align with and interoperate with your work.

### Step 5 – Maintain and govern mappings
Ontologies evolve over time, so mappings must be reviewed and updated to remain valid and interpretable. Regular maintenance helps ensure that your model stays aligned with current standards and avoids broken or outdated references.

* **Plan reviews appropriate to the scope of the model.** For reusable models, registries or mappings maintained beyond a single study, check for new ontology releases at fixed intervals, for example every 6 or 12 months. For single-study models, at minimum record the ontology versions used and review mappings when the model is updated, before publication or when reuse is expected.
* **Watch for deprecations.** When ontology terms are deprecated or merged, record the recommended alternatives and update mappings where appropriate. For resources released or reused over time, preserve the links between old and new terms in a versioned mapping or changelog so that earlier and later versions remain interoperable.
* **Update and record.** Use version control, for example Git, to track all mapping changes and maintain a changelog including the ontology version used and the reason for each update.
* **Migrate if needed.** When key ontology terms change, adjust your annotated data or mappings using tools such as ROBOT or simple scripts.
* **Re-validate.** After each update, re-run SHACL validation or reasoning checks to confirm that the model remains coherent.

As the volume of (meta)data and repositories grows, continuous ontology maintenance can become a significant burden. Establish governance rules that clarify which mappings will be maintained, how often they are reviewed and by whom, and make these rules part of your project and repository documentation.

## Expertise requirements for this step
Experts that may need to be involved, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team), are described below. 
* **Ontology experts.** Select appropriate ontologies, apply alignment patterns and evaluate ontology quality and scope.
* **Metadata experts.** Ensure coverage of required metadata elements and provide clear documentation for users.
* **Semantic web technology experts.** Represent the model and its mappings in RDF, OWL and SKOS; maintain model coherence; design persistent IRIs, implement SHACL validation and automate mapping publication workflows.

## Practical examples from the community 
* **[CARE-SM (Clinical and Registry Entries Semantic Model)](https://github.com/CARE-SM).** Annotates clinical registry concepts using OBO Foundry-aligned ontologies for precise semantics and cross-resource mapping. Also see this video.
* **[ELIXIR (European Life-science Infrastructure for Biological Information) Bioschemas](https://bioschemas.org/).** Extends [Schema.org](https://schema.org/) and uses ontology terms to improve dataset discovery on the web. Also see this video.
* **[ISA model (Investigation-Study-Assay)](https://isa-tools.org/).** Links experimental metadata fields to [Ontology for Biomedical Investigations (OBI)](https://obi-ontology.org/) and [Chemical Entities of Biological Interest (ChEBI)](https://www.ebi.ac.uk/chebi/) terms to support consistent interpretation and validation.

## Training
One useful educational resource is the [FAIR Cookbook recipe on ontology mapping with the Ontology Xref Service (OxO)](https://faircookbook.elixir-europe.org/content/recipes/interoperability/ontology-alignment-oxo.html). This recipe shows how to use the EMBL-EBI Ontology Xref Service (OxO) to map ontology terms across source and target vocabularies.

Another useful resource is the [OBO Semantic Engineering Training](https://oboacademy.github.io/obook/) available through OBOOK. Although developed for a specific project, it provides practical examples and training materials covering ontology engineering workflows, modelling approaches and semantic technologies.

## Suggestions
{% include metroline_steps/suggestions_development.html src=page.title %}
