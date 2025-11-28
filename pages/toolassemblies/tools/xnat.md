---
title: XNAT
type: tool
tool_id: 6
page_img: toolassemblies/tools/xnat.png
domain: [Oncology]
phase: [Process, Analyse, Preserve, Share, Reuse]
---


## At a glance
{% include toolassemblies/tool-table.html tool_id=page.tool_id section="at_a_glance" %}

## Known gaps or user needs
{% include toolassemblies/tool-table.html tool_id=page.tool_id section="gaps_and_needs" %}

## Compatible with
{% assign tool = site.data.tools | where: "id", page.tool_id | first %}
{% include toolassemblies/show-tiles.html ids=tool.compatible_with %}