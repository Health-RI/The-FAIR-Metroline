---
title: XNAT
toc: true
type: tool
page_img: toolassemblies/tools/xnat.png
domain: [Oncology]
phase: [Process, Analyse, Preserve, Share, Reuse]
---

[//]: # (Website links)

{% assign website_links = '{::nomarkdown}
<ul>
    <li>
        <a href="https://www.xnat.org/">Website</a>
    </li>
    <li>
        <a href="https://www.healthdata.nl/en/services/health-ri-xnat-medical-imaging-service">Health-RI Service</a>
    </li>
    <li>
        <a href="https://xnat.health-ri.nl/">Health-RI server</a>
</li>
</ul>
{:/}' | strip_newlines%}

[//]: # (// Resource URLs)

{% assign resources = '{::nomarkdown}
<ul>
    <li>
        Training:
        <ul><li><a href="https://www.xnat.org/about/xnat-academy.php/">XNAT Academy</a>: E-learning platform with tutorials and courses</li></ul>
    </li>
    <li>
        Manual:
        <ul><li><a href="https://wiki.xnat.org/documentation/how-to-use-xnat">User documentation</a></li></ul>
    </li>
    <li>
        Metadata and data standards:
        <ul><li><a href="https://wiki.xnat.org/documentation/managing-data-types-in-xnat">XNAT Data types</a></li></ul>
    </li>
    <li>
        Supporting assets:
        <ul><li><a href="https://www.rsna.org/research/imaging-research-tools">Clinical Trials Processor</a>: Used for anonymisation of images</li></ul>
        <ul><li><a href="https://github.com/Health-RI/img2catalog">img2catalog</a>: Export the metadata of datasets containing images to FAIR Data Point.</li></ul>
    </li>
    <li>
        Support:
        <ul><li><a href="https://www.health-ri.nl/en/health-ri-service-desk">Health-RI support</a>: Service desk for users in the Health-RI hosted environment</li></ul>
    </li>
</ul>
{:/}' | strip_newlines%}

[//]: # (// Integraitons)

{% assign integrations = '{::nomarkdown}
<ul>
    <li>
        <a href="' | append: site.baseurl | append: '/cbioportal">cBioPortal</a> using <a href="https://gitlab.com/radiology/infrastructure/utils/xnat2cbio">xnat2cbio</a> and following the <a href="https://zenodo.org/records/14900295">EOSC4Cancer manual</a>
    </li>
</ul>
{:/}' | strip_newlines%}

## At a glance

| Field | Details                                                                                                                                                                                                                                          |
|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Tool name** | XNAT                                                                                                                                                                                                                                             |
| **Purpose and core functionality** | XNAT is an open-source imaging informatics platform designed to support imaging-based research. It offers tools to import, archive, process and securely distribute imaging and related study data. With a flexible architecture and growing plugin ecosystem, XNAT is suited to diverse clinical and research workflows. |
| **Type** | Analysis                                                                                                                                                                                                                                         |
| **Life cycle phases** | Process, Analyse, Preserve, Share, Reuse                                                                                                                                                                                                                          |
| **Domains using it** | Oncology                                                                                                                                                                                                                                         |
| **Website** | {{ website_links }}                                                                                                                                                                                                                              |   
| **Resource URLs** | {{ resources }}                                                                                                                                                                                                                                  |  
| **Integrations with other tools** | {{ integrations }}                                                                                                                                                                                                                               |
                                                                                                                                                                                                                                                               
## Known gaps or user needs

| Type | Description                                                                                                                                | URL                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                         
|------|------------|--------------------------------------------------------------------------------------------------------|
| Gap  | Clinical data harmonisation guidance: Researchers need support aligning clinical data elements to make them compatible with other datasets. |
| Gap  | Low awareness of cBioPortal. |

## Compatible with

{% include toolassemblies/show-tiles.html ids="cbioportal" %}