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

<div class="row g-4 row-cols-1 row-cols-md-2 my-4">
    <div class="col">
    <div class="input-group">
      <label class="input-group-text" for="group-input">Filter by group</label>
      <select class="form-select" id="group-input" aria-label="Filter by group">
        <option value="">All groups</option>
        {% for group in allgroups %}
          {% if group != "" %}
            <option value="{{ group | slugify }}">{{ group }}</option>
          {% endif %}
        {% endfor %}
      </select>
      <button class="btn btn-primary" title="Button to clear group selection" type="button" id="cleargroupfilter">
        <i class="fa-solid fa-backspace"></i>
      </button>
    </div>
  </div>
  <div class="col">
    <div class="input-group">
      <label class="input-group-text" for="keywords-input">Filter by keyword</label>
      <select class="form-select" id="keywords-input" aria-label="Filter by keyword">
        <option value="">All keywords</option>
        {% for keyword in allkeywords %}
          {% if keyword != "" %}
            <option value="{{ keyword | slugify }}">{{ keyword }}</option>
          {% endif %}
        {% endfor %}
      </select>
      <button class="btn btn-primary" title="Button to clear keyword selection" type="button" id="clearkeywordfilter">
        <i class="fa-solid fa-backspace"></i>
      </button>
    </div>
  </div>
  <div class="col">
    <div class="input-group">
      <label class="input-group-text" for="expertise-input">Filter by expertise</label>
      <select class="form-select" id="expertise-input" aria-label="Filter by expertise">
        <option value="">All expertise</option>
        {% for expertise in allexpertise %}
          {% if expertise != "" %}
            <option value="{{ expertise | slugify }}">{{ expertise }}</option>
          {% endif %}
        {% endfor %}
      </select>
      <button class="btn btn-primary" title="Button to clear expertise selection" type="button" id="clearexpertisefilter">
        <i class="fa-solid fa-backspace"></i>
      </button>
    </div>
  </div>
  <div class="col">
    <div class="input-group">
      <label class="input-group-text" for="audience-input">Filter by audience</label>
      <select class="form-select" id="audience-input" aria-label="Filter by audience">
        <option value="">All audiences</option>
        <option value="data-holder">Data holder</option>
        <option value="data-user">Data user</option>
      </select>
      <button class="btn btn-primary" title="Button to clear audience selection" type="button" id="clearaudiencefilter">
        <i class="fa-solid fa-backspace"></i>
      </button>
    </div>
  </div>
</div>

<div class="steps row row-cols-1 row-cols-md-2 g-4 mb-5 navigation-tiles">
{% for step in site.data.metroline_steps %}
  {% capture keyword_classes %}{% for keyword in step.keywords %};{{ keyword | slugify }}{% endfor %};{% endcapture %}
  {% capture expertise_classes %}{% for expertise in step.expertise_required %};{{ expertise | slugify }}{% endfor %};{% endcapture %}
  {% capture audience_classes %}{% if step.audience.data_holder %};data-holder{% endif %}{% if step.audience.data_user %};data-user{% endif %};{% endcapture %}
  <div class="col step" data-keywords="{{ keyword_classes | strip }}" data-expertise="{{ expertise_classes | strip }}" data-audience="{{ audience_classes | strip }}" data-group=";{{ step.group | slugify }};">
    <a href="{{ site.baseurl }}/{{ step.url }}" class="card h-100 tool-card" aria-label="Go to the {{ step.title }} page">
      <div class="card-body">
        <div class="tool-card-icon step-card-icon" aria-hidden="true">
          <span>{{ step.icon }}</span>
        </div>

        <h3 class="tool-card-title">{{ step.title }}</h3>
        <p class="tool-card-description">{{ step.summary }}</p>

        <div class="tool-card-meta">
          {% if step.keywords %}
            <div class="tool-tags-group">
              <span class="tool-tags-label">Keywords:</span>
              <div class="tool-tags">
                {% for keyword in step.keywords %}
                  <span class="badge bg-primary">{{ keyword }}</span>
                {% endfor %}
              </div>
            </div>
          {% endif %}

          {% if step.expertise_required %}
            <div class="tool-tags-group">
              <span class="tool-tags-label">Expertise:</span>
              <div class="tool-tags">
                {% for expertise in step.expertise_required %}
                  <span class="badge bg-secondary">{{ expertise }}</span>
                {% endfor %}
              </div>
            </div>
          {% endif %}

          {% if step.audience %}
            <div class="tool-tags-group">
              <span class="tool-tags-label">Audience:</span>
              <div class="tool-tags">
                {% if step.audience.data_holder %}
                  <span class="badge bg-primary">Data holder</span>
                {% endif %}
                {% if step.audience.data_user %}
                  <span class="badge bg-primary">Data user</span>
                {% endif %}
              </div>
            </div>
          {% endif %}

          {% if step.group %}
            <div class="tool-tags-group">
              <span class="tool-tags-label">Group:</span>
              <div class="tool-tags">
                <span class="badge bg-secondary">{{ step.group }}</span>
              </div>
            </div>
          {% endif %}
        </div>
      </div>
    </a>
  </div>
{% endfor %}
</div>

<style>
  .step-card-icon span {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    line-height: 1;
    min-height: 4rem;
  }
</style>

<script type="text/javascript">
  function applyMetrolineStepFilters() {
    const steps = document.querySelectorAll(".steps .step");
    const keywordSelect = document.getElementById("keywords-input");
    const expertiseSelect = document.getElementById("expertise-input");
    const audienceSelect = document.getElementById("audience-input");
    const groupSelect = document.getElementById("group-input");

    const selectedKeyword = keywordSelect ? keywordSelect.value : "";
    const selectedExpertise = expertiseSelect ? expertiseSelect.value : "";
    const selectedAudience = audienceSelect ? audienceSelect.value : "";
    const selectedGroup = groupSelect ? groupSelect.value : "";
    const hasFilterValue = function (values, selectedValue) {
      return !selectedValue || values.indexOf(`;${selectedValue};`) !== -1;
    };

    for (const step of steps) {
      const stepKeywords = step.getAttribute("data-keywords") || "";
      const stepExpertise = step.getAttribute("data-expertise") || "";
      const stepAudience = step.getAttribute("data-audience") || "";
      const stepGroup = step.getAttribute("data-group") || "";

      const keywordMatch = hasFilterValue(stepKeywords, selectedKeyword);
      const expertiseMatch = hasFilterValue(stepExpertise, selectedExpertise);
      const audienceMatch = hasFilterValue(stepAudience, selectedAudience);
      const groupMatch = hasFilterValue(stepGroup, selectedGroup);

      if (keywordMatch && expertiseMatch && audienceMatch && groupMatch) {
        step.classList.remove("d-none");
      } else {
        step.classList.add("d-none");
      }
    }

    const params = new URLSearchParams();
    if (selectedKeyword) params.set("keyword", selectedKeyword);
    if (selectedExpertise) params.set("expertise", selectedExpertise);
    if (selectedAudience) params.set("audience", selectedAudience);
    if (selectedGroup) params.set("group", selectedGroup);
    const newUrl = params.toString() ? `?${params}` : location.pathname;
    history.replaceState({}, "", newUrl);
  }

  $(document).ready(function () {
    const keywords = document.getElementById("keywords-input");
    if (keywords) {
      keywords.addEventListener("change", applyMetrolineStepFilters);
    }

    const expertise = document.getElementById("expertise-input");
    if (expertise) {
      expertise.addEventListener("change", applyMetrolineStepFilters);
    }

    const audience = document.getElementById("audience-input");
    if (audience) {
      audience.addEventListener("change", applyMetrolineStepFilters);
    }

    const group = document.getElementById("group-input");
    if (group) {
      group.addEventListener("change", applyMetrolineStepFilters);
    }

    const clearKeyword = document.getElementById("clearkeywordfilter");
    if (clearKeyword) {
      clearKeyword.addEventListener("click", function () {
        const keywords = document.getElementById("keywords-input");
        if (keywords) {
          keywords.value = "";
          applyMetrolineStepFilters();
        }
      });
    }

    const clearExpertise = document.getElementById("clearexpertisefilter");
    if (clearExpertise) {
      clearExpertise.addEventListener("click", function () {
        const expertise = document.getElementById("expertise-input");
        if (expertise) {
          expertise.value = "";
          applyMetrolineStepFilters();
        }
      });
    }

    const clearAudience = document.getElementById("clearaudiencefilter");
    if (clearAudience) {
      clearAudience.addEventListener("click", function () {
        const audience = document.getElementById("audience-input");
        if (audience) {
          audience.value = "";
          applyMetrolineStepFilters();
        }
      });
    }

    const clearGroup = document.getElementById("cleargroupfilter");
    if (clearGroup) {
      clearGroup.addEventListener("click", function () {
        const group = document.getElementById("group-input");
        if (group) {
          group.value = "";
          applyMetrolineStepFilters();
        }
      });
    }

    const urlParams = new URLSearchParams(window.location.search);
    const urlKeyword = urlParams.get("keyword");
    const urlExpertise = urlParams.get("expertise");
    const urlAudience = urlParams.get("audience");
    const urlGroup = urlParams.get("group");

    if (urlKeyword && keywords) {
      keywords.value = urlKeyword;
    }
    if (urlExpertise && expertise) {
      expertise.value = urlExpertise;
    }
    if (urlAudience && audience) {
      audience.value = urlAudience;
    }
    if (urlGroup && group) {
      group.value = urlGroup;
    }

    if (urlKeyword || urlExpertise || urlAudience || urlGroup) {
      applyMetrolineStepFilters();
    }
  });
</script>
