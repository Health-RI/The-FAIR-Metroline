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

<div class="steps-filters my-4">
  <div class="row g-3 row-cols-1 row-cols-lg-2">
    <div class="col">
      <div class="input-group">
        <span class="input-group-text" id="search-label-steps"><i class="fa-solid fa-magnifying-glass"></i></span>
        <input type="text" id="title-search" class="form-control tile-search-control" onkeyup="applyTileFilters();" placeholder="Search steps" aria-label="Search steps" aria-describedby="search-label-steps">
        <button class="btn btn-primary" title="Clear the search" type="button" id="clearsearch">
          <i class="fa-solid fa-backspace"></i>
        </button>
      </div>
    </div>
    {% include tile-filtering/tile-filter-select.html id="group-input" key="group" label="Group" all_label="All groups" clear_label="group" options=allgroups %}
  </div>

  <div class="steps-filters-bar">
    {% include tile-filtering/tile-filter-toggles.html id="fair-input" label="Filter on FAIR" %}
    <button class="btn btn-outline-primary btn-sm steps-filters-more" type="button" data-bs-toggle="collapse" data-bs-target="#advanced-filters" aria-expanded="false" aria-controls="advanced-filters">
      <i class="fa-solid fa-sliders"></i> More filters <span class="badge rounded-pill bg-primary d-none" id="advanced-filter-count"></span>
    </button>
  </div>

  <div class="collapse" id="advanced-filters">
    <div class="row g-3 row-cols-1 row-cols-md-3 pt-3">
      {% include tile-filtering/tile-filter-select.html id="keywords-input" key="keywords" param="keyword" label="Keyword" all_label="All keywords" clear_label="keyword" options=allkeywords %}
      {% include tile-filtering/tile-filter-select.html id="expertise-input" key="expertise" label="Expertise" all_label="Any expertise" clear_label="expertise" options=allexpertise %}
      {% include tile-filtering/tile-filter-select.html id="audience-input" key="audience" label="Audience" all_label="Any audience" clear_label="audience" options=audience_options %}
    </div>
  </div>
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
  {% comment %}Steps covering all four letters are tagged FAIR only, so they show under the FAIR toggle but not under single-letter toggles. Others carry their lowercase letters (e.g. [A, R] gives "a r").{% endcomment %}
  {% if step.fair.size == 4 %}
    {% assign fair_tags = "Covers all FAIR principles" | split: "|" %}
    {% assign fair_classes = "fair" %}
  {% else %}
    {% capture fair_names %}{% for letter in step.fair %}{% case letter %}{% when "F" %}Findable{% when "A" %}Accessible{% when "I" %}Interoperable{% when "R" %}Reusable{% endcase %}{% unless forloop.last %}|{% endunless %}{% endfor %}{% endcapture %}
    {% assign fair_tags = fair_names | split: "|" %}
    {% assign fair_classes = step.fair | join: " " | downcase %}
  {% endif %}
  <div class="col step" data-keywords="{{ keyword_classes | strip }}" data-expertise="{{ expertise_classes | strip }}" data-audience="{{ audience_classes | strip }}" data-group="{{ group_class | strip }}" data-fair="{{ fair_classes | strip }}">
    {% capture card_meta %}
      {% include tile-filtering/tag-group.html label="Keywords" values=step.keywords badge="bg-primary" %}
      {% include tile-filtering/tag-group.html label="Expertise" values=step.expertise_required badge="bg-secondary" %}
      {% include tile-filtering/tag-group.html label="Audience" values=audience_tags badge="bg-primary" %}
      {% include tile-filtering/tag-group.html label="Group" values=group_tags badge="bg-secondary" %}
      {% include tile-filtering/tag-group.html label="FAIR" values=fair_tags badge="bg-primary" %}
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
<script type="text/javascript">
  // Show how many advanced filters are set, and open the panel when the URL already sets one
  $(document).ready(function () {
    const panel = document.getElementById("advanced-filters");
    const badge = document.getElementById("advanced-filter-count");
    function updateAdvancedCount() {
      const count = Array.from(panel.querySelectorAll(".tile-filter-control")).filter(function (s) { return s.value; }).length;
      badge.textContent = count;
      badge.classList.toggle("d-none", count === 0);
      return count;
    }
    panel.addEventListener("change", updateAdvancedCount);
    panel.addEventListener("click", updateAdvancedCount);
    if (updateAdvancedCount() > 0) {
      bootstrap.Collapse.getOrCreateInstance(panel, { toggle: false }).show();
    }
  });
</script>
