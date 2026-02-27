---
title: Query (use) over resources
permalink: /metroline_steps/query_over_resources
---
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Research is formalized curiosity. It is poking and prying with a purpose. [Zora Neale Hurston](https://www.floridamemory.com/learn/exhibits/in-her-own-words/zora-neale-hurston/)***
>
> {{ current_step.summary }}

## Short description 
When machine-readable (meta)data is exposed (see [Metroline step: Transform and Expose FAIR metadata]({{site.baseurl}}/metroline_steps/transform_and_expose_fair_metadata)), it becomes an accessible FAIR resource. In other words, a dataset or metadata collection which can be found, queried, and reused. Such resources are often hosted or described in catalogues and/or via [FAIR Data Points](https://www.fairdatapoint.org/), which expose (meta)data in a standardised way. This ability to discover and reuse data using the metadata resources is what makes FAIR so powerful: it turns isolated data into actionable knowledge for science.

These catalogues offer different levels of interaction:
* **Browsing.** You can navigate through a FAIR Data Point (FDP) or catalogue to discover available datasets, for example in the [The National Health Data Catalogue](https://catalogus.healthdata.nl/en) or [EBI BioStudies](https://www.ebi.ac.uk/biostudies/studies/).
* **Filtering and faceted search.** Similar to filtering products in a webshop, results can be narrowed by disease, data type, species, or other metadata attributes, as supported by the [European Health Research Data and Sample Catalogue](https://molgeniscatalogue.org/).
* **Visual query builders.** Some platforms provide user-friendly query forms that automatically generate queries behind the scenes, as seen in [Wikidata](https://query.wikidata.org/querybuilder/?uselang=en) or the [European Nucleotide Archive](https://www.ebi.ac.uk/ena/browser/search).
* **Direct querying.** For more advanced use, researchers and developers can write and run their own queries using external clients or scripts, for example through [database queries with R](https://solutions.posit.co/connections/db/getting-started/database-queries/).


Query results can be displayed in formats like **HTML**, **JSON**, **XML** or **CSV**, depending on the tool or user preference.

This Metroline page focuses on **SPARQL** as it is the standard query language for [RDF-based resources](https://en.wikipedia.org/wiki/Resource_Description_Framework), which are the foundation of the [semantic web](https://en.wikipedia.org/wiki/Semantic_Web) and [linked data](https://en.wikipedia.org/wiki/Linked_data). These concepts aim to make data interoperable and machine-readable across domains, enabling powerful integration and reuse. SPARQL’s standardised syntax and ability to retrieve both metadata and data from diverse sources make it uniquely suited for querying structured web resources. While SPARQL is prominent in the semantic web domain, there are many other query languages tailored to different data models, research fields, and application needs (see table below).

| Query Language | Purpose | Used In | Example Repositories                                                                                                                                                                       |
| --- | --- |---|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| Structured Query Language (SQL) | Querying relational databases | Tabular data, metadata | [Dryad](https://datadryad.org/), [Dataverse](https://dataverse.org/), [OpenAIRE](https://explore.openaire.eu/)                                                                             |
| SPARQL (for RDF/Linked Data) | Querying semantic web data | Ontologies, linked datasets | [UniProt](https://www.uniprot.org/), [OpenPHACTS](https://www.openphactsfoundation.org/platform/), [ELIXIR](https://datacatalogue.elixir-luxembourg.org/), [Bio2RDF](https://bio2rdf.org/) |
| GraphQL | Flexible API queries | Nested data structures | [EMBL-EBI](https://www.ebi.ac.uk/)                                                                                                                                                         |
| Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH) | Metadata harvesting | Repository interoperability | [Zenodo](https://zenodo.org/), [Figshare](https://figshare.com/), institutional repositories                                                                                               |
| JSONPath / XPath | Extracting data from JSON/XML | API responses, metadata | [Ensembl](https://www.ensembl.org/), [NIH](https://www.nlm.nih.gov/databases)                                                                                                              | 
| Cypher | Querying graph databases | Networked biological data | [Neo4j-based bioinformatics platforms](https://neo4j.com/)                                                                                                                                 |


## Why is this step important
Querying FAIR data is important because it is how you actually use the data. FAIR data is only valuable if it can be discovered, filtered, combined and analysed and querying is how this is made possible.
* **Find exactly what you need.** General search and filtering allow you to locate datasets or specific information quickly, without manually checking every record.
* **Explore and understand data.** Browsing and faceted search help you see what datasets exist, what they describe and how they are structured.
* **Combine and reuse information efficiently.** Advanced queries (e.g. SPARQL) let you combine and analyse data from multiple sources without moving large datasets.

## How to
This how-to gives information about querying FAIR resources, starting with simple browsing and filtering, moving to visual query tools, and advancing to federated multi-source querying with SPARQL.

### Step 1 Start with browsing and filtering
The easiest way to explore FAIR data is through a catalogue or FAIR Data Point interface, such as the 
[National Health Data Portal](https://www.healthdata.nl/), [FAIRsharing.org](http://fairsharing.org/) or Local FAIR Data Points (see [Metroline Step: Transform and expose FAIR (meta)data]({{site.baseurl}}/metroline_steps/transform_and_expose_fair_metadata) to learn more about FAIR Data Points). 

Here you can:
* **Browse datasets** and read metadata (description, owner, access conditions).
* **Search by keywords**, e.g. “muscular dystrophy” or “metabolomics”.
* **Filter results** by categories such as data type, disease, measurement, or year.

This helps you discover what exists before performing any (complex) queries.

{% include info-box.html type="example" title="Example step 1. Browse Wikidata for information about Inflammatory bowel disease" text="
To begin, we search for “Inflammatory bowel disease” in the search bar on [Wikidata.org](http://www.wikidata.org/). This leads us to the item [Q917447](https://www.wikidata.org/wiki/Q917447) which represents IBD in Wikidata. This item confirms that IBD is a recognised disease entity with structured metadata (such as classifications, related conditions, and identifiers) providing a solid starting point for further data exploration. We gained insight into what the catalogue contains, what metadata is available, and how we might formulate more specific queries to retrieve related information.
"%}

### Step 2  - Use visual or guided tools to construct queries
Some linked-data portals offer visual query builders that help users construct SPARQL queries without needing to learn the syntax. These tools automatically translate your selections (such as ticking checkboxes or choosing from dropdown menus) into SPARQL and run the query in the background. Such as [SPARQL Query builder](https://sparnatural.eu/) or [Wikidata Query Builder](https://query.wikidata.org/querybuilder/).

The results are typically displayed in a table or graph, making it easy to explore data without writing any code. This approach is ideal for users who want to go beyond simple browsing but aren’t yet ready to write SPARQL manually. 

{% include info-box.html type="example" title="Example step 2. Wikidata query builder – finding diseases associated with IL23R gene" text="
We want to continue our exploration of inflammatory bowel disease. In our first exploration of the Wikipedia page, we saw that IBD has genetic association to the gene [IL23R](https://www.wikidata.org/wiki/Q18051880). We want to query what other items this gene has genetic association to. In the [Wikidata query builder](https://query.wikidata.org/querybuilder/), we would then put “genetic association” under Property and “IL23R” as value and run the query. We get 6 results, as seen in the below table. 

| item                                                     | itemLabel                     |
|----------------------------------------------------------|-------------------------------|
| [wd:Q179945](http://www.wikidata.org/entity/Q179945)     | psoriasis                     |
| [wd:Q917447](http://www.wikidata.org/entity/Q917447)     | inflammatory bowel diseases   |
| [wd:Q32144272](http://www.wikidata.org/entity/Q32144272) | inflammatory bowel disease 17 |
| [wd:Q52849](http://www.wikidata.org/entity/Q52849)       | ankylosing spondylitis        |
| [wd:Q1472](http://www.wikidata.org/entity/Q1472)         | Crohn's disease               |
| [wd:Q1477](http://www.wikidata.org/entity/Q1477)         | ulcerative colitis            |

"%}

### Step 3 - Access the SPARQL endpoint to write and refine SPARQL queries
Note: The following steps are meant specifically for querying catalogues and repositories with SPARQL endpoint. If you are trying to query a catalogue based on another querying approach (e.g. SQL), these may not be directly applicable.

When you need more flexibility, connect directly to the SPARQL endpoint. Depending on the catalog you can use:
* A web-based interface (e.g. [YASGUI](https://yasgui.org/) or [Virtuoso Query Editor](https://www.genome.jp/sparql/linkdb)).
* External clients and libraries in Python, JavaScript, C#, or Java.

Try simple queries first, such as listing datasets or retrieving specific metadata fields.
As you become more comfortable, you can write more complex queries that join related information, apply filters, or aggregate data using SPARQL syntax.

{% include info-box.html type="example" title="Example step 3. : Use Wikidata query service" text="
We saw that the gene IL23R is associated with the disease psoriasis. Now, let’s take it a step further and run a more complex SPARQL query using the [Wikidata query service](https://query.wikidata.org/) to find which genes are associated with both Inflammatory Bowel Disease (IBD) and psoriasis.

See and run the query yourself at this link: [https://w.wiki/FsqH](https://w.wiki/FsqH)

The results show all genes linked to both psoriasis and an IBD condition. For each gene, you can also see the specific IBD disease it is associated with (such as Crohn’s disease or ulcerative colitis) providing a richer context for analysis.
"%}

### Step 4 - Combine multiple FAIR sources (federated queries)
When your question spans several data sources, use **federated querying**. This allows you to connect endpoints across registries, institutions, or countries, combining data without moving it.

In SPARQL, federated queries are implemented using the SERVICE keyword, which lets you call another SPARQL endpoint within your query. This enables seamless integration of data across different FAIR sources. See documentation on SPARQL federated querying [here](https://www.w3.org/TR/sparql12-federated-query/).


### Step 5 - Export and reuse query results
Query results can be downloaded in **multiple formats** (e.g. CSV, JSON, XML) for reuse in data analysis tools like Python, R, or Excel.
Depending on the query language and platform, it may also be possible to **integrate queries** directly into your workflow (for example, by calling SPARQL endpoints from Python or R scripts) so that results flow into subsequent analysis steps without the need to download files manually.

For human users, many catalog interfaces also provide **built-in visualisation** options, allowing results to be displayed as tables, graphs, or maps directly in the browser without additional tools.

{% include info-box.html type="example" title="Example step 5. Visualisation of query results" text="
In [Wikidata](https://www.wikidata.org), you can visualise query results in different ways by switching between different result views. Try to run the example query from above [https://w.wiki/FsqH](https://w.wiki/FsqH) and experiment with the various visualisation and export options.
"%}


## Expertise requirements for this step
To successfully perform this step, you may need help from the following experts:
* **Researcher/domain expert.** Uses domain knowledge to formulate queries and interpret results.
* **Data scientist.** Executes queries, processes results and handles federated queries.
* **Semantic expert.** Ensures correct use of metadata, vocabularies and ontologies for queries.

See [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team) for more information.

## Practical examples from the community
**[SPHN Data Exploration and Analysis System (DEAS)](https://sphn.ch/2024/10/17/sphn-launches-a-new-cross-hospital-data-query-tool-deas/)**. 
<br>DEAS is a cross-hospital federated query tool developed by the Swiss Personalized Health Network (SPHN) to replace the previous Federated Query System. It enables researchers to securely query aggregated clinical data from multiple Swiss university hospitals without moving patient-level data.

## Training
* [FAIR Cookbook – Exploring data with SPARQL (Python)](https://faircookbook.elixir-europe.org/content/recipes/applied-examples/fair-data-matrix/2-rose-metabolites-Python-RDF-querying-analysis.html). Explains how to use Python and SPARQL to query a FAIR-aligned RDF representation.
* [Apache Jena SPARQL Tutorial](https://jena.apache.org/tutorials/sparql.html). This SPARQL tutorial provides a concise introduction to the language, illustrating its major features through examples without aiming for full coverage.

## Suggestions
{% include metroline_steps/suggestions_development.html %}

