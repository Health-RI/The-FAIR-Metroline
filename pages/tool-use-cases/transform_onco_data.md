---
title: How to analyse tumor data and publish the results
permalink: tool-use-cases/transform_onco_data
redirect_from: /tool-scenarios/transform_onco_data
page_id: transform_onco_data
custom_js: metro-timeline
---

## Background

You need to process tumor sequencing data to extract key genomic alterations. Cancer genomics portals help you explore and share these results, but they require data in a specific structured format.



## Use Case Overview

You start with raw tumor sequencing files, run an analysis workflow to generate variants and copy number profiles, then format the outputs so they can be uploaded to a cancer genomics portal for exploration.

{% include use-case-overview.html complexity="High" environment="HPC or Cloud" outcome="Published dataset" %}


{% assign journey_stops = site.data.tool-use-cases.transform_onco_data | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.tool-use-cases.transform_onco_data | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
### Prerequisites
Before starting this use case, you should have the following prerequisites in place.

{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops%}