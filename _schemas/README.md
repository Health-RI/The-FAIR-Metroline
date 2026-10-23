# Tool schema (draft)

- `tool.schema.yml`: JSON Schema for one tool entry
- Entries: `_data/tools_v2.yml`, rendered by `_layouts/tool_profile.html` (pages made by `_plugins/tool_page_generator.rb`)
- Vocabularies: `_data/tool_types.yml` (tool types), `_data/domains.yml` (domains), `_data/keywords.yml` (keywords)

Jekyll ignores this folder because its name starts with `_`.

## Verified and pending values

Every value in an entry of `_data/tools_v2.yml` is either verified or pending:

- **Verified** values sit at the top level of the entry. A reviewer checked them (green or yellow in the review
  sheet). The live site shows only these.
- **Pending** values sit under `pending:` with the same field names. Nobody has checked them yet, or they need
  a decision. The live site hides them, and every page section without verified content is hidden, so there
  are no gaps. To see them on a tool page, add `?unverified=1` to its URL: pending values then show with a
  dashed border. The choice is remembered while you browse other tool pages; `?unverified=0` turns it off.
  (The pending values are in the page HTML, hidden; anyone who knows the parameter can see them.)
- When a pending value is checked, move it to the top level.

| | Source | Fields |
|---|---|---|
| **Written by editors** | `tools_v2.yml` | name, short description, About text, tool types, FAIR tags, life cycle, domains, licence(s), cost, code availability, homepage (and whether it opens the tool), documentation, download, other links, logo, registry ids, keywords, institutes, related tools |
| **Fetched** at build time | bio.tools, GitHub | activity, metrics, citations, source code and issue tracker links; only once the registry ids are verified |
| **Derived** | the site | Metroline steps (from `show-badges` / `show-tiles` in step pages) and use cases (through those steps) |

When a field has more than one source, the page takes, in order: the verified value, the value fetched with
verified ids, the pending value, the value fetched with pending ids. Ids can be verified one at a time (for
example `biotools` verified, `github` still pending). A written licence, even `unconfirmed`, is never
replaced by a fetched one.

Each tool page is at `/<id>`. To change an id, list the old URL under `redirect_from` so links keep
working (Castor's page used to be `/castor-edc`). Templates find a tool's page with
`site.pages | where: "tool_id", id`; the old `_data/tools.yml` is gone.

## Homepage button

`links.homepage_opens_tool: true` when the homepage link opens the working tool itself: the page shows a filled
**Open the tool** button. With `false` the link goes to a page about the tool: an outlined **Visit website**
button. `hosted: true` adds "Online service, nothing to install".

## Tool type

Use the bio.tools `toolType` vocabulary. For tools in bio.tools the type is fetched, so set it only
when the record is empty or wrong (ROBOT's record has no type). bio.tools does not register three
kinds of resource that FAIR Metroline lists, so they get local types:

- **Self-assessment / checklist**: FAIR Aware, ARDC self-assessment, FAIR Data Maturity Model
- **Registry / catalogue**: FAIRassist, ERDRI.mdr
- **Standard / specification**: CSV on the Web

Hosted services such as Castor or SURF FileSender use bio.tools types (Web application); `cost` and
`hosted` say how you get access.

## FAIR tags

Letter level only: F, A, I, R, plus `planning` for FAIR assessment and planning resources. Per-principle
annotation (F1…R1.3) was too costly to keep up to date. The FAIR Implementation Profile ontology also
links principles to types of resource rather than individual tools.

## Domains

Seven domains in `_data/domains.yml`: Cross-domain, Clinical research, Patient registries & rare diseases,
Oncology, Medical imaging, Life sciences and Omics. A tool can have several; Cross-domain
is used on its own. They follow the communities this catalogue serves (and the domains in the old
tools list), not a general classification: an earlier draft used the NWO research fields
(https://www.nwo.nl/en/nwo-research-fields, 43 fields across all of science), which was far too broad.
Add a domain only when several tools or a use case need it (for example green sciences:
plant, food and environmental research). Bioinformatics is not a domain: it is a way of working
across domains; add it when analysis tools return to the catalogue.

## Why not use the bio.tools schema or CodeMeta as the whole schema

Both describe software only, and only 11 of the current 40 tools are in bio.tools. We reuse
bio.tools' vocabularies (tool type, cost, maturity) and store registry identifiers to
fetch from. If we want standards-based metadata later, the site can emit schema.org JSON-LD per
page from the tool type, with no extra work for editors.

## Keywords

Picked from `_data/keywords.yml`: concrete things a reader would search for, either a standard or format
(RDF, OWL, SHACL, CSV, ...; linked to its specification) or an artefact (ontology, codebook, eCRF). Generic
activities such as "validation" or "data capture" are left out; the tool type and FAIR tags cover those.
The shared list keeps spelling consistent and makes keywords usable for search later.

There is no separate standards section: the old tools list's "Metadata and data standards" mixed in platforms
such as ART-DECOR, and bio.tools is no help either (only 3 of our 11 bio.tools records list any
formats, and those are incomplete).
