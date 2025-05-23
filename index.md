---
title: The FAIR Metroline
permalink: /
---

The [FAIR principles](https://www.go-fair.org/fair-principles/) aim to make data Findable, Accessible, Interoperable and Reusable, to maximize the reuse of (research) data. See the [Health-RI website](https://www.health-ri.nl/en/about/organisation/fair-data) for more information on FAIR. 

But, where do you start to make data FAIR? What steps are involved? What do these steps mean and, importantly, how do you implement these steps? 

The FAIR Metroline provides practical guidance to help you reach your FAIR goals and make your data more FAIR. Each Metroline step includes a short description, aimed at a general audience, as well as a section describing the expertise that may be necessary for the how-to section. This expertise can vary greatly per step and may include, for example, domain experts, software engineers or legal professionals. Given the time commitment and specialised knowledge needed, most steps will require the expertise of at least a data steward.

![FAIR Metroline.jpg]({{site.baseurl}}/assets/img/main/FAIR%20Metroline.jpg)

A variety of models and publications which are used in practice [were studied](https://zenodo.org/records/7867293) to identify common FAIRification steps, which resulted in the FAIR Metroline (see image above). Depending on your project and goals only a select number of steps may be relevant. Consequently, each project will have its specific workflow: 

<script src="assets/js/init_mermaid.js"></script>
{% include graph_logic/on-load.html graphs=site.data.graphs.main %}
<script src="assets/js/graphController.js"></script>
{% include graph_logic/graph-block.html graphs=site.data.graphs.main section="section1" %}


The FAIR Metroline is under development, in alignment with the development of the [Dutch National Health Data Catalogue](https://catalog.accesshealthdata.nl/). Over the coming months, we will add detailed how-to descriptions and real-life examples of FAIR Metroline that will particularly help projects and initiatives to onboard (meta)data to the Dutch National Health Data Catalogue. This already is a first effective step to make your data more FAIR. We also collaborate with the [health domain funders](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/33816783) and their efforts to stimulate incorporating FAIR into projects from the start. 

For the current status of the steps see the [status](fair_metroline_status) page.

## How to contribute

The FAIR Metroline will be richer and more feasible to execute if we better consider the organisational context and existing best practices. As a result, the FAIR Metroline is a cooperative effort between the Health-RI Hub and Nodes, involving the many public and private organisations and initiatives that address the reuse of care and research data. We invite you to collaborate with us as we continue to refine the various FAIR Metroline phases. To find out more, e-mail <a href="mailto:fairservicedesk@health-ri.nl">fairservicedesk@health-ri.nl</a>.


## Overview Metroline steps
[//]: # (build the grid with an overview of the metroline steps, including an icon)
<div class="metroline-grid">
  {% for step in site.data.metroline_steps %}
    <div class="metroline-grid-cell">
        <span class="icon">{{ step.icon }}</span><a href="{{ step.url }}"><b>{{ step.title }}</b></a>
        {% include development_status.html step=step %}
    </div>
  {% endfor %}
</div>