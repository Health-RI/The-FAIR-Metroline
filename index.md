---
title: FAIR Metroline
permalink: /
page_id: main
---

<h5>Practical guidance to make your health data Findable, Accessible, Interoperable and Reusable, from planning to implementation.
</h5>

<div class="homepage-nav-grid">
  <a href="/fair_metroline_scenarios" class="homepage-nav-card">
    <div class="nav-card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2L2 7l10 5 10-5-10-5z"/>
        <path d="M2 17l10 5 10-5"/>
        <path d="M2 12l10 5 10-5"/>
      </svg>
    </div>
    <div class="nav-card-title">Scenarios</div>
    <p class="nav-card-description">Explore real-world examples and use cases for making your data FAIR</p>
  </a>

  <a href="/toolassemblies/tool_selection" class="homepage-nav-card">
    <div class="nav-card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
      </svg>
    </div>
    <div class="nav-card-title">Tools</div>
    <p class="nav-card-description">Discover tools and software to support your FAIR data journey</p>
  </a>

  <a href="/fair_metroline_steps" class="homepage-nav-card">
    <div class="nav-card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="12" y1="5" x2="12" y2="19"/>
        <polyline points="19 12 12 19 5 12"/>
      </svg>
    </div>
    <div class="nav-card-title">FAIR Steps</div>
    <p class="nav-card-description">Follow step-by-step guidance through the FAIRification process</p>
  </a>
</div>

<div class="homepage-recent-scenarios mt-5">
  <h2 class="section-title">Recently Added Scenarios</h2>
  <div class="scenario-cards-grid scenario-cards-compact">
    {% assign scenarios = site.data.scenarios_list | slice: 0, 2 %}
    {% for scenario in scenarios %}
    <a href="{{ scenario.url | relative_url }}" class="scenario-card">
      <div class="scenario-card-icon">{{ scenario.icon }}</div>
      <h3 class="scenario-card-title">{{ scenario.title }}</h3>
      <p class="scenario-card-description">{{ scenario.description }}</p>
      <div class="scenario-card-meta">
        {% if scenario.type %}
        <span class="scenario-type">{{ scenario.type | capitalize }}</span>
        {% endif %}
        {% if scenario.complexity %}
        <span class="scenario-complexity">{{ scenario.complexity }}</span>
        {% endif %}
      </div>
    </a>
    {% endfor %}
  </div>
</div>

<div class="homepage-about mt-5 pt-5">
  <h2>About FAIR Metroline</h2>
  <p>The FAIR Metroline provides step-by-step guidance, practical scenarios, and tooling recommendations to help you make your health data FAIR (Findable, Accessible, Interoperable and Reusable). Learn more about <a href="https://www.go-fair.org/fair-principles/">FAIR principles</a> and <a href="https://www.health-ri.nl/en/about/organisation/fair-data">Health-RI's FAIR data initiatives</a>.</p>

  <p>The platform is under active development in alignment with the <a href="https://catalogus.healthdata.nl/">Dutch National Health Data Catalogue</a>, with ongoing contributions of scenarios and tools from UMCs and life science researchers across the Netherlands. See the <a href="/network">list of contributors</a> for more details.</p>

  <h3>How to contribute</h3>
  <p>The FAIR Metroline is a cooperative effort between Health-RI and its network of academic medical centers, research institutes, and healthcare organizations. We welcome contributions of new scenarios, tools, and practical guidance. Learn more about <a href="/contributing/contributing">how to contribute</a> or contact us at <a href="mailto:fairservicedesk@health-ri.nl">fairservicedesk@health-ri.nl</a>.</p>
</div>