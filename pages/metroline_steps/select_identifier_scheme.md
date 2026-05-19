---
title: Select identifier scheme
permalink: /metroline_steps/select_identifier_scheme
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Data that are not discoverable cannot be reused, and data that cannot be reused are not FAIR. [Wilkinson et al., 2016](https://doi.org/10.1038/sdata.2016.18)***
>
> {{ current_step.summary }}

## Short description 
[Identifiers](https://rdmkit.elixir-europe.org/identifiers) are the anchors of FAIR (findable, accessible, interoperable, reusable) data. They give each resource, whether a dataset or an element in a metadata schema, a unique and reliable point of reference. In FAIR settings this applies across datasets, metadata records, people, organisations, licences and even individual data values. Effective identifiers must be globally unique, persistent, machine actionable and resolvable, and they should be used consistently so that resources can be connected without ambiguity. Domains such as chemistry show the value of this clearly because identifiers like [InChI](https://www.inchi-trust.org/) or [SMILES](https://www.daylight.com/dayhtml/doc/theory/theory.smiles.html) capture molecular structures in a reproducible way that allows data to be shared and interpreted across tools and disciplines.

In practice, responsibilities for identifier management are shared. Most technical and policy decisions, such as a) selecting identifier schemes, b) registering namespaces, or c) creating mappings between schemes, are typically supported by data stewards or research support staff. For researchers, the most important tasks are to reuse existing identifiers where possible, apply them consistently and consult support services when new identifiers are required. At the same time, researchers remain responsible for the content of their metadata and data, and should be involved in decisions about updates that may require versioning or the minting of a new identifier.

Given the crucial role of persistent identifiers in enabling FAIR data and, in turn, a robust national health-data infrastructure, Health-RI is also developing guidance on PIDs. More details will be added as soon as they become available.

Below are 5 [widely used identifier systems](https://zenodo.org/records/17350042) across FAIR and open‑science communities. They illustrate the range of resolvable, persistent identifiers commonly applied in research infrastructures. 

| Identifier | What it Identifies | Resolvable | Typical Use |
| --- | --- | --- | --- |
| DOI (DataCite) | Datasets, publications, software | Yes | Citing datasets |
| ORCID | Individual researchers | Yes | Identifying contributors |
| ROR ID | Research organisations | Yes | Standardising affiliations |
| ISSN / ISBN | Journals (ISSN), books (ISBN) | Yes | Identifying publications |
| RAID | Research projects and activities | Yes | Linking outputs to projects |


## Why is this step important
Persistent identifiers matter because they provide the stability and clarity that allow data and metadata to function reliably in FAIR ecosystems. This is enabled through the key properties described below.
* **Globally unique.** Prevents collisions so a resource is never confused with another, which supports reliable discovery and stable referencing across systems.
* **Persistent.** Remains valid over time, even when systems or storage locations change, which keeps data citable and usable in the long term.
* **Machine actionable.** Has a defined structure that software can interpret directly, which removes ambiguity and enables automation.
* **Resolvable.** Can be followed through a recognised protocol to metadata or to the resource itself, which strengthens discoverability and accessibility.

## How to
Below are nine principles for implementing identifiers in FAIR data management. Steps 1–8 are researcher-focused steps, whilst Step 9 reflects an institutional responsibility.

### Step 1 - Reuse community identifiers whenever possible
Reusing existing identifiers prevents duplication and immediately connects your data to the wider research ecosystem. Many entities already have authoritative identifiers that you can adopt directly.
* **Benefit.** Strengthens interoperability and aligns your dataset with established knowledge graphs.
* **How.** Check registries for existing identifiers before creating new ones. For example, [ORCID](https://orcid.org/) is commonly used for creators, [ROR](https://ror.org/) for institutions and [FundRef](https://www.crossref.org/services/funder-registry/) for funders. [Identifiers.org](http://identifiers.org/) can help locate identifiers for many scientific entities. Health-RI is also developing guidance to support harmonised identifier use. References will be added as soon as they become available.

{% include info-box.html type="example" title="Example. Reusing identifiers." text="
```
# ORCID for researcher
creator: \"Jane Doe\"
creator.orcid: https://orcid.org/0000-0002-1584-4316

# ROR for organisations
organization: \"Freie Universität Berlin\"
organization.ror: https://ror.org/046ak2485

# FundRef for funders
funder: \"National Science Foundation\"
funder.fundref: https://doi.org/10.13039/100000001
```
" %}

### Step 2 - Mint new identifiers when none exist
When no suitable identifier is available, assigning a persistent identifier to a digital object (“minting”) gives the resource a stable, globally unique reference that can be reliably cited and reused.
* **Benefit.** Ensures the resource has a persistent, globally unique and widely recognised identifier that supports reliable citation, discovery and reuse.
* **How.** Register the digital object with a persistent identifier service, which assigns and records a globally unique identifier together with associated metadata. For example, [DataCite](https://datacite.org/) can mint DOIs, while [MINIDs](https://minid.readthedocs.io/en/latest/index.html) (Minimal Viable Identifiers) provide lightweight identifiers backed by a registry service. Typically, client software computes metadata such as checksums locally and submits this information to the identifier service, which returns the minted identifier. See FAIR Cookbook's [Unique, persistent identifiers](https://faircookbook.elixir-europe.org/content/recipes/findability/identifiers.html) and [Minting identifiers with Minid](https://faircookbook.elixir-europe.org/content/recipes/findability/identifiers-minids.html) for additional guidance.

{% include info-box.html type="example" title="Example. Minting an identifier with MINID." text="
```
minid --register --title \"Dataset X\" DatasetX.tar.gz --locations http://example.org/DatasetX.tar.gz
```
" %}

### Step 3 - Assign an identifier to each dataset
Every dataset needs a stable anchor that supports discovery, citation and long-term accessibility. Assigning a PID formalises the dataset as a citable and traceable resource. This typically occurs when the dataset is published in a repository, rather than during data collection.
* **Benefit.** Catalogue services and automated workflows can reliably reference the dataset over time.
* **How.** Register the dataset metadata with a PID authority such as [DataCite](https://datacite.org/) or [Crossref](https://www.crossref.org/) to obtain a persistent identifier (PID) that functions as the dataset’s primary reference. Other PID systems may also be suitable depending on the repository or community practices.

### Step 4 - Use identifiers consistently throughout the metadata
Metadata should reference people, organisations, licences and related resources using standard identifiers. This removes ambiguity and allows machines to interpret relationships correctly.
* **Benefit.** Removes ambiguity in metadata, improves interoperability and supports automated processing across systems.
* **How.** Reference people, organisations, licences and related resources using standard identifiers consistently. For example, [ORCID](https://orcid.org/) can be used for authors, [ROR](https://ror.org/) for organisations and [SPDX identifiers](https://spdx.org/licenses/) for licences. Other identifiers may be used depending on community norms or repository requirements.

{% include info-box.html type="example" title="Example. Metadata snippet with persistent identifiers." text="
```
# ORCID for researcher
creator: \"Jane Doe\"
creator.orcid: https://orcid.org/0000-0002-1584-4316

# ROR for organisations
organization: \"Freie Universität Berlin\"
organization.ror: https://ror.org/046ak2485
```
" %}

### Step 5 - Assign identifiers to relevant data entities and values
Internal elements such as records, variables or samples may benefit from stable identifiers, but not every element requires one. Only assign identifiers where reuse, integration or automated processing is expected. When in doubt, consult a data steward to decide which elements should receive identifiers.
* **Benefit.** Allows tools to reference and interpret the individual records and values inside a dataset reliably, which supports automation and reuse across datasets.
* **How.** Use controlled vocabularies, ontologies or domain-specific identifiers where appropriate. For example, [RRIDs](https://scicrunch.org/resources) can identify biological resources, whilst [InChI](https://www.inchi-trust.org/) or [SMILES](https://www.daylight.com/dayhtml/doc/theory/theory.smiles.html) can represent chemical structures. Other identifier systems may be appropriate depending on the dataset and community practices.


{% include info-box.html type="example" title="Example. Identifiers for internal entities and values." text="
```
# Local structured identifier for a sample
sample_id: SAMPLE001

# RRID for a biological resource
sample_rrid: RRID:AB_2783747

# RRID for a cell line
cell_line_rrid: RRID:CVCL_0302

# InChI representation of a chemical structure
chemical_inchi: InChI=1S/C2H6O/c1-2-3/h3H,2H2,1H3

# SMILES representation of a chemical structure
chemical_smiles: CCO
```
" %}

### Step 6 - Make identifiers resolvable
Identifiers become actionable when they resolve to a landing page or metadata record. Resolution enables both humans and machines to discover and interpret the resource.
* **Benefit.** Supports findability and accessibility through standard web protocols.
* **How.** Ensure that identifiers resolve to a landing page or metadata record that humans and machines can access. For example, DOIs registered with [DataCite](https://datacite.org/) or [Crossref](https://www.crossref.org/) provide resolvable links. Other persistent identifier systems can also be used. Guidance from FAIR Cookbook's [Creating resolvable identifiers](https://faircookbook.elixir-europe.org/content/recipes/infrastructure/gupri.html) can support implementation.

{% include info-box.html type="example" title="Example. Resolvable and unresolvable identifier." text="
| Identifier type  | Identifier                              | Result                                                                                                           |
| ---------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Unresolvable DOI | https://doi.org/10.1234/example.dataset | The dataset cannot be reliably discovered or interpreted because no landing page or metadata record is available |
| Resolvable DOI   | https://doi.org/10.5281/zenodo.6958051  | The dataset can be discovered and interpreted through a landing page with metadata                               |

" %}

### Step 7 - Use namespaces for local identifiers
Local identifiers are often only unique within a single project or system. Adding a namespace or prefix makes it clear where the identifier comes from and prevents collisions when data are shared across systems.
* **Benefit.** Prevents collisions and keeps identifiers reliable as they move across systems.
* **How.** Assign a consistent prefix to local identifiers and document it in metadata to ensure global uniqueness. When possible, register the namespace with services such as [Identifiers.org](http://identifiers.org/) to make identifiers globally traceable and resolvable. Prefixes can include a project or organisational code. Other approaches to namespace management may also be used depending on community practices.

{% include info-box.html type="example" title="Example. Namespace prefixes and globally resolvable identifiers." text="
```
# Namespace prefix added to a local identifier to prevent identifier collisions across systems
local_sample_id: PROJ123:SAMPLE001

# Globally resolvable identifier using a registered namespace
pubmed_id: https://identifiers.org/pubmed:22140103
```
" %}

### Step 8 - Map equivalences between identifier systems
Different communities often use different identifiers for the same concept. Mapping these supports interoperability across systems.
* **Benefit.** Creates bridges between identifier schemes and supports cross-dataset integration.
* **How.** Map equivalent identifiers across different systems to support interoperability. For example, use [BridgeDb](https://www.bridgedb.org/) or the [SSSOM standard](https://github.com/mapping-commons/sssom) and refer to FAIR Cookbook's [Interlinking data from different sources](https://faircookbook.elixir-europe.org/content/recipes/interoperability/identifier-mapping.html) for guidance on identifier mapping. Other mapping frameworks may also be appropriate depending on the community and identifier systems in use.

{% include info-box.html type="example" title="Example. Mapping equivalent identifiers using SSSOM." text="

| Element | Identifier |
| --- | --- |
| BRCA2 in Ensembl | ENSEMBL:ENSG00000139618 |
| BRCA2 in NCBI Gene | NCBIGene:675 |
| Relationship | sssom:exactMatch |

```
# Same mapping expressed with SSSOM fields
subject_id: ENSEMBL:ENSG00000139618
subject_label: BRCA2
object_id: NCBIGene:675
object_label: BRCA2
predicate_id: sssom:exactMatch
```
" %}

### Step 9 - Ensure governance and infrastructure for persistence
Identifier quality depends on stable services that guarantee resolution and long-term accessibility. Good governance protects identifiers from decay.
* **Benefit.** Maintains trust and usability of identifiers across decades.
* **How.** Establish or rely on stable services that guarantee identifier resolution and long-term accessibility. PID infrastructures such as [GUPrI](https://faircookbook.elixir-europe.org/content/recipes/infrastructure/gupri.html) help ensure persistent resolution and long-term stewardship. Governance arrangements and technical infrastructure are usually managed at the institutional or community level rather than by individual researchers. To make governance concrete, consider questions such as:
  * Who is responsible for maintaining resolution if a system changes?
  * What happens to identifiers when a project ends? 
  * Does your institution have a PID policy?
  
  These questions help ensure identifiers remain persistent, resolvable and trustworthy over time.

{% include info-box.html type="example" title="Example. Persistent identifier resolved through the n2t.net/Handle system, ensuring long-term accessibility." text="
```
pid: https://n2t.net/hdl:20.500.12633/1HK1DTv1wPt3a
```
" %}
 

## Expertise requirements for this step 
Based on the expertise described in the [Metroline: Build the team]({{site.baseurl}}/metroline_steps/build_the_team), the following expertise may be relevant:
* **Data specialist.** Understands which identifiers are needed. 
* **Technical specialist.** Can generate or integrate identifiers in systems. 
* **Policy specialist.** Ensures identifier use follows agreed rules.

## Practical examples from the community 
{% include metroline_steps/looking_for_examples.html %}

## Training
* **Digital Preservation Coalition's [Novice to Know-How: Online Digital Preservation Training](https://www.dpconline.org/digipres/prof-development/n2kh-online-training).** This training provides specific advice on how to choose PID schemes and the criteria for choosing an adequate one for digital preservation and findability. This training also covers best practices and range of options available. 

## Suggestions
{% include metroline_steps/suggestions_development.html src=page.title%}

