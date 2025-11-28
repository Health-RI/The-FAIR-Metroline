---
title: Slide Score
toc: true
type: tool
page_img: toolassemblies/tools/slidescore.png
domain: [Oncology]
phase: [Process, Analyse, Preserve, Share]
compatible_with: [cbioportal]
---

[//]: # (// Resource URLs)

{% assign resources = '{::nomarkdown}
<ul>
    <li>
        Manual:
        <ul><li><a href="https://www.slidescore.com/docs/start.html">User guide</a></li></ul>
    </li>
    <li>
        Specific documentation:
        <ul><li><a href="https://www.slidescore.com/docs/api.html">Developers documentation</a></li></ul>
    </li>
</ul>
{:/}' | strip_newlines%}

[//]: # (// Integraitons)

{% assign integrations = '{::nomarkdown}
<ul>
    <li>
        <a href="' | append: site.baseurl | append: '/cbioportal">cBioPortal</a>: Allows embedding the Slide Score viewer within the cBioPortal interface as described <a href="https://www.slidescore.com/news/a/031_cbioportal">here</a>
    </li>
</ul>
{:/}' | strip_newlines%}

## At a glance

| Field | Details                                                                                                                                                                                                                                          |
|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Tool name** | Slide Score                                                                                                                                                                                                                                       |
| **Purpose and core functionality** | Slide Score is a web-based viewer for high-resolution digital microscopy images, with a focus on histopathology slides. It enables users to upload images, create scoring forms (question sets) and invite experts—such as pathologists—for collaborative evaluation and scoring. |
| **Type** | Analysis                                                                                                                                                                                                                                         |
| **Life cycle phases** | Process, Analyse, Preserve, Share                                                                                                                                                                                                                          |
| **Domains using it** | Oncology                                                                                                                                                                                                                                         |
| **Website** | <a href="https://www.slidescore.com/">Website</a>                                                                                                                                                                                                                           |   
| **Resource URLs** | {{ resources }}                                                                                                                                                                                                                                  |  
| **Integrations with other tools** | {{ integrations }}                                                                                                                                                                                                                          |
                                                                                                                                                                                                                                                               
## Known gaps or user needs

| Type | Description  | URL |                                                                                                                                                                                                                                         
|------|--------------|-----|
|      |              |     |

## Compatible with

{% include toolassemblies/show-tiles.html ids="cbioportal" %}