---
title: How can we connect equipment data, metadata and repositories?
permalink: use-cases/ibisba_wur_fair_bioprocess_data
redirect_from: /tool-scenarios/ibisba_wur_fair_bioprocess_data
page_id: ibisba_wur_fair_bioprocess_data
custom_js: metro-timeline
---

## Background

You need to collect data from sensor and manage them, so that they are FAIR from the start of the process.



## Use Case Overview

You have sensors to collect data and you setup a pipeline to collected, FARIfy and manage the data.

{% include use-case-overview.html complexity="High" environment="Local or Cloud" outcome="Managed dataset" %}

{% assign journey_stops = site.data.use-cases.ibisba_wur_fair_bioprocess_data | where_exp: "item", "item.status != 'prerequisite'" %}
{% assign prerequisites = site.data.use-cases.ibisba_wur_fair_bioprocess_data | where_exp: "item", "item.status == 'prerequisite'" %}

{% if prerequisites.size > 0 %}
{% include use-case-prerequisites.html prerequisites=prerequisites %}
{% endif %}

## Your Journey

{% include timeline.html stops=journey_stops%}

