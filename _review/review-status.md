# Tool review status

Imported on 2026-10-27 from the manual review (_review/tools4fair-annotation-form_new_v2.xlsx) into `_data/tools_v2.yml`. This page is written by
`_review/scripts/review_status.py`; run it again after each import.

- **Verified** (green or yellow in the sheet): the top level of each entry. This is all the live site shows.
- **Pending** (white: not checked yet; purple: still to decide): under `pending:` in each entry. Hidden on the
  live site; add `?unverified=1` to a tool page URL to see them with a dashed border (`?unverified=0` hides them).
  When a value is checked, mark it green or yellow in the sheet and import again.
- **Removed** (crossed out): fair-in-a-box, codebook-to-castor-limesurvey.
- **Not in the sheet**: related tools (the Related columns were removed) and institutes (Used by) are carried
  over from the current file and `tools_v2_before_import.yml`, unverified unless they already were.

## Decisions still open (purple or pink in the sheet)

| Tool | Field | Value in the sheet |
|---|---|---|
| MOLGENIS | Maturity | Mature |
| MOLGENIS | bio.tools id | molgenis |
| MOLGENIS | GitHub repo | molgenis/molgenis-emx2 |
| MOLGENIS | DOI | https://doi.org/10.1093/bioinformatics/btw155 |
| XNAT | Maturity | Mature |
| XNAT | bio.tools id | xnat |
| XNAT | GitHub repo | NrgXnat/xnat |
| XNAT | DOI | https://doi.org/10.1385/ni:5:1:11 |
| DMPonline | GitHub repo | DMPRoadmap/roadmap |
| FAIR Data Station | Maturity | Mature |
| FAIR Data Station | bio.tools id | fair_data_station |
| FAIR Data Station | RSD ID | fair-data-station |
| FAIR Data Station | DOI | https://doi.org/10.1101/2022.08.03.502622 |
| FAIRDOM-SEEK | Maturity | Mature |
| FAIRDOM-SEEK | bio.tools id | seek_for_science |
| FAIRDOM-SEEK | GitHub repo | seek4science/seek |
| FAIRDOM-SEEK | DOI | Wolstencroft K., Owen S., Du Preez F., et al. (2011) The SEEK: A platform for sharing data and models in syst… |
| FAIR Data Point | Maturity | Emerging |
| FAIR Data Point | bio.tools id | FAIRDataPoint |
| FAIR Data Point | GitHub repo | FAIRDataTeam/FAIRDataPoint |
| FAIR Data Point | DOI | Luiz Olavo Bonino da Silva Santos, Kees Burger, Rajaram Kaliyaperumal, Marek Suchánek, Jan Slifka, Mark Wilki… |
| OpenRefine | GitHub repo | OpenRefine/OpenRefine |
| OpenRefine | RSD ID | openrefine |
| CEDAR Workbench | Maturity | Mature |
| CEDAR Workbench | bio.tools id | cedar_workbench |
| CEDAR Workbench | GitHub repo | metadatacenter/cedar-template-editor |
| CEDAR Workbench | DOI | https://biokeanos.com/source/Center%20for%20Expanded%20Data%20Annotation%20and%20Retrieval%20Workbench |
| Blazegraph | GitHub repo | blazegraph/database |
| ARDC FAIR Data Self-Assessment Tool | GitHub repo | au-research/FAIR-Data-Assessment-Tool |
| FAIR Data Maturity Model (RDA) | DOI | 10.15497/rda00050 |
| FAIR-Checker | Maturity | Emerging |
| FAIR-Checker | bio.tools id | fair-checker |
| FAIR-Checker | GitHub repo | IFB-ElixirFr/FAIR-checker |
| FAIR-Checker | DOI | https://doi.org/10.1186/s13326-023-00289-5 |
| FAIR Evaluator | GitHub repo | FAIRMetrics/Metrics |
| FAIRassist | GitHub repo | FAIRsharing/FAIRassist-App |
| FAIR Aware | GitHub repo | FAIRsFAIR/fair-aware |
| CSV on the Web | GitHub repo | w3c/csvw |
| iCRF Generator | bio.tools id | icrf_generator |
| iCRF Generator | GitHub repo | aderidder/iCRFGenerator |
| iCRF Generator | DOI | https://doi.org/10.12688/f1000research.21576.1 |
| REDCap | Maturity | Mature |
| REDCap | bio.tools id | redcap |
| REDCap | DOI | Harvey L.A. (2018) REDCap: Web-based software for all types of data storage and collection editorial. Spinal … |
| Protégé | bio.tools id | protege |
| Protégé | GitHub repo | protegeproject/protege |
| Protégé | DOI | https://doi.org/10.1093/bioinformatics/btu256 |
| ROBOT | bio.tools id | robot |
| ROBOT | GitHub repo | ontodev/robot |
| ROBOT | DOI | Jackson R.C., Balhoff J.P., Douglass E., et al. (2019) ROBOT: A Tool for Automating Ontology Workflows. BMC B… |
| TopBraid SHACL API | GitHub repo | TopQuadrant/shacl |
| pySHACL | GitHub repo | RDFLib/pySHACL |
| sssom-py | GitHub repo | mapping-commons/sssom-py |
| Sparnatural | GitHub repo | sparna-git/Sparnatural |
| Wikidata Query Builder | GitHub repo | wikimedia/wikidata-query-builder |
| Yasgui | GitHub repo | rdfjs/Yasgui |
| Virtuoso SPARQL Query Editor | code_availability | Open source |
| Virtuoso SPARQL Query Editor | GitHub repo | openlink/virtuoso-opensource |

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
| name | 39 | 0 |
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
| links.homepage | 39 | 0 |
| links.homepage_opens_tool | 38 | 0 |
| links.docs | 31 | 0 |
| links.docs_note | 7 | 0 |
| links.download | 25 | 0 |
| links.other | 38 | 0 |
| logo | 38 | 0 |
| ids | 0 | 27 |
| how_to_cite | 0 | 5 |
| keywords | 34 | 0 |
| institutes | 0 | 6 |
| related | 0 | 37 |

## Per tool

| Tool | Verified | Pending |
|---|---|---|
| Castor EDC | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | institutes, related |
| myDRE | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo | related |
| MOLGENIS | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, institutes, related |
| XNAT | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, institutes, related |
| DMPonline | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | ids, institutes, related |
| LEAF | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | institutes, related |
| FAIR Data Station | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, institutes, related |
| FAIRDOM-SEEK | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, how_to_cite, related |
| FAIR Data Point | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, how_to_cite, related |
| Sextans-Suite | name, links.homepage, keywords |  |
| Ontotext Refine | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, keywords | related |
| OpenRefine | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| CEDAR Workbench | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, how_to_cite, related |
| GraphDB | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | related |
| Blazegraph | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, maturity, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| ARDC FAIR Data Self-Assessment Tool | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo | ids, related |
| FAIR Data Maturity Model (RDA) | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo | ids, related |
| FIP Wizard | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo, keywords | related |
| FAIR-Checker | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, related |
| FAIR Evaluator | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| FAIRassist | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs_note, links.other, logo, keywords | ids, related |
| FAIR Aware | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo | ids, related |
| ART-DECOR | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
| ERDRI.mdr | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
| CSV on the Web | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | ids |
| iCRF Generator | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, keywords | ids, related |
| REDCap | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | maturity, ids, how_to_cite, related |
| Protégé | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| ROBOT | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs_note, links.download, links.other, logo, keywords | ids, how_to_cite, related |
| TopBraid SHACL API | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| pySHACL | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| sssom-py | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| Sparnatural | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| Wikidata Query Builder | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | ids, related |
| Yasgui | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | ids, related |
| Virtuoso SPARQL Query Editor | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | code_availability, ids, related |
| SURFfilesender | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo | related |
| IBM Aspera | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, links.homepage, links.homepage_opens_tool, links.docs, links.download, links.other, logo, keywords | related |
| Globus | name, short_description, description, tool_type, fair, lifecycle, domains, license, cost, code_availability, hosted, links.homepage, links.homepage_opens_tool, links.docs, links.other, logo, keywords | related |
