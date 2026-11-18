# Tool review status

Imported on 2026-11-18 from the manual review (_review/tools4fair-annotation-form_new_v3.xlsx) into `_data/tools_v2.yml`. This page is written by
`_review/scripts/review_status.py`; run it again after each import.

- **Verified** (green or yellow in the sheet): the top level of each entry. This is all the live site shows.
- **Pending** (white: not checked yet; purple: still to decide): under `pending:` in each entry. Hidden on the
  live site; add `?unverified=1` to a tool page URL to see them with a dashed border (`?unverified=0` hides them).
  When a value is checked, mark it green or yellow in the sheet and import again.
- **Removed** (crossed out): fair-in-a-box, Sextans-Suite, codebook-to-castor-limesurvey.
- **Left out by the editors** for now: none.
- **Not in the sheet**: related tools (the Related columns were removed) and institutes (Used by) are carried
  over from the current file and `tools_v2_before_import.yml`, unverified unless they already were.

## Decisions still open (purple or pink in the sheet)

| Tool | Field | Value in the sheet |
|---|---|---|
| MOLGENIS | Maturity | Mature |
| XNAT | Maturity | Mature |
| FAIR Data Station | Maturity | Mature |
| FAIRDOM-SEEK | Maturity | Mature |
| FAIR Data Point | Maturity | Emerging |
| OpenRefine | Homepage opens the tool | yes |
| CEDAR Workbench | Maturity | Mature |
| FAIR-Checker | Maturity | Emerging |
| REDCap | Maturity | Mature |
| Protégé | Download | https://protegewiki.stanford.edu/wiki/WebProtege |
| Virtuoso SPARQL Query Editor | code_availability | Open source |

## Changed by the editors after the review

Set in `import_review.py`, so a new import keeps them; update the sheet to match.

| Tool | Field | Value in the sheet | Used instead |
|---|---|---|---|
| OpenRefine | links.homepage_opens_tool | yes | no |
| OpenRefine | tool_type | Desktop application; Plug-in; Web application; Web API; Web service; … | Desktop application |
| OpenRefine | short_description | Desktop tool to clean messy tables, match values to external identifi… | Desktop tool, used in your browser, to clean messy tables, match valu… |
| OpenRefine | keywords | SPARQL; RDF | CSV; RDF |
| Protégé | links.download | (none) | https://protege.stanford.edu/software/#desktop-protege |
| Protégé | links.other | Report an issue — https://github.com/protegeproject/protege/issues; L… | Report an issue — https://github.com/protegeproject/protege/issues |
| TopBraid SHACL API | logo | https://github.com/TopQuadrant.png?size=200 | https://media.licdn.com/dms/image/v2/C4E0BAQGZbqII1tkEEQ/company-logo… |
| Yasgui | logo | https://avatars.githubusercontent.com/u/6156399?s=60&v=1024 | https://avatars.githubusercontent.com/u/7573184?v=4 |

## Reviewer notes turned into structured values

| Tool | Column | Note | Became |
|---|---|---|---|
| Castor EDC | Download | SaaS (servers van de leverancier) | hosted: true |
| myDRE | Download | SaaS | hosted: true |
| DMPonline | Download | SaaS | hosted: true |
| Ontotext Refine | Documentation | Platform-documentatie download underneath left in page bottom | Download it at the bottom of the product page |
| ARDC FAIR Data Self-Assessment Tool | Documentation | platform website | On the website |
| FAIR Data Maturity Model (RDA) | Documentation | platform website | On the website |
| FAIR Data Maturity Model (RDA) | Download | nvt | not applicable: no download |
| FIP Wizard | Documentation | built in | Built into the tool |
| FIP Wizard | Download | SaaS | hosted: true |
| FAIR-Checker | Documentation | https://fair-checker.france-bioinformatique.fr/docs/index.html (curre… | https://fair-checker.france-bioinformatique.fr/docs/index.h… |
| FAIRassist | Documentation | platform website | On the website |
| FAIRassist | Download | SaaS | hosted: true |
| FAIR Aware | Download | SaaS | hosted: true |
| ART-DECOR | Download | Saas | hosted: true |
| ERDRI.mdr | Download | SaaS | hosted: true |
| CSV on the Web | Download | nvt | not applicable: no download |
| iCRF Generator | Documentation | website and github documentation | On the website and in the GitHub repository |
| ROBOT | Documentation | platform website | On the website |
| TopBraid SHACL API | Documentation | github readme | https://github.com/TopQuadrant/shacl#readme |
| TopBraid SHACL API | Download | GitHub Releases | GitHub releases |
| pySHACL | Documentation | github readme | https://github.com/RDFLib/pySHACL#readme |
| Wikidata Query Builder | Download | SaaS/webtool | hosted: true |
| SURFfilesender | Download | SaaS | hosted: true |
| Globus | Download | SaaS | hosted: true |

Mapping rules: `SaaS` → `hosted: true` ("Online service"); `nvt` → no download link;
`platform website` → `docs_note: On the website`; `github readme` → the README of the GitHub homepage;
a URL followed by a remark in brackets → the URL; keyword `unknown` → no keyword.

## Verified for how many tools

| Field | Verified | Pending |
|---|---|---|
| name | 38 | 0 |
| short_description | 38 | 0 |
| description | 38 | 0 |
| tool_type | 38 | 0 |
| fair | 38 | 0 |
| lifecycle | 38 | 0 |
| domains | 38 | 0 |
| license | 38 | 0 |
| cost | 38 | 0 |
| code_availability | 37 | 1 |
| maturity | 1 | 8 |
| hosted | 11 | 0 |
| links.homepage | 38 | 0 |
| links.homepage_opens_tool | 38 | 0 |
| links.docs | 31 | 0 |
| links.docs_note | 7 | 0 |
| links.download | 25 | 0 |
| links.other | 38 | 0 |
| logo | 38 | 0 |
| ids | 29 | 1 |
| keywords | 33 | 0 |
| institutes | 0 | 6 |
| related | 0 | 37 |

## Per tool

| Tool | Verified | Pending |
|---|---|---|
| Castor EDC | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | institutes, related |
| myDRE | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo | related |
| MOLGENIS | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, institutes, related |
| XNAT | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, institutes, related |
| DMPonline | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, ids, keywords | institutes, related |
| LEAF | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | institutes, related |
| FAIR Data Station | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, institutes, related |
| FAIRDOM-SEEK | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, related |
| FAIR Data Point | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, related |
| Ontotext Refine | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, keywords | related |
| OpenRefine | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| CEDAR Workbench | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, ids, related |
| GraphDB | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | related |
| Blazegraph | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, maturity, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| ARDC FAIR Data Self-Assessment Tool | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, ids | related |
| FAIR Data Maturity Model (RDA) | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo, ids | related |
| FIP Wizard | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo, ids, keywords | related |
| FAIR-Checker | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, related |
| FAIR Evaluator | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| FAIRassist | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo, ids, keywords | related |
| FAIR Aware | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, ids | related |
| ART-DECOR | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
| ERDRI.mdr | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
| CSV on the Web | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, ids, keywords |  |
| iCRF Generator | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, ids, keywords | related |
| REDCap | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | maturity, related |
| Protégé | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| ROBOT | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, ids, keywords | related |
| TopBraid SHACL API | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| pySHACL | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| sssom-py | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| Sparnatural | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| Wikidata Query Builder | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, ids, keywords | related |
| Yasgui | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | related |
| Virtuoso SPARQL Query Editor | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, ids, keywords | code_availability, related |
| SURFfilesender | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo | related |
| IBM Aspera | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | related |
| Globus | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
