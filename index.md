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
    <h2 class="nav-card-title">Scenarios</h2>
    <p class="nav-card-description">Explore real-world examples and use cases for making your data FAIR</p>
  </a>

  <a href="/toolassemblies/tool_selection" class="homepage-nav-card">
    <div class="nav-card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
      </svg>
    </div>
    <h2 class="nav-card-title">Tools</h2>
    <p class="nav-card-description">Discover tools and software to support your FAIR data journey</p>
  </a>

  <a href="/fair_metroline_steps" class="homepage-nav-card">
    <div class="nav-card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="12" y1="5" x2="12" y2="19"/>
        <polyline points="19 12 12 19 5 12"/>
      </svg>
    </div>
    <h2 class="nav-card-title">FAIR Guidance Steps</h2>
    <p class="nav-card-description">Follow step-by-step guidance through the FAIRification process</p>
  </a>
</div>

<div class="homepage-recent-scenarios mt-5">
  <h2 class="section-title">Recent Scenarios</h2>
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
  <p>The <a href="https://www.go-fair.org/fair-principles/">FAIR principles</a> aim to make data Findable, Accessible, Interoperable and Reusable, to maximize the reuse of (research) data. See the <a href="https://www.health-ri.nl/en/about/organisation/fair-data">Health-RI website</a> for more information on FAIR.</p>
  
  <p>The FAIR Metroline provides practical guidance to help you reach your FAIR goals and make your data more FAIR. Each Metroline step includes a short description, aimed at a general audience, as well as a section describing the expertise that may be necessary for the how-to section.</p>

  <p>The FAIR Metroline is under development, in alignment with the development of the <a href="https://catalogus.healthdata.nl/">Dutch National Health Data Catalogue</a>. Over the coming months, we will add detailed how-to descriptions and real-life examples that will particularly help projects and initiatives to onboard (meta)data to the Dutch National Health Data Catalogue.</p>

  <h3>How to contribute</h3>
  <p>The FAIR Metroline is a cooperative effort between the Health-RI Hub and Nodes, involving the many public and private organisations and initiatives that address the reuse of care and research data. We invite you to collaborate with us as we continue to refine the various FAIR Metroline phases. To find out more, e-mail <a href="mailto:fairservicedesk@health-ri.nl">fairservicedesk@health-ri.nl</a>.</p>
</div>