---
title: FAIR Metroline steps
---
{% assign allkeywords = "" %}
{% assign allexpertise = "" %}
{% assign allgroups = "" %}
{% for step in site.data.metroline_steps %}
  {% if step.keywords %}
    {% assign stepkeywords = step.keywords | join: ", " %}
    {% if allkeywords %}
      {% assign allkeywords = allkeywords | append: ", " | append: stepkeywords %}
    {% else %}
      {% assign allkeywords = allkeywords | append: stepkeywords %}
    {% endif %}
  {% endif %}
  {% if step.expertise_required %}
    {% assign stepexpertise = step.expertise_required | join: ", " %}
    {% if allexpertise %}
      {% assign allexpertise = allexpertise | append: ", " | append: stepexpertise %}
    {% else %}
      {% assign allexpertise = allexpertise | append: stepexpertise %}
    {% endif %}
  {% endif %}
  {% if step.group %}
    {% if allgroups %}
      {% assign allgroups = allgroups | append: ", " | append: step.group %}
    {% else %}
      {% assign allgroups = allgroups | append: step.group %}
    {% endif %}
  {% endif %}
{% endfor %}
{% assign allkeywords = allkeywords | split: ", " | uniq | sort_natural %}
{% assign allexpertise = allexpertise | split: ", " | uniq | sort_natural %}
{% assign allgroups = allgroups | split: ", " | uniq %}
{% assign audience_options = "Data holder|Data user" | split: "|" %}

<div class="row g-4 row-cols-1 row-cols-md-2 my-4">
  {% include tile-filtering/tile-filter-select.html id="group-input" key="group" label="Filter by group" all_label="All groups" clear_label="group" options=allgroups %}
  {% include tile-filtering/tile-filter-select.html id="keywords-input" key="keywords" param="keyword" label="Filter by keyword" all_label="All keywords" clear_label="keyword" options=allkeywords %}
  {% include tile-filtering/tile-filter-select.html id="expertise-input" key="expertise" label="Filter by expertise" all_label="All expertise" clear_label="expertise" options=allexpertise %}
  {% include tile-filtering/tile-filter-select.html id="audience-input" key="audience" label="Filter by audience" all_label="All audiences" clear_label="audience" options=audience_options %}
</div>

<div class="steps row row-cols-1 row-cols-md-2 g-4 mb-5 navigation-tiles">
{% for step in site.data.metroline_steps %}
  {% capture keyword_classes %}{% for keyword in step.keywords %}{{ keyword | slugify }} {% endfor %}{% endcapture %}
  {% capture expertise_classes %}{% for expertise in step.expertise_required %}{{ expertise | slugify }} {% endfor %}{% endcapture %}
  {% capture audience_classes %}{% if step.audience.data_holder %}data-holder {% endif %}{% if step.audience.data_user %}data-user {% endif %}{% endcapture %}
  {% capture group_class %}{{ step.group | slugify }}{% endcapture %}
  {% assign audience_tags = "" | split: "" %}
  {% if step.audience.data_holder and step.audience.data_user %}
    {% assign audience_tags = "Data holder|Data user" | split: "|" %}
  {% elsif step.audience.data_holder %}
    {% assign audience_tags = "Data holder" | split: "|" %}
  {% elsif step.audience.data_user %}
    {% assign audience_tags = "Data user" | split: "|" %}
  {% endif %}
  {% assign group_tags = step.group | split: "|" %}
  <div class="col step" data-keywords="{{ keyword_classes | strip }}" data-expertise="{{ expertise_classes | strip }}" data-audience="{{ audience_classes | strip }}" data-group="{{ group_class | strip }}">
    {% capture card_meta %}
      {% include tile-filtering/tag-group.html label="Keywords" values=step.keywords badge="bg-primary" %}
      {% include tile-filtering/tag-group.html label="Expertise" values=step.expertise_required badge="bg-secondary" %}
      {% include tile-filtering/tag-group.html label="Audience" values=audience_tags badge="bg-primary" %}
      {% include tile-filtering/tag-group.html label="Group" values=group_tags badge="bg-secondary" %}
    {% endcapture %}
    {% assign card_meta = card_meta | strip %}
    {% include tile-filtering/navigation-card.html
      url=step.url
      title=step.title
      description=step.summary
      icon=step.icon
      icon_class="step-card-icon"
      meta=card_meta
    %}
  </div>
{% endfor %}
</div>

{% include tile-filtering/tile-filters-script.html %}
