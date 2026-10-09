# Tool schema (draft)

- `tool.schema.yml`: JSON Schema for one tool entry
- Demo entries: `_data/tools_v2.yml`, rendered by `_layouts/tool_profile.html`
- Vocabularies: `_data/tool_types.yml` (tool types), `_data/research_fields.yml` (domains), `_data/keywords.yml` (keywords)

Jekyll ignores this folder because its name starts with `_`.

## Where each piece of information comes from

| | Source | Fields |
|---|---|---|
| **Curated** | editors, in `tools_v2.yml` | name, short description, FAIR tags, domains, keywords, homepage, registry ids; optional: tool type, cost/access, institutes, related |
| **Fetched** at build time | bio.tools, GitHub | tool type, licence, cost, access, maturity, activity, how to cite, citations, stars, latest release, source code, issue tracker, download |
| **Reused** | the tool's entry in `_data/tools.yml` | About text, life cycle phases, documentation, training, templates |
| **Derived** | the site | Metroline steps (from `show-badges` / `show-tiles` in step pages); scenarios (tool scenarios by `tool_ids`, guideline scenarios through the tool's steps) |

A local value always wins. Every page section is hidden when it has no content.

## Tool type

Use the bio.tools `toolType` vocabulary. For tools in bio.tools the type is fetched, so set it only
when the record is empty or wrong (ROBOT's record has no type). bio.tools does not register three
kinds of resource that FAIR Metroline lists, so they get local types:

- **Self-assessment / checklist**: FAIR Aware, ARDC self-assessment, FAIR Data Maturity Model
- **Registry / catalogue**: FAIRassist, ERDRI.mdr
- **Standard / specification**: CSV on the Web

Hosted services such as Castor or SURF FileSender use bio.tools types (Web application); the
`cost` and `access` fields say how you get access.

## FAIR tags

Letter level only: F, A, I, R, plus `planning` for FAIR assessment and planning resources. Per-principle
annotation (F1…R1.3) was too costly to keep up to date. The FAIR Implementation Profile ontology also
links principles to types of resource rather than individual tools.

## Domains

The second level of the NWO research fields (https://www.nwo.nl/en/nwo-research-fields, in use from
1 July 2026). Its six top-level groups match the OECD Fields of Science, so the list is not
NWO-specific. Mapping of the values in today's `tools.yml`:

| Current | NWO research field |
|---|---|
| Life sciences, Systems biology, Microbial research | Biological sciences |
| Health | Health sciences |
| Clinical research, Oncology, Rare diseases | Clinical medicine |
| Industrial biotechnology | Industrial biotechnology |
| Cross-domain | Cross-domain (our addition) |

Oncology and rare diseases become too coarse in this list. If those communities matter for
filtering, keep them as a separate optional `communities` tag.

## Why not use the bio.tools schema or CodeMeta as the whole schema

Both describe software only, and only 11 of the current 40 tools are in bio.tools. We reuse
bio.tools' vocabularies (tool type, cost, access, maturity) and store registry identifiers to
fetch from. If we want standards-based metadata later, the site can emit schema.org JSON-LD per
page from the tool type, with no extra work for editors.

## Keywords

Picked from `_data/keywords.yml`: concrete things a reader would search for, either a standard or format
(RDF, OWL, SHACL, CSV, ...; linked to its specification) or an artefact (ontology, codebook, eCRF). Generic
activities such as "validation" or "data capture" are left out; the tool type and FAIR tags cover those.
The shared list keeps spelling consistent and makes keywords usable for search later.

There is no separate standards section: `tools.yml` "Metadata and data standards" mixes in platforms
such as ART-DECOR, and bio.tools is no help either (only 3 of our 11 bio.tools records list any
formats, and those are incomplete).
