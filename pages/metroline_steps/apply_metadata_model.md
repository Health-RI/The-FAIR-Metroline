---
title: Apply (meta)data model
permalink: /metroline_steps/apply_metadata_model
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***A (meta)data model is intended to ‘answer questions about a domain, improve understanding, and promote knowledge sharing; expose \[…] assumptions about a domain; promote communication among people developing a conceptual model, or among people who (later) use a conceptual model' [On the Philosophical Foundations of Conceptual Models](https://ebooks.iospress.nl/volumearticle/53687)***
>
> {{ current_step.summary }}

## Short description 
This step provides guidance on how to apply a metadata model to describe research resources (e.g. a model describing the topic, provenance, or type of datasets), and how to apply a data model to describe the information contained in those resources (e.g. a model capturing the structure and semantics of cohort data). Guidance on selecting or creating a suitable model can be found in [Metroline step: Create or reuse a semantic (meta)data model]({{site.baseurl}}/metroline_steps/create_or_reuse_a_semantic_model). Usually, both metadata and data models are annotated with ontologies (e.g. [DCAT](https://www.w3.org/TR/vocab-dcat-3/) for metadata, [ORDO](https://www.orphadata.com/ordo/) for data). The terms model and schema are sometimes used interchangeably. However, model generally refers to the conceptual structure and meaning of data or metadata, while schema typically refers to a machine-readable implementation of that model. This page outlines the differences between metadata and data models, their benefits, and the main methods and tools available to apply them effectively.

**Metadata models** define what information should be included about a resource. For instance, who created it, when it was collected, and what it is generally about (theme). These models help structure information like catalogues of datasets and their distributions, and also properties like authorship, licensing, and contact points. Using a metadata model to describe your resource improves its findability, allowing others to assess its potential for reuse.

**Data models** define how the content within a resource is organised and represented. For instance, how patient age, diagnosis, or lab results are structured and related in a dataset. These models ensure that data values are understandable, interoperable, and reusable across different systems and domains. Applying a data model to your resource increases its clarity (i.e. based on the clear definitions of variables, units, and relationships provided by data models), consistency (i.e. as well-defined structures, data models reduce ambiguity and misinterpretation) and interoperability (i.e. ontologised datasets can be easily integrated with other resources).

While some methods and tools focus specifically on either metadata or data, others have a general purpose and can be used for both layers. Typically, a tool for applying a model works by transforming or restructuring original data according to the structure and semantics defined by the model.

For example, for a tool like {% include toolassemblies/show-badges.html ids="fair-in-a-box" %} (see also table below), this may involve reading data from a CSV file and transforming it into RDF that is compliant with a domain-specific model like the [CARE-SM](https://github.com/CARE-SM/CARE-Semantic-Model) (Clinical And Registries Entries Semantic Model) data model. In such cases, each element in the file—whether a column header or data value—is linked to a formal concept from the model. This enables the resource to be understood not just by humans but also by machines. A similar example involving a different approach is the use of an electronic data capture platform such as Castor. Here, users can configure mappings between data elements in the electronic case report form and a semantic data model. This is further described in [this paper](https://www.sciencedirect.com/science/article/pii/S1532046421002264).

Many metadata-focused tools also provide mechanisms to expose your resource online under clear access conditions, increasing its findability. This may include generating metadata records in RDF and publishing the metadata via catalogues or registries that support standard protocols such as SPARQL.

## Why is this step important
Applying the data model to your data and metadata model to your metadata is crucial for the next step: 
[Metroline Step: Transform and expose FAIR (meta)data]({{site.baseurl}}/metroline_steps/transform_and_expose_fair_metadata). It is a central step in the FAIRification process, in which you connect your (meta)data to elements of your (semantic) (meta)data model. By doing this, your (meta)data becomes machine-readable and interoperable.

The metadata and data that are structured with ontologies and follow standard schemas make it easier for other resources to find your resource’s metadata and understand its data. 

## How to
### Step 1 - Use specialised tools to apply and customise a FAIR (meta)data model to your resources
The following tool pages describe tools that can support applying a (meta)data model to your resource(s).

{% include toolassemblies/show-badges.html ids="fair-data-point, fair-in-a-box, castor, ontotext-refine, molgenis" %}

## Practical examples from the community
**FAIR Data Point**<br>
The UMCs in the Netherlands are either in the process of setting up or already have a local FDP. For example, see [Amsterdam UMC’s FDP](https://fdp.healthdataspace.amsterdam/). Health-RI provides [guidance](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279183386) for setting up the FDP for the National Health Data Catalogue. 

**VASCA registry**<br>
The VASCA registry implemented the CDE semantic data model, as well as the DCAT and EJPRD metadata schemas.
For more information, see the following two publications:
* [The de novo FAIRification process of a registry for vascular anomalies](https://doi.org/10.1186/s13023-021-02004-y)
* [De-novo FAIRification via an Electronic Data Capture system by automated transformation of filled electronic Case Report Forms into machine-readable data](https://doi.org/10.1016/j.jbi.2021.103897)

**PRISMA**<br>
PRISMA implemented the Health-RI metadata schema in the {% include toolassemblies/show-badges.html ids="fair-data-point" %} and applied it to metadata from the [PRISMA study](https://www.prisma-studie.nl/). You can view PRISMA metadata in the [Radboudumc FAIR Data Point](https://fdp.radboudumc.nl/catalog/fa48b19f-f390-4023-872d-f0f0024bfcec). 

## Training
* [A portal to (Meta)data](https://zenodo.org/records/15676294), a presentation-lecture on gathering metadata elements at different levels.

## Suggestions
{% include metroline_steps/suggestions_released.html src=page.title%}
