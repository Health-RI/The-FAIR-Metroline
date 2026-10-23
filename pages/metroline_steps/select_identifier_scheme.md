---
title: Select identifier scheme
permalink: /metroline_steps/select_identifier_scheme
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***Data that are not discoverable cannot be reused, and data that cannot be reused are not FAIR. [Wilkinson et al., 2016](https://doi.org/10.1038/sdata.2016.18)***
>
> {{ current_step.summary }}

## Short description 
[Identifiers](https://rdmkit.elixir-europe.org/identifiers) are the anchors of FAIR (findable, accessible, interoperable and reusable) data. They provide unambiguous references to entities such as datasets, people, organisations, projects, samples, biological resources and concepts, allowing these entities to be found, referenced and connected across data, metadata and systems.

For identifiers intended to support FAIR exchange and long-term reference, the following properties are particularly important:
* **Globally unique.** Uniquely identifies an entity across systems and contexts.
* **Persistent.** Remains valid over time.
* **Machine actionable.** Can be interpreted and processed by software.
* **Resolvable.** Leads users or machines to metadata, a landing page or other information about the identified entity.

Different identifier schemes serve different purposes and should not be considered interchangeable. The appropriate scheme depends on the type of entity being identified and the context in which the identifier will be used. Local identifier schemes may, for example, be appropriate for records or samples managed within a project or organisation.

Examples of [widely used identifier schemes](https://zenodo.org/records/17350042) include:

| Identifier scheme                                                                | What it identifies                                                        | Example use                                                |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------- |
| [DOI](https://www.doi.org/)                                                      | Datasets, publications, software and other research outputs               | Citing and persistently referencing a published dataset    |
| [ORCID](https://orcid.org/)                                                      | Researchers and other contributors                                        | Identifying a dataset creator or contributor               |
| [ROR](https://ror.org/)                                                          | Research organisations                                                    | Identifying an affiliation                                 |
| [ISBN](https://www.isbn-international.org/) and [ISSN](https://portal.issn.org/) | Books and serial publications                                             | Identifying a book or journal                              |
| [RAiD](https://www.raid.org/)                                                    | Research projects and activities                                          | Connecting projects with people, organisations and outputs |
| [RRID](https://www.rrids.org/)                                                   | Research resources such as antibodies, organisms, cell lines and software | Identifying a resource used in an experiment               |
| [InChI](https://www.inchi-trust.org/about-the-inchi-standard)                    | Chemical substances represented by their molecular structure              | Identifying a chemical substance in a standardised way     |


An entity may have identifiers in more than one scheme depending on the context in which it is identified. For example, an internal employee identifier may be appropriate within an organisation, while an ORCID iD is more suitable for identifying the same researcher across organisations and research infrastructures.

Given the importance of persistent identifiers for FAIR data and the national health data infrastructure, [Health-RI](https://www.health-ri.nl/en) is also developing further guidance on persistent identifiers. More details will be added when they become available.

This step explains how to determine what needs to be identified, select an appropriate identifier scheme, check whether an identifier already exists within that scheme and arrange for a new identifier when necessary. It also addresses the consistent application and management of identifiers.

## Why is this step important
Identifiers provide the clarity needed to reference and connect data, metadata and related entities reliably. Where identifiers are intended to be shared across systems or remain usable over time, persistent identifiers are particularly important because they provide the stability required in FAIR ecosystems.

* **Improve findability.** Stable identifiers allow data, metadata and related resources to be discovered and referenced reliably across systems.
* **Prevent ambiguity.** Identifiers distinguish entities with similar names or descriptions and ensure that references point to the intended person, organisation, resource or concept.
* **Support interoperability.** Reusing recognised identifier schemes helps different systems refer to the same entities consistently and connect datasets to people, organisations, projects and related resources.
* **Enable machine actionability.** Identifiers represented in a standard form allow software to recognise entities and process relationships between them.
* **Support accessibility over time.** Resolvable identifiers can lead people and machines to metadata, landing pages or information about how a resource can be accessed, even when its location changes.
* **Enable reuse and citation.** Persistent identifiers allow research outputs and related entities to be referenced, cited and linked over time.

The required properties depend on the intended use. Local identifiers must be unique and consistently managed within their context, while identifiers used across systems or over time should generally be globally unique, persistent and resolvable.

## How to
Responsibilities for identifiers are shared. Researchers and domain experts help determine what needs to be identified and verify that identifiers refer to the correct entities. Data stewards and research support staff can advise on suitable identifier schemes, namespace management and consistent identifier use, while technical and infrastructure specialists may support identifier generation, resolution and long-term maintenance.

For researchers, the most important tasks are to reuse existing identifiers within appropriate schemes, apply them consistently and consult support services when new identifiers are required.

{% include how-to-summary-start.html
   number="1"
   title="Determine what needs to be identified"
   summary="Identify which entities need to be referenced, linked, cited or exchanged, where the identifier will be used and how long it needs to remain valid."
   id="step-1-determine-what-needs-to-be-identified"
%}

Begin by identifying the entities that require unambiguous references and why those references are needed.

* **Benefit.** Clarifying the entity type and intended use prevents the selection of an unsuitable identifier scheme. It also helps avoid assigning identifiers where they provide no practical value.
* **How.** Determine which entities need to be referenced, linked, cited or exchanged. These may include people, organisations, projects, datasets, software, samples, biological resources, variables, concepts or other records. Consider where the identifier will be used and how long it must remain valid. An identifier used only within one project may have different requirements from one that will be published or exchanged between organisations.

{% include info-box.html type="example" title="Example." text="
A research project may need:
* identifiers for its researchers;
* an identifier for the coordinating organisation;
* an identifier for the published dataset;
* identifiers for biological resources used in the study;
* local identifiers for samples managed within the project.

These entities have different characteristics and should not automatically be identified using the same type of scheme.
" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="2"
   title="Select an appropriate identifier scheme"
   summary="Choose a scheme suited to the entity type, intended use and relevant community, considering adoption, system support, uniqueness, persistence, resolvability and long-term governance."
   id="step-2-select-an-appropriate-identifier-scheme"
%}

Select a scheme that is appropriate for the entity type, intended use and relevant community. Consult a data steward or relevant infrastructure provider when several schemes appear suitable or when no clear community practice exists.

* **Benefit.** A suitable identifier scheme ensures that the identifier can be interpreted and used correctly by the people, repositories and systems that rely on it.
* **How.** Consider the following principles:
  * follow established practices in the relevant research domain and prefer widely adopted community schemes;
  * ensure that the scheme is supported by the repositories, catalogues and systems in which the identifiers will be used;
  * check whether the scheme provides the required uniqueness, persistence and resolvability;
  * consider whether it has credible governance and long-term stewardship.

{% include info-box.html type="example" title="Example." text="
ORCID is an appropriate scheme for identifying a researcher across research organisations and infrastructures. An internal employee number may continue to identify the same person within an organisation, but it is not a substitute for an ORCID iD in external research metadata.
" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="3"
   title="Check whether the entity already has an identifier in the selected scheme"
   summary="Search the authoritative registry or service associated with the selected scheme and reuse an existing identifier after confirming that it refers to the correct entity."
   id="step-3-check-whether-the-entity-already-has-an-identifier-in-the-selected-scheme"
%}

Before arranging for a new identifier, determine whether the entity has already been assigned an identifier within the selected scheme.

* **Benefit.** Reusing an existing identifier prevents duplicate identifiers or records within the same scheme and preserves connections to information already available in registries, catalogues and knowledge graphs.
* **How.** Search the authoritative registry or service associated with the selected scheme. Confirm that the record refers to the correct entity before reusing the identifier.

  Note that an entity may have identifiers in more than one scheme. When data from different systems are combined, document the relationships between these identifiers where needed to support correct integration. Detailed guidance on identifier mapping is beyond the scope of this page. [BridgeDb](https://www.bridgedb.org/) can support mappings between identifiers used by biological databases, while [SSSOM](https://mapping-commons.github.io/sssom) can be used to represent mappings between ontology or vocabulary terms.

{% include info-box.html type="example" title="Example." text="
```
organisation:
  name: Freie Universität Berlin
  ror: https://ror.org/046ak2485
```
In this example, the existing ROR ID is reused after confirming that the record refers to the intended organisation. This avoids requesting or using a duplicate record within the same scheme for the same entity.
" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="4"
   title="Obtain a new identifier when necessary"
   summary="If no identifier exists in the selected scheme, obtain one through an appropriate identifier service or repository, or create a locally managed identifier when identification is only required within a defined context."
   id="step-4-obtain-a-new-identifier-when-necessary"
%}

When the entity does not yet have an identifier in the selected scheme, obtain one.

* **Benefit.** A new identifier gives the entity a reference within the selected scheme and allows it to be distinguished from other entities.
* **How.** The appropriate method depends on the entity, scheme and intended use:
  * register the entity with an established identifier service when it falls within the scope of that service;
  * deposit a digital research output in a repository that assigns a persistent identifier, such as a DOI;
  * generate a locally managed identifier when the entity only needs to be identified within a defined project, organisation or system.

{% include info-box.html type="example" title="Example." text="
When a dataset is published through a repository, the repository may register a DOI and associate it with the dataset metadata. A sample created within a study may instead receive a locally generated identifier, such as `SAMPLE001` because it only needs to be identified within the project or system in which it is managed.
" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="5"
   title="Apply identifiers consistently"
   summary="Record identifiers in dedicated fields using the representation preferred by the identifier scheme or metadata model and use the same identifier wherever the same entity is referenced."
   id="step-5-apply-identifiers-consistently"
%}

Record selected identifiers consistently in data, metadata and supporting systems.

* **Benefit.** Consistent application removes ambiguity, improves machine processing and allows reliable connections to be made between entities.
* **How.** Store identifiers in dedicated fields rather than embedding them in free text. Use the preferred representation specified by the identifier scheme or metadata model. Apply the same identifier consistently wherever the same entity is referenced.

{% include info-box.html type="example" title="Example." text="
```
dataset:
  identifier: https://doi.org/10.5281/zenodo.6958051
affiliation:
  name: Freie Universität Berlin
  ror: https://ror.org/046ak2485
```
Here, the dataset DOI and organisation ROR ID are recorded in dedicated metadata fields.

The same principle applies to domain-specific entities. For example:
```
antibody_rrid: RRID:AB_2783747
cell_line_rrid: RRID:CVCL_0302
chemical_inchi: InChI=1S/C2H6O/c1-2-3/h3H,2H2,1H3
```
RRIDs identify registered research resources such as antibodies and cell lines. InChI provides a standardised, structure-derived identifier for a chemical substance.
" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="6"
   title="Use and verify resolvable identifiers"
   summary="For identifiers intended to support discovery or access across systems, use the recognised resolvable form and verify that it leads to the correct metadata, landing page or record."
   id="step-6-use-and-verify-resolvable-identifiers"
%}

After obtaining and recording an identifier, use its recognised resolvable form where it is intended to support discovery or access across systems.

* **Benefit.** Resolution allows people and machines to retrieve metadata or other information about the identified entity through a stable reference. Resolution does not necessarily provide direct access to the identified resource. A landing page may instead provide metadata and explain how access can be requested.
* **How.** For identifiers obtained through a repository or established identifier service, use the resolvable form provided or recommended by that service. For example, a DOI assigned when a dataset is deposited should normally be recorded as a https://doi.org/ URL.

  Check that the identifier resolves to the intended landing page or record. When a repository or identifier service is responsible for the resolution mechanism, report broken or incorrect resolution to that provider.

  Some scientific database identifiers do not have a single standard web address. A resolver such as [Identifiers.org](http://identifiers.org/) can provide a consistent resolvable form for these identifiers. For example, the PubMed identifier `22140103` can be expressed as:
  ```
  https://identifiers.org/pubmed:22140103
  ```
  Use the identifier scheme's own recognised resolver, such as doi.org for DOIs, where one is available.


{% include info-box.html type="example" title="Example." text="

| Identifier | How resolution is provided                                                                            |
| --- |-------------------------------------------------------------------------------------------------------|
| `https://doi.org/10.5281/zenodo.6958051` | Zenodo registers the DOI and maintains the landing page to which it resolves                          |
| `https://ror.org/046ak2485` | ROR provides and maintains the resolvable organisation record                                         |
| `https://identifiers.org/pubmed:22140103` | [Identifiers.org](http://identifiers.org/) resolves the identifier to the corresponding PubMed record |

A researcher depositing a dataset would normally use and verify the DOI supplied by the repository rather than create the resolution mechanism. By contrast, a local identifier such as `SAMPLE001` may remain non-resolvable when it is used only within the project or system in which it is managed.

" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="7"
   title="Manage namespaces for local identifiers"
   summary="Define and document where local identifiers are unique and, when they are exchanged beyond that context, use a stable and distinctive namespace or prefix to prevent collisions."
   id="step-7-manage-namespaces-for-local-identifiers"
%}

Document the context in which local identifiers are unique and add a namespace when identifiers are exchanged outside that context.

* **Benefit.** Namespaces prevent identifiers from different projects, organisations or systems from being confused when their local identifier values are identical.
* **How.** Define the scope within which each local identifier is unique. Document the identifier format, the party responsible for managing it and the rules for assigning identifiers. When identifiers will be exchanged outside their original context, combine the local identifier with a stable and documented namespace or prefix.

  The namespace must itself be sufficiently distinctive within the environment in which the identifiers will be exchanged. A generic prefix that could independently be used by several projects may not prevent collisions.


{% include info-box.html type="example" title="Example." text="

```
local_sample_id: SAMPLE001
qualified_sample_id: PROJ123:SAMPLE001
```
`SAMPLE001` may be sufficient within one project. Outside that project, however, another organisation or study may use the same value for a different sample. `PROJ123:SAMPLE001` makes the project context explicit and reduces the risk of confusion.

The project should document what `PROJ123` represents and who manages the namespace. Identifier values should not be reassigned to different entities.

" %}

{% include how-to-summary-end.html %}

{% include how-to-summary-start.html
   number="8"
   title="Maintain identifiers and their associated information"
   summary="Assign responsibility for keeping identifiers, metadata and resolution information accurate over time, manage changes and versions according to provider policies and never reassign an identifier to a different entity."
   id="step-8-maintain-identifiers-and-their-associated-information"
%}

Ensure that identifiers remain correctly associated with their entities and continue to function for as long as required.

* **Benefit.** Persistent identifiers support FAIR data only when they remain reliable over time. Ongoing maintenance preserves findability, keeps links to metadata and access information working and ensures that data and related entities can continue to be referenced and reused correctly.
* **How.** Determine:
  * who is responsible for maintaining the identifier and associated metadata;
  * how resolution information will be updated when the location of a resource changes;
  * what happens when a project, system or service ends;
  * whether a changed resource should retain its identifier, receive a version identifier or receive a new identifier;
  * how obsolete, merged or replaced entities will be represented;
  * whether institutional or community persistent identifier policies apply.
  
  Never reassign an existing identifier to a different entity. Follow the versioning and update policies of the identifier provider or repository.

{% include info-box.html type="example" title="Example." text="
A dataset moves to a different storage location after publication. Its DOI remains the same, while the DOI metadata are updated so that the identifier continues to resolve to the correct landing page. This preserves the dataset's findability and allows existing references to remain valid.

If a substantially revised dataset is published as a new version, the repository's versioning policy determines whether it receives a new DOI and how the versions are linked. Clear version relationships help users identify, cite and reuse the intended version.

" %}

{% include how-to-summary-end.html %}

## Practical examples from the community
This section includes additional worked examples of identifier types and implementation scenarios that may be relevant in specific contexts. Examples from community projects will be added as they become available.

### Identifying funding organisations
Funding organisations can be identified using persistent identifiers. ROR IDs can be used to identify research organisations, including funders, and are increasingly used for funding metadata. Crossref is transitioning its Open Funder Registry towards the use of ROR IDs.

{% include info-box.html type="example" title="Example." text="
```
funder:
  name: National Science Foundation
  identifier: https://ror.org/021nxhr62
```
" %}
Where an Open Funder Registry identifier is still used, it can also provide an unambiguous reference to the funding organisation. The Open Funder Registry was formerly known as FundRef.

### Identifying licences
Standard licence identifiers can be used to represent licences consistently in metadata.

{% include info-box.html type="example" title="Example." text="

```
licence:
  identifier: CC-BY-4.0
```
" %}
`CC-BY-4.0` is the SPDX short identifier for the Creative Commons Attribution 4.0 International licence. SPDX maintains standardised identifiers for licences used for software, data, hardware and documentation.

### Minting a persistent identifier
Some identifier schemes use the term minting for creating a new identifier. Researchers will often encounter this when publishing a research output through a repository.

{% include info-box.html type="example" title="Example." text="
```
Dataset deposited in repository
→ DOI registered
→ https://doi.org/10.5281/zenodo.6958051
```
" %}
In this case, the repository registers the DOI and associates it with metadata and a landing page. The researcher normally does not operate the identifier infrastructure directly.

Some workflows use other identifier systems. For example, a MINID (Minimal Viable Identifier) is designed as a lightweight identifier for making research data findable, accessible, interoperable and reusable. A MINID can be registered using the MINID client:

```
minid register --title "Dataset X" DatasetX.tar.gz --locations http://example.org/DatasetX.tar.gz
```

### Alternative persistent identifier infrastructures
DOIs are not the only infrastructure for persistent identifiers. The Handle System is another infrastructure for creating and resolving persistent identifiers. DOI resolution itself is built on Handle System infrastructure.

Projects or organisations operating such infrastructure are responsible for its configuration, governance and continued operation.

## Training
The Digital Preservation Coalition’s [Novice to Know-How: Online Digital Preservation Training](https://www.dpconline.org/digipres/prof-development/n2kh-online-training) provides guidance on persistent identifiers, criteria for choosing suitable persistent identifier schemes and the role of identifiers in digital preservation and findability.

## Suggestions
{% include metroline_steps/suggestions_released.html src=page.title%}
