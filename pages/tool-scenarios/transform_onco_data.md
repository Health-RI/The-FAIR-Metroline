---
title: How to analyse tumor data and publish the results
permalink: tool-scenarios/transform_onco_data
page_id: transform_onco_data
custom_js: metro-timeline
---

## Background

You need to process tumor sequencing data to extract key genomic alterations. Cancer genomics portals help you explore and share these results, but they require data in a specific structured format.



## Scenario Overview

You start with raw tumor sequencing files, run an analysis workflow to generate variants and copy number profiles, then format the outputs so they can be uploaded to a cancer genomics portal for exploration.

{% include scenario-overview.html complexity="High" environment="HPC or Cloud" outcome="Published dataset" %}


{% assign journey_stops = site.data.tool-scenarios.transform_onco_data | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.tool-scenarios.transform_onco_data | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
## Prerequisites
Before starting this scenario, you should have the following prerequisites in place.

{% include scenario-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include tool-scenario-timeline.html stops=journey_stops%}