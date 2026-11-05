---
title: FAIR Metroline
permalink: /
page_id: main
---

<h5>One place to make your health and life sciences data FAIR: real-world examples, the right tools and step-by-step guidance.</h5>

<div class="homepage-nav-grid">
  <a href="/fair_metroline_use_cases" class="homepage-nav-card">
    <div class="nav-card-icon">
      {% include section-icon.html icon="use-cases" %}
    </div>
    <div class="nav-card-title">Use Cases</div>
    <p class="nav-card-description">Explore real-world examples and use cases for making your data FAIR</p>
  </a>

  <a href="/toolassemblies/tool_selection" class="homepage-nav-card">
    <div class="nav-card-icon">
      {% include section-icon.html icon="tools" %}
    </div>
    <div class="nav-card-title">Tools</div>
    <p class="nav-card-description">Find software and services that help make your data FAIR</p>
  </a>

  <a href="/fair_metroline_steps" class="homepage-nav-card">
    <div class="nav-card-icon">
      {% include section-icon.html icon="steps" %}
    </div>
    <div class="nav-card-title">FAIR Steps</div>
    <p class="nav-card-description">Detailed step-by-step guidance on FAIR data, for data stewards and others who know the basics</p>
  </a>
</div>

<div class="fair-intro-ribbon">
  <div class="fair-intro-ribbon-content">
    <strong>New to FAIR?</strong>
    Learn the basics of the FAIR principles before exploring use cases and guidance.<br>
    <a href="/fair_basics" class="fair-intro-link">
      Introduction to FAIR →
    </a>
  </div>
</div>

<div class="homepage-recent-use-cases mt-5">
  <h2 class="section-title">Recently Added Use Cases</h2>
  <div class="use-case-cards-grid use-case-cards-compact">
    {% assign use_cases = site.data.use_cases_list | slice: -2, 2 %}
    {% for use_case in use_cases %}
    <a href="{{ use_case.url | relative_url }}" class="use-case-card">
      <div class="use-case-card-icon">{{ use_case.icon }}</div>
      <h3 class="use-case-card-title">{{ use_case.title }}</h3>
      <p class="use-case-card-description">{{ use_case.description }}</p>
      <div class="use-case-card-meta">
        {% if use_case.type %}
        <span class="use-case-type">{{ use_case.type | capitalize }}</span>
        {% endif %}
        {% if use_case.complexity %}
        <span class="use-case-complexity">{{ use_case.complexity }}</span>
        {% endif %}
      </div>
    </a>
    {% endfor %}
  </div>
</div>

<div class="homepage-fair-tools mt-5">
  <h2 class="section-title">Tools that support FAIR data</h2>
  {%- assign tools = site.pages | where: "type", "tool" %}
  {%- assign catalogue = "/toolassemblies/tool_selection" | relative_url %}
  {%- comment %} chips only for verified FAIR tags; until there are any, just the link {% endcomment %}
  {%- assign fair_tagged = tools | where_exp: "t", "t.fair" %}
  {%- if fair_tagged.size == 0 %}
  <p class="fair-tools-intro">Browse the <a href="{{ catalogue }}">{{ tools.size }} tools</a> in the tool catalogue.</p>
  {%- else %}
  <p class="fair-tools-intro">Browse <a href="{{ catalogue }}">{{ tools.size }} tools</a> by the FAIR principle they help with:</p>
  <ul class="fair-chips">
    {%- for tag in site.data.fair_tags %}
    {%- assign tagged = tools | where_exp: "t", "t.fair contains tag.name" %}
    {%- if tagged.size > 0 %}
    <li><a class="fair-chip" href="{{ catalogue }}?fair={{ tag.name | slugify }}" title="{{ tag.text }}"><span class="fair-chip-badge fair-chip-badge--{{ tag.code }}" aria-hidden="true">{% if tag.code == "planning" %}<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>{% else %}{{ tag.code }}{% endif %}</span>{{ tag.short | default: tag.name }} <span class="fair-chip-count">{{ tagged.size }}</span></a></li>
    {%- endif %}
    {%- endfor %}
  </ul>
  {%- endif %}
</div>

<div class="text-center mt-4 mb-3">
  <p class="text-muted mb-2">Have questions or suggestions?</p>
  <a href="/contact" class="btn btn-outline-primary">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: text-bottom; margin-right: 6px;">
      <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
    </svg>
    Share your feedback
  </a>
</div>

<div class="homepage-about mt-5 pt-5">
  <h2>About FAIR Metroline</h2>
  <p>The FAIR Metroline provides step-by-step guidance, practical use cases, and a catalogue of tools that support FAIR data to help you make your health and life sciences data FAIR (Findable, Accessible, Interoperable and Reusable). Learn more about <a href="https://www.go-fair.org/fair-principles/">FAIR principles</a> and <a href="https://www.health-ri.nl/en/about/organisation/fair-data">Health-RI's FAIR data initiatives</a>.</p>

  <p>The platform is under active development in alignment with the <a href="https://catalogus.healthdata.nl/">Dutch National Health Data Catalogue</a>, with ongoing contributions of use cases and tools from UMCs and life science researchers across the Netherlands. See the <a href="/network">list of contributors</a> for more details.</p>

  <h3>How to contribute</h3>
  <p>The FAIR Metroline is a cooperative effort between Health-RI and its network of academic medical centers, research institutes, and healthcare organizations. We welcome contributions of new use cases, tools, and practical guidance. Learn more about <a href="/contributing/contributing">how to contribute</a>, <a href="/contact">share your feedback</a>, or contact us at <a href="mailto:fairservicedesk@health-ri.nl">fairservicedesk@health-ri.nl</a>.</p>
</div>