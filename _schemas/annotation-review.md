# Tool annotation: points to review

All 40 tools in `_data/tools_v2.yml` follow the schema in this folder. The five demo tools (ROBOT, Castor
EDC, FAIRassist, FAIR Aware, CSV on the Web) were reviewed earlier. The other 35 were annotated on
2026-10-09 by agents, checked by an independent verifier and harmonised in one consistency pass; every
registry ID, GitHub repository and homepage was checked live. This list, checked against the final
`tools_v2.yml`, keeps only the decisions left for the maintainer.

## Most important

1. **Codebook to Castor/LimeSurvey:** confirm what the tool is (script, Excel template or guide) and
   whether it costs anything; the homepage is a login-only Amsterdam UMC article, so tool type and cost
   are empty (the public Amsterdam UMC RDM procedures page could serve as homepage instead).
2. **FAIR-in-a-box:** decide whether to keep this deprecated entry or replace it with the Sextans Suite;
   the page now shows "Deprecated: no longer maintained", but MOLGENIS, FAIR Data Point and OpenRefine
   still list it as related.
3. **Blazegraph and Ontotext Refine:** decide whether to keep them or point readers to maintained
   alternatives; Blazegraph's repository is archived (the page says so), and Ontotext Refine has had no
   update since June 2023 and is gone from the vendor's product pages (the page does not say so).
4. **FIP links in the guidance:** check the example FIP links in `creating_a_fair_implementation_profile.md`
   (line 53) and `register_resource_level_metadata.md` (line 155) on fip-wizard.ds-wizard.org; the host
   answers 200, but it is a single-page app, so whether the projects still exist could not be checked.
5. **Institutes:** supply the institutes only you know; now none are listed for myDRE (its text says all
   Dutch UMCs use it), iCRF Generator and Codebook to Castor/LimeSurvey (both from Amsterdam UMC), REDCap
   and SURFfilesender.

## Fixed after the review

- **Licences:** `license` is now set locally where the fetched value was wrong or missing: REDCap
  Proprietary (no longer shown as open source), CEDAR Workbench and Protégé BSD-2-Clause, Virtuoso
  GPL-2.0-only. Licence values such as "Other" or "Not licensed" no longer count as open source.
- **Deprecated tools:** new optional `deprecated: true`; the page shows a warning instead of activity.
  Used for FAIR-in-a-box.
- **Activity** is shown only for software, so the archived W3C repository no longer marks CSV on the Web
  as "Archived", and questionnaire repositories say nothing about the questionnaire.
- **Broken documentation links:** when an entry sets `links.docs`, the manual links from tools.yml are no
  longer shown. This removes the 404 links for CEDAR Workbench; YASGUI now links to its README
  (docs.triply.cc/yasgui is gone).

## Rules applied across all tools

- **FAIR tags:** triplestores and SPARQL endpoints (GraphDB, Blazegraph) are A + I; query front ends
  (Sparnatural, Wikidata Query Builder, YASGUI, Virtuoso) are I; transfer services and myDRE are A; DMP,
  assessment and FIP tools are *FAIR assessment & planning* only.
- **Tool type** is left out where bio.tools has a correct value (it is fetched): MOLGENIS, XNAT, FAIR Data
  Station, FAIRDOM-SEEK, FAIR Data Point, FAIR-Checker, REDCap, Protégé. Where bio.tools is wrong, it is
  set locally with a comment (CEDAR Workbench, iCRF Generator).
- **Access:** as in biotoolsSchema, Open access includes services that only need a free account
  (DMPonline, FIP Wizard, CEDAR Workbench); "(with restrictions)" means limits on use.
- **About text** was rewritten only where the old text was wrong or read like marketing: myDRE, MOLGENIS,
  DMPonline, LEAF, FAIR Data Station, FAIR-in-a-box, ERDRI.mdr, iCRF Generator. sssom-py has a new one
  because it was renamed from SSSOM Toolkit.
- **Life cycle** was corrected to Process for OpenRefine and Ontotext Refine, and to Collect for iCRF
  Generator and Codebook to Castor/LimeSurvey.
- **Fetched, overridden only when wrong:** licence (four overrides, see above) and maturity. About text,
  life cycle, institutes and manual links not given in `tools_v2.yml` are reused from tools.yml;
  institutes were copied, never added.
- **New keywords (10):** DICOM, FHIR, CDISC ODM, CARE-SM, ISA, SSSOM, Bioschemas, nanopublication, RDA
  DMP Common Standard, MQTT. All are in `_data/keywords.yml` and the schema, with working specification links.

## Across several tools

- Decide whether to drop Preserve from the life cycle reused from tools.yml for FAIR Data Station,
  FAIR-in-a-box, GraphDB and CEDAR Workbench, as none of them is an archive (now: Preserve included).
- Decide whether to keep Industrial biotechnology for FAIR Data Station and FAIRDOM-SEEK, which comes from
  the IBISBA/WUR scenario while their core scope is biology (now: [Biological sciences, Industrial biotechnology]).
- Decide whether to write an About text for FAIRDOM-SEEK, SURFfilesender and IBM Aspera, whose reused
  tools.yml text refers to "this scenario" or to the FAIR Metroline itself (now: tools.yml text).

## Per tool

Tools covered above are not repeated here.

**myDRE** (`mydre`)
- Decide whether cost should be Institutional licence, as researchers usually get access through their organisation's subscription (now: Commercial, as for Castor EDC).
- Decide whether domains should be Clinical medicine and Health sciences, as most users are UMCs, although the vendor and the NWO LSRI listing present it as open to all disciplines (now: Cross-domain).

**XNAT** (`xnat`)
- Confirm Basic medicine in domains, added for XNAT's large neuroimaging user base (now: [Clinical medicine, Basic medicine]).

**DMPonline** (`dmponline`)
- Confirm that the listed institutes subscribe to DMPonline, as the About text says "several Dutch universities and UMCs" on the basis of this list (now: eight institutes copied from tools.yml).
- Decide whether to keep the GitHub id, as the fetched licence and activity describe the shared DMPRoadmap code (also behind DMPTool), not the service (now: DMPRoadmap/roadmap).

**LEAF** (`leaf`)
- Confirm the FAIR letters; I is not claimed because the output (InfluxDB line protocol) follows no semantic standard (now: [R]).

**FAIR Data Point** (`fair-data-point`)
- Decide whether to add I, as the metadata is DCAT-based RDF checked with SHACL shapes (now: [F, A]).

**Ontotext Refine** (`ontotext-refine`)
- Decide whether access should be Open access (with restrictions), as the native installers need a request form while the Docker image is free to pull (now: Open access).

**FIP Wizard** (`fip-wizard`)
- Confirm cost, as no pricing or statement of free use was found (now: Free of charge).

**FAIR Evaluator** (`fair-evaluator`)
- Decide whether to point readers to FAIR Champion (w3id.org/FAIR-Champion), described as its successor, as the Gen2 maturity indicators it runs are marked deprecated and the reused tools.yml manual link points to that folder (now: no mention).
- Decide which repository to use as GitHub id, as FAIRMetrics/Metrics mostly holds metric definitions while the front-end repository was last changed in November 2022 (now: FAIRMetrics/Metrics, so the page shows "Active").

**ART-DECOR** (`art-decor`)
- Confirm cost, as nothing was found on whether hosting a project on art-decor.org is free (now: Free of charge).

**ERDRI.mdr** (`erdri-mdr`)
- Confirm I, which rests on the JRC's stated purpose (shared data element definitions); whether elements carry terminology codes was not checked (now: [F, I]).

**Protégé** (`protege`)
- Decide whether the entry covers WebProtégé as well as the desktop app, as bio.tools gives both types but the GitHub id is the desktop repository (now: [Web application, Desktop application], fetched).

**sssom-py** (`sssom-toolkit`)
- Decide on the display name; "SSSOM toolkit (sssom-py)" would be more descriptive and would make the description override unnecessary (now: sssom-py, the project's own name).

**Wikidata Query Builder** (`wikidata-query-builder`)
- Decide whether to keep the GitHub mirror, as its last commit (March 2025) makes the page show "No recent activity" while Wikimedia still runs the service; without it, set cost and access by hand (now: wikimedia/wikidata-query-builder).

**YASGUI** (`yasgui`)
- Confirm rdfjs/Yasgui as the repository: it is the active fork since TriplyDB/Yasgui was archived in April 2026, but no one has named it the successor, and yasgui.triply.cc still runs the archived code (now: rdfjs/Yasgui).

**Virtuoso SPARQL Query Editor** (`virtuoso-query-editor`)
- Decide whether to recast the entry as OpenLink Virtuoso, the triple store, as its GitHub id is the repository of the whole server (now: the query editor, matching the query_over_resources step).

**SURFfilesender** (`surf-filesender`)
- Decide whether the short description should say that encrypted transfers are limited to 2 GB per file, as 1 TB applies only to unencrypted transfers (now: "sending large files (up to 1 TB) securely").
- Confirm cost, as the FAQ says only institutions with a SURFfilesender licence can use it, so Institutional licence would be more precise (now: Free of charge (with restrictions), following your rule for this service).

**IBM Aspera** (`aspera`)
- Confirm that cost and access describe the free clients rather than the paid server products, which would be Commercial and Restricted access (now: Free of charge (with restrictions), Open access (with restrictions)).
- Decide whether to replace "Aspera Connect" in tools.yml and on the step page, as IBM Aspera Client is replacing it; the reused manual link could not be checked because IBM blocks scripted requests (now: Aspera Connect).

**Globus** (`globus`)
- Decide whether the short description should say that sharing with collaborators needs a subscription, as only basic transfer is free for non-profits (now: "moves and shares large research files").
