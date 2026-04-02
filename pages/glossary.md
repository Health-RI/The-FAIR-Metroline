---
title: Glossary
---

<div id="top"></div>

{% comment %}
Load glossary data from the JSON file in _data/glossary/glossary.json
and sort entries alphabetically by the canonical term.
{% endcomment %}
{% assign glossary_items = site.data.glossary.glossary | sort: "term" %}

{% comment %}
Define navigation buckets for glossary letters.
"#" is used for terms that do not start with a letter (e.g. "(Controlled) Vocabulary").
{% endcomment %}
{% assign letters = "#,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" | split: "," %}

{% comment %}
Alphabet navigation at the top of the glossary.
Letters that have no entries are shown as disabled.
{% endcomment %}
<nav class="glossary-nav" aria-label="Glossary navigation">
  {% for letter in letters %}
    {% assign has_items = false %}

    {% comment %}
    Check whether any glossary term belongs to this letter group.
    {% endcomment %}
    {% for item in glossary_items %}
      {% assign first = item.term | slice: 0, 1 | upcase %}

      {% comment %}
      Terms starting with punctuation or numbers go into "#".
      {% endcomment %}
      {% unless letters contains first %}
        {% assign first = "#" %}
      {% endunless %}

      {% if first == letter %}
        {% assign has_items = true %}
        {% break %}
      {% endif %}
    {% endfor %}

    {% comment %}
    If the letter has entries, render a link to that section.
    Otherwise show it visually disabled.
    {% endcomment %}
    {% if has_items %}
      <a href="#letter-{{ letter | downcase | slugify }}">{{ letter }}</a>
    {% else %}
      <span class="is-disabled">{{ letter }}</span>
    {% endif %}
  {% endfor %}
</nav>

{% comment %}
Main glossary loop.
For each letter, gather the terms that belong to that letter group.
{% endcomment %}
{% for letter in letters %}
  {% assign letter_items = "" | split: "" %}

  {% for item in glossary_items %}
    {% assign first = item.term | slice: 0, 1 | upcase %}

    {% comment %}
    Again, group non-letter starting terms under "#".
    {% endcomment %}
    {% unless letters contains first %}
      {% assign first = "#" %}
    {% endunless %}

    {% if first == letter %}
      {% assign letter_items = letter_items | push: item %}
    {% endif %}
  {% endfor %}

  {% comment %}
  Only render the letter section if it contains entries.
  {% endcomment %}
  {% if letter_items.size > 0 %}

## {{ letter }}
{: #letter-{{ letter | downcase | slugify }} }

{% for item in letter_items %}

{% comment %}
Each glossary entry receives an id so the tooltip system
and deep links (e.g. /glossary/#api) can link directly to it.
{% endcomment %}
<div id="{{ item.term | downcase | slugify }}" class="glossary-entry">

  {% comment %}
  Term heading. The source(s) are rendered inline after the term.
  The loop outputs (Source1, Source2) without extra whitespace.
  {% endcomment %}
  <h3 class="glossary-term-line">
    {{ item.term }}
    {% if item.sources and item.sources.size > 0 %}
      <span class="glossary-sources">({% for source in item.sources %}{% if source.url and source.url != "" %}<a href="{{ source.url }}">{{ source.label }}</a>{% else %}{{ source.label }}{% endif %}{% unless forloop.last %}, {% endunless %}{% endfor %})</span>
    {% endif %}
  </h3>

  {% comment %}
  Optional aliases (synonyms or abbreviations).
  Displayed in italics to visually separate metadata from definition.
  {% endcomment %}
  {% if item.aliases and item.aliases.size > 0 %}
    <p class="glossary-aliases">
      <em>
        Also used as:
        {% for alias in item.aliases %}
          {{ alias }}{% unless forloop.last %}, {% endunless %}
        {% endfor %}
      </em>
    </p>
  {% endif %}

  {% comment %}
  Definition body.
  markdownify allows bullet lists and other markdown formatting
  stored inside the JSON definition field to render correctly.
  {% endcomment %}
  <div class="glossary-definition">
    {{ item.definition | markdownify }}
  </div>

  {% comment %}
  Optional citation field for papers or external references.
  Not all glossary entries include this.
  {% endcomment %}
  {% if item.citation and item.citation.size != "" %}
    <span class="glossary-citation">
      <em>Paper: {{ item.citation }}</em>
    </span>
  {% endif %}

</div>
{% endfor %}

{% comment %}
Convenience navigation link to return to the top alphabet menu.
{% endcomment %}

  {% endif %}
{% endfor %}