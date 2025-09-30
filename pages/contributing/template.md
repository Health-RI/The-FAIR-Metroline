---
title: Template
permalink: /contributing/template
---

{%raw%}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Great quote. [Reference]()***
>
> {{ current_step.summary }}

## Short description 


## Why is this step important


## How to

### Step 1 - 

### Step 2 - 


## Expertise requirements for this step 


## Practical examples from the community 
{% include metroline_steps/looking_for_examples.html %}


## Training
{% include metroline_steps/training_will_be_added.html %}


## Suggestions
{% include metroline_steps/suggestions_released.html %}

{% include metroline_steps/suggestions_development.html %}

{%endraw%}
