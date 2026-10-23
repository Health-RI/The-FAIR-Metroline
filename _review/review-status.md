# Tool review status

Imported on 2026-10-22 from `_review/tools4fair-annotation-form_new_v1.xlsx` into `_data/tools_v2.yml`.

- **Verified** (green or yellow in the sheet): the top level of each entry. This is all the live site shows.
- **Pending** (white: not checked yet; purple: still to decide): under `pending:` in each entry. Hidden on the
  live site; add `?unverified=1` to a tool page URL to see them with a dashed border (`?unverified=0` hides them).
  When a value is checked, move it from `pending:` to the top level.
- **Removed** (crossed out): FAIR-in-a-box and Codebook to Castor/LimeSurvey. Their guidance-page badges were
  removed; FAIR-in-a-Box mentions now link to its GitHub repository.
- **Added**: Sextans-Suite (id `sextans-suite`), with only its name and homepage verified so far.

## Decisions still open (purple or pink in the sheet)

| Tool | Field | Value in the sheet |
|---|---|---|
| Castor EDC | About text | Castor EDC is a cloud-based electronic data capture system designed to simplify clinical data collection and e… |
| myDRE | Short description | Secure cloud workspaces where project teams store and analyse sensitive data, with approved and logged upload … |
| myDRE | About text | myDRE is a Trusted Processing Environment run by anDREa B.V. on Microsoft Azure. An organisation takes a subsc… |
| Ontotext Refine | Logo | https://www.google.com/s2/favicons?domain=ontotext.com&sz=128 |
| OpenRefine | Homepage opens the tool | yes |
| CEDAR Workbench | Download | (1) https://metadatacenter.readthedocs.io/en/latest/install-overview/ vs (2) https://github.com/metadatacenter… |
| CEDAR Workbench | Logo | https://www.google.com/s2/favicons?domain=metadatacenter.org&sz=128 |
| GraphDB | Logo | https://www.google.com/s2/favicons?domain=graphdb.ontotext.com&sz=128 |
| ARDC FAIR Data Self-Assessment Tool | Logo | https://www.google.com/s2/favicons?domain=ardc.edu.au&sz=128 |
| FAIR Data Maturity Model | Short description | RDA recommendation with 41 indicators, priorities and scoring levels to judge how FAIR your (meta)data are, pl… |
| FAIR Data Maturity Model | Logo | https://www.google.com/s2/favicons?domain=zenodo.org&sz=128 |
| FAIR-Checker | Documentation | https://fair-checker.france-bioinformatique.fr/docs/index.html |
| FAIR-Checker | Logo | https://www.google.com/s2/favicons?domain=fair-checker.france-bioinformatique.fr&sz=128 |
| ART-DECOR | license | GPL-3.0-only |
| ART-DECOR | license | LGPL-2.1-only |
| CSV on the Web | license | W3C Document License |
| iCRF Generator | About text | The iCRF Generator is an open-source Java desktop application, developed at Amsterdam UMC, with a wizard in wh… |
| sssom-py | Logo | https://github.com/mapping-commons.png?size=200 |
| Sparnatural | Logo | https://www.google.com/s2/favicons?domain=sparnatural.eu&sz=128 |
| Yasgui | Documentation | https://docs.triply.cc/yasgui/ |
| Yasgui | Logo | https://avatars.githubusercontent.com/u/52077849 |
| Virtuoso SPARQL Query Editor | Cost | Free and paid |
| Virtuoso SPARQL Query Editor | Download | 1: https://vos.openlinksw.com/owiki/wiki/VOS/VOSSparqlProtocol, or 2: https://vos.openlinksw.com/owiki/wiki/VO… |
| IBM Aspera | Logo | https://www.google.com/s2/favicons?domain=ibm.com&sz=128 |
| Globus | Logo | https://www.google.com/s2/favicons?domain=globus.org&sz=128 |

## Reviewer notes turned into structured values

Cells in Documentation and Download that held a note instead of a URL:

| Tool | Column | Note | Became |
|---|---|---|---|
| Castor EDC | Download | SaaS (servers van de leverancier) | hosted: true |
| myDRE | Download | SaaS | hosted: true |
| DMPonline | Download | SaaS | hosted: true |
| Ontotext Refine | Documentation | Platform-documentatie download underneath left in page bottom | Download it at the bottom of the product page |
| ARDC FAIR Data Self-Assessment Tool | Documentation | platform website | On the website |
| ARDC FAIR Data Self-Assessment Tool | Download | nvt: https://fairdata.ardc.edu.au/ | not applicable: no download |
| FAIR Data Maturity Model | Documentation | platform website | On the website |
| FAIR Data Maturity Model | Download | nvt | not applicable: no download |
| FIP Wizard | Documentation | built in | Built into the tool |
| FIP Wizard | Download | SaaS | hosted: true |
| FAIRassist | Documentation | platform website | On the website |
| FAIRassist | Download | SaaS | hosted: true |
| FAIR Aware | Download | SaaS | hosted: true |
| ART-DECOR | Download | Saas | hosted: true |
| ERDRI.mdr | Download | SaaS | hosted: true |
| CSV on the Web | Download | nvt | not applicable: no download |
| iCRF Generator | Documentation | website and github documentation | On the website and in the GitHub repository |
| REDCap | Download | via license: https://projectredcap.org/join/, server: https://projectr | Request a licence, Server requirements |
| Protégé | Download | web version: https://protegewiki.stanford.edu/wiki/WebProtege, downloa | WebProtégé (online), Desktop version, Desktop releases on GitHub |
| ROBOT | Documentation | platform website | On the website |
| TopBraid SHACL API | Documentation | github readme | https://github.com/TopQuadrant/shacl#readme |
| TopBraid SHACL API | Download | GitHub Releases | GitHub releases |
| pySHACL | Documentation | github readme | https://github.com/RDFLib/pySHACL#readme |
| Wikidata Query Builder | Download | SaaS/webtool | hosted: true |
| SURFfilesender | Download | SaaS | hosted: true |
| Globus | Download | SaaS for users, for admin and developers: https://docs.globus.org/gett | Set-up for admins and developers |

Mapping rules: `SaaS` → `hosted: true` ("Online service"); `nvt` → no download link;
`platform website` → `docs_note: On the website`; `github readme` → the README of the GitHub homepage;
several labelled URLs → a labelled download list.

## Not verified for any tool yet (columns left white)

FAIR tags, life cycle, code availability, maturity, other links, registry ids (and with them all data
fetched from bio.tools/GitHub: activity, metrics, citations), keywords, related tools. Used by (institutes)
was not in this review round. All of these are in `pending:` and will appear on the live site once checked.

## Per tool: verified fields

| Tool | Verified | Pending |
|---|---|---|
| Castor EDC | short_description, tool_type, domains, license, cost, links, logo | description, fair, lifecycle, code_availability, links, keywords, related |
| myDRE | tool_type, domains, license, cost, links, logo | short_description, description, fair, lifecycle, code_availability, links, related |
| MOLGENIS | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, maturity, links, keywords, ids, related |
| XNAT | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, maturity, links, keywords, ids, related |
| DMPonline | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| LEAF | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, related |
| FAIR Data Station | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, maturity, links, keywords, ids, related |
| FAIRDOM-SEEK | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, maturity, links, keywords, ids, how_to_cite, related |
| FAIR Data Point | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, maturity, links, logo, keywords, ids, how_to_cite, related |
| Sextans-Suite | links |  |
| Ontotext Refine | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, logo, keywords, related |
| OpenRefine | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| CEDAR Workbench | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, maturity, links, logo, keywords, ids, how_to_cite, related |
| GraphDB | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, logo, keywords, related |
| Blazegraph | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| ARDC FAIR Data Self-Assessment Tool | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, links, logo, ids, related |
| FAIR Data Maturity Model | description, tool_type, domains, license, cost, links | short_description, fair, lifecycle, code_availability, links, logo, ids, related |
| FIP Wizard | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, related |
| FAIR-Checker | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, maturity, links, logo, keywords, ids, related |
| FAIR Evaluator | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, ids, related |
| FAIRassist | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, ids, related |
| FAIR Aware | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, ids, related |
| ART-DECOR | short_description, description, tool_type, domains, cost, links, logo | fair, lifecycle, license, keywords, related |
| ERDRI.mdr | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, keywords, related |
| CSV on the Web | short_description, description, tool_type, domains, cost, links, logo | fair, lifecycle, license, code_availability, links, keywords, ids |
| iCRF Generator | short_description, tool_type, domains, license, cost, links, logo | description, fair, lifecycle, code_availability, links, keywords, ids, related |
| REDCap | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, maturity, links, logo, keywords, ids, how_to_cite, related |
| Protégé | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| ROBOT | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, how_to_cite, related |
| TopBraid SHACL API | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| pySHACL | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| sssom-py | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, links, logo, keywords, ids, related |
| Sparnatural | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, links, logo, keywords, ids, related |
| Wikidata Query Builder | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, links, keywords, ids, related |
| Yasgui | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, code_availability, links, logo, keywords, ids, related |
| Virtuoso SPARQL Query Editor | short_description, description, tool_type, domains, license, links, logo | fair, lifecycle, cost, code_availability, links, keywords, ids, related |
| SURFfilesender | short_description, description, tool_type, domains, license, cost, links, logo | fair, lifecycle, code_availability, related |
| IBM Aspera | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, links, logo, related |
| Globus | short_description, description, tool_type, domains, license, cost, links | fair, lifecycle, logo, related |
