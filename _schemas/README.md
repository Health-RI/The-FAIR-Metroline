# Tool schema (draft)

- `tool.schema.yml`: JSON Schema for one entry in `_data/tools.yml`
- `examples.yml`: one converted entry per `tool_type`

Jekyll ignores this folder because its name starts with `_`.

## Principle: registries first, curate what only we know

| Kind of field | Who fills it | Fields |
|---|---|---|
| **Fetched** (local value overrides) | bio.tools → RSD → GitHub | name, description, homepage, repository, how to use, download, training, API, licence, cost, accessibility, maturity, interfaces, platforms, languages, publications, how to cite (`CITATION.cff`) |
| **Metrics** (never hand-typed) | Europe PMC / bio.tools, RSD, GitHub | citation count, RSD mentions, stars, contributors, latest release, last commit |
| **Derived** | the site itself | open source (from SPDX licence), Metroline steps (from `show-badges` / `show-tiles` usage), F/A/I/R letters (from principles) |
| **Curated here** | FAIR Metroline editors | tool type, FAIR support category, principles and contribution, life cycle, audience, data handling (personal data), inputs/outputs/standards, works with, alternatives, NL institutes and instances, gaps |

A tool with `identifiers.biotools` (or `identifiers.rsd`) needs only `id`, `tool_type` and
`fair` locally; the schema requires `name`, `short_description` and `links.homepage`
only when no registry ID is present.

**Fetch at build time**, not in the browser. Use a small script or a scheduled GitHub
Action that writes `_data/tools_enriched.json`. Today `getBiotoolsData.js` calls bio.tools
on every page view. That is fine for one API, but GitHub's unauthenticated limit
(60 requests/hour per visitor) rules out doing the same for stars and releases.

## What each surface shows

| | Badge popover | Catalogue card | Tool page |
|---|---|---|---|
| Logo, name, short description | ✓ | ✓ | header |
| Tool type | | icon | header |
| FAIR support category | ✓ | chip | header |
| F/A/I/R strip | ✓ | ✓ | with the contribution text |
| Licence / open source, cost | | icons | at-a-glance panel |
| Personal data suitability | | icon | at-a-glance panel |
| Metroline steps | | | "Where it fits" (with life cycle track) |
| Inputs → outputs, standards | | | chips |
| Works with / alternatives | | | tiles |
| How to use, download, training | | | "Get started" |
| How to cite | | | box with copy button |
| Adoption: institutes + metrics | | citation count | "Adoption" |
| Type-specific block | | | assessment: mode, time, result; registry: what it lists, curation; standard: body, status |
| Gaps / needs | | | only if non-empty |

## Mapping from the current `tools.yml`

| Current | New |
|---|---|
| `at_a_glance.Tool name` / `Short description` / `Purpose…` | `name` / `short_description` / `description` |
| `at_a_glance.Type` (free text) | `tool_type` + `executable.interfaces` |
| `FAIR support category` | `fair.support_category` |
| `Life cycle phases`, `Domains using it` | `lifecycle_phases`, `domains` (always a list) |
| `page_img` / `page_img_url` | `logo` |
| `biotools_id` | `identifiers.biotools` |
| `Website` | `links.homepage` (+ `links.instances` for hosted services) |
| `Manuals` / `Training` | `links.how_to_use` / `links.training` |
| `Metadata and data standards` | `executable.standards` / `inputs` / `outputs` |
| `Integrations with other tools` + `compatible_with` + `Supporting software` | `works_with` |
| `FAIR Metroline guidance step` | derived (`fair.metroline_steps` only as override) |
| `institutes` | `adoption.institutes` |
| `gaps_and_needs.Gaps` / `User needs` | `gaps_and_needs.gaps` / `user_needs` |
| `ELSI`, `Specific documentation`, `Other`, `Contact point` | dropped (`curation.contact` if needed) |
