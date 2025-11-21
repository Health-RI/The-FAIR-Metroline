---
title: cBioPortal
toc: true
type: tool
page_img: toolassemblies/tools/cbioportal.png
domain: [Oncology]
phase: [Process, Analyse, Share]
---

[//]: # (Website links)

{% assign website_links = '{::nomarkdown}
<ul>
    <li>
        <a href="https://www.cbioportal.org">Website</a>
    </li>
    <li>
        <a href="https://www.healthdata.nl/en/services/health-ri-cbioportal">Health-RI Service</a>
    </li>
    <li>
        <a href="https://cbioportal.health-ri.nl/">Health-RI hosted instance</a>
</li>
</ul>
{:/}' | strip_newlines%}

[//]: # (// Resource URLs)

{% assign resources = '{::nomarkdown}
<ul>
    <li>
        Manual:
        <ul><li><a href="https://docs.cbioportal.org/user-guide/">User guide</a></li></ul>
    </li>
    <li>
        Metadata and data standards:
        <ul><li><a href="https://docs.cbioportal.org/supported-data-types/">Supported data types</a></li></ul>
    </li>
    <li>
        Supporting assets:
        <ul><li><a href="https://docs.cbioportal.org/supported-data-types/">GENIE data</a>: Large multi-institutional cancer dataset compatible with cBioPortal</li></ul>
    </li>
    <li>
        Specific documentation:
        <ul><li><a href="https://docs.cbioportal.org/">Documentation</a> includes development, deployment and usage documentation</li></ul>
    </li>
    <li>
        Support:
        <ul><li><a href="https://www.health-ri.nl/en/health-ri-service-desk/">Health-RI support</a>: First-line and second-line support for Dutch users</li></ul>
    </li>
</ul>
{:/}' | strip_newlines%}

[//]: # (// Integraitons)

{% assign integrations = '{::nomarkdown}
<ul>
    <li>
        <a href="' | append: site.baseurl | append: '/slidescore">Slide Score</a>: Enables slide viewer embedding within cBioPortal interface as described <a href="https://www.slidescore.com/news/a/031_cbioportal">here</a>
    </li>
    <li>
        <a href="' | append: site.baseurl | append: '/xnat">XNAT</a> using <a href="https://gitlab.com/radiology/infrastructure/utils/xnat2cbio">xnat2cbio</a> and following the <a href="https://zenodo.org/records/14900295">EOSC4Cancer manual</a>
    </li>
    <li>
        xOpat following the <a href="https://zenodo.org/records/14900295">EOSC4Cancer manual</a>
    </li>
    <li>
        cBioPortal can easily link to other tools, although the tools must support the appropriate security measures. 
    </li>
</ul>
{:/}' | strip_newlines%}

## At a glance

| Field | Details                                                                                                                                                                                                                                          |
|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Tool name** | cBioPortal                                                                                                                                                                                                                                       |
| **Purpose and core functionality** | cBioPortal simplifies access to complex cancer genomic data through visualisation and intuitive exploration. It enables researchers and clinicians to interpret multimodal datasets, extract biological insights and support clinical decisions. |
| **Type** | Analysis                                                                                                                                                                                                                                         |
| **Life cycle phases** | Process, analyse, Share                                                                                                                                                                                                                          |
| **Domains using it** | Oncology                                                                                                                                                                                                                                         |
| **Website** | {{ website_links }}                                                                                                                                                                                                                              |   
| **Resource URLs** | {{ resources }}                                                                                                                                                                                                                                  |  
| **Integrations with other tools** | {{ integrations }}                                                                                                                                                                                                                          |
                                                                                                                                                                                                                                                               
## Known gaps or user needs

| Type | Description                                                                                                                                | URL                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                         
|------|------------|--------------------------------------------------------------------------------------------------------|
| Gap  | Clinical data harmonisation guidance: Researchers need support aligning clinical data elements to make them compatible with other datasets. |
| Gap  | Low awareness of cBioPortal. |


## Compatible with

{% include toolassemblies/show-tiles.html ids="slide-score, xnat" %}