---
title: Apply (meta)data model
permalink: /metroline_steps/apply_metadata_model
---

{% include assign_current_step.html %}

{% include development_status.html step=current_step %}


>***A meta(data) model is intended to ‘answer questions about a domain, improve understanding, and promote knowledge sharing; expose \[…] assumptions about a domain; promote communication among people developing a conceptual model, or among people who (later) use a conceptual model' [On the Philosophical Foundations of Conceptual Models](https://ebooks.iospress.nl/volumearticle/53687)***
>
> {{ current_step.summary }}

## Short description 
This step provides guidance on how to apply a metadata model to describe research resources (e.g. a model describing the topic, provenance, or type of datasets), and how to apply a data model to describe the information contained in those resources (e.g. a model capturing the structure and semantics of cohort data). Usually, both metadata and data models are annotated with ontologies (e.g. [DCAT](https://www.w3.org/TR/vocab-dcat-3/) for metadata, [ORDO](https://www.orphadata.com/ordo/) for data). This page outlines the differences between metadata and data models, their benefits, and the main methods and tools available to apply them effectively.

**Metadata models** describe information _about_ a resource. For instance, who created it, when it was collected, and what it is generally about (theme). These models help structure information like catalogues of datasets and their distributions, and also properties like authorship, licensing, and contact points. Using a metadata model to describe your resource improves its findability, allowing others to assess its potential for reuse.

**Data models** describe the structure and meaning of the actual content within the resource. For instance, how patient age, diagnosis, or lab results are represented and interrelated in a dataset. These models ensure that data values are understandable, interoperable, and reusable across different systems and domains. Applying a data model to your resource increase its clarity (i.e. based on the clear definitions of variables, units, and relationships provided by data models), consistency (i.e. as well-defined structures, data models reduce ambiguity and misinterpretation)  and interoperability (i.e. ontologised datasets can be easily integrated with other resources).

While some methods and tools focus specifically on either metadata or data, others have a general purpose and can be used for both layers. Typically, a tool for applying a model works by transforming or restructuring original data based on the model’s schema, and then annotating the restructured data with ontological terms.

For example, for a tool like FAIR-in-a-box (see also table below), this may involve reading data from a CSV file and transforming it into RDF that is compliant with a domain-specific model like the [CARE-SM](https://github.com/CARE-SM/CARE-Semantic-Model) (Clinical And Registries Entries Semantic Model) data model. In such cases, each element in the file—whether a column header or data value—is linked to a formal concept from the model. This enables the resource to be understood not just by humans but also by machines. A similar example involving a different approach is the use of an electronic data capture platform such as Castor. Here, users can configure mappings between data elements in the electronic case report form and a semantic data model. This is further described in [this paper](https://www.sciencedirect.com/science/article/pii/S1532046421002264).

Many metadata-focused tools also provide mechanisms to expose your resource online under clear access conditions, increasing its findability. This may include generating metadata records in RDF and publishing the metadata via catalogues or registries that support standard protocols such as SPARQL.

## Why is this step important
Applying the data model to your data and metadata model to your metadata is crucial for the next step: 
[Metroline Step: Transform and expose FAIR (meta)data]({{site.baseurl}}/metroline_steps/transform_and_expose_fair_metadata). It is a central step in the FAIRification process, in which you connect your (meta)data to elements of your (semantic) (meta)data model. By doing this, your (meta)data becomes machine-readable and interoperable.

The metadata and data that are structured with ontologies and follow standard schemas make it easier for other resources to find your resource’s metadata and understand its data. 

## How to
### Step 1 - Use specialised tools to apply and customise a FAIR (meta)data model to your resources
The following tools provide support in applying a (meta)data model to your resource(s).

<div class="table-container">
<table class="wrap">
  <tr>
    <th>Tool</th>
    <th>Description</th>
    <th>Metadata</th>
    <th>Data</th>
    <th>Key features</th>
    <th>Ref.</th>
  </tr>
  <tr>
    <td>FAIR Data Point</td>
    <td>A FAIR Data Point (FDP) exposes metadata according to the FAIR principles. The FDP reference implementation automatically includes the DCAT metadata schema, so when deploying this standard FDP, there will be a metadata schema in place.<br>This original metadata schema can be customised to a specific metadata schema by updating the shacls. For example, by making the FDP compliant to the Health-RI metadata schema, your metadata can be exposed to the National Health Data Catalogue in the correct format.</td>
    <td>✔</td>
    <td></td>
    <td>
        <ul>
            <li>Expose metadata in a FAIR manner</li>
            <li>Customisable to your own metadata model</li>
            <li>Machine-readable export formats (e.g., ttl, XML, JSON-LD)</li>
        </ul>
    </td>
    <td>
        <ul>
            <li><a href="https://fairdatapoint.readthedocs.io/en/latest/">FAIR Data Point Reference Implementation</a></li>
            <li><a href="https://github.com/Health-RI/FairDataPointSchemaTool">Health-RI FDP Schema Tool</a> GitHub</li>
            <li><a href="https://health-ri.atlassian.net/wiki/spaces/FSD/pages/891518999">Importing shacls in the FDP</a></li>
        </ul>
    </td>
  </tr>
  <tr>
    <td>FAIR-in-a-box</td>
    <td><a href="https://github.com/ejp-rd-vp/FiaB">FAIR-in-a-box</a> (adopted from <a href="https://github.com/ejp-rd-vp/cde-in-box">CDE-in-a-box</a>) is an automated tool to help make your data FAIR by enabling you to provide a CSV, containing your data in accordance with the embedded <a href="https://github.com/CARE-SM">CARE-SM model</a>, a model to represent healthcare patient information. The tool will transform your CSV into RDF and place it in a triple store connected to a FAIR data point.<br>It is possible the CARE-SM model does not fit your data. Luckily, FAIR-in-a-box is customisable: if you want to use another semantic model, you can edit the scripts and YARRRML that transform the CSV into RDF with that model.</td>
    <td>✔</td>
    <td>✔</td>
    <td>
        <ul>
            <li>Connects different software applications to automate the flow from creation, storing and publishing common data elements</li>
            <li>Automatic update of the metadata whenever something changes in the data</li>
            <li>Customisable to your own (meta)data model</li>
        </ul>
    </td>
    <td>
        <ul>
            <li><a href="https://github.com/ejp-rd-vp/FiaB">FAIR-in-a-box</a> Github</li>
            <li><a href="https://github.com/ejp-rd-vp/cde-in-box">CDE-in-a-box</a></li>
        </ul>
    </td>
  </tr>
  <tr>
    <td>Castor EDC</td>
    <td>Castor EDC is a cloud-based electronic data capture platform designed to support clinical research by enabling structured and standardised data collection. It facilitates FAIR data practices by supporting metadata annotation, interoperability standards (like CDISC and HL7 FHIR), and easy export to machine-readable formats. Researchers can design studies using a visual interface while embedding semantic annotations to enhance reusability. Castor contains a built-in FAIR layer that includes a pre-configured FAIR Data Point model. Using Castor, you can configure a semantic model to automatically convert eCRF data into FAIR-compliant RDF.</td>
    <td>✔</td>
    <td>✔</td>
    <td>
        <ul>
            <li>Structured data capture with form builder and controlled vocabularies</li>
            <li>Metadata annotation to support data findability and understanding</li>
            <li>Standards support, including CDISC, HL7 FHIR, and ODM for interoperability</li>
            <li>Machine-readable export formats (e.g. CSV, JSON, CDISC ODM XML) for accessibility and reusability</li>
        </ul>
    </td>
    <td>
        <ul>
            <li><a href="https://www.castoredc.com/">CastorEDC</a></li>
            <li><a href="https://www.sciencedirect.com/science/article/pii/S1532046421002264">Paper</a></li>
        </ul>
    </td>
  </tr>
  <tr>
    <td>Ontotext Refine</td>
    <td>With the Ontotext Refine tool, structured data can be manually mapped to a locally stored RDF schema in GraphDB. The visual user interface provides guidance in choosing the right predicates and types, defining datatypes and implementing transformation.</td>
    <td>✔</td>
    <td>✔</td>
    <td>
        <ul>
            <li>Provides an intuitive visual interface for mapping existing data to RDF schemas</li>
            <li>Allows for transformation of data from various formats into structured RDF data</li>
            <li>Customisable to your own (meta)data model</li>
        </ul>
    </td>
    <td>
        <ul>
            <li><a href="https://platform.ontotext.com/ontorefine/?_gl=1*bjzcvy*_ga*Njc0NTgyODMxLjE3NDU5MjM0MjA">Ontotext Refine</a></li>
        </ul>
    </td>
  </tr>
  <tr>
    <td>Molgenis</td>
    <td>MOLGENIS is a data platform for researchers to accelerate scientific collaborations and for bioinformaticians who want to make researchers happy. Its latest version, the MOLGENIS EMX2 FAIR scientific data platform, is the world's most customisable FAIR platform to find, capture, exchange, manage, analyse, and share data. MOLGENIS is free, open source, and simple to use.</td>
    <td>✔</td>
    <td>✔</td>
    <td>
        <ul>
            <li>Precisely model your data as a schema of tables, columns, and relationships</li>
            <li>Automatically generates a complete database application with advanced data entry forms, powerful data up/download options, and flexible query tools</li>
            <li>Fully customisable data structure, user interface, and layout</li>
            <li>Coders can plug in scripts, use PostgreSQL, GraphQL, batch web services or RDF interface to query/update the data, and use VueJS to create your own 'apps'</li>
        </ul>
    </td>
    <td>
        <ul>
            <li><a href="https://molgenis.org/">Website</a></li>
            <li><a href="https://github.com/molgenis/molgenis-emx2">Codebase</a></li>
            <li><a href="https://doi.org/10.1093/bioinformatics/bty742">Publication</a></li>
        </ul>
    </td>
  </tr>
</table>
</div>

## Expertise requirements for this step 
Applying metadata and data models effectively requires a mix of domain knowledge and technical skills. Ideally, teams should involve:
* **Domain experts.** Understand the research content and can guide the correct interpretation of terms and relationships.
* **(Meta)Data modellers and ontologists.** Can help select or customise the right models and ontologies to fit the data.
* **Data engineers or FAIR data stewards.** Are familiar with tools, knowledge representation formats, and transformation workflows.

While basic metadata tasks (e.g. filling in a dataset description using a web form) may not require a deep technical knowledge, more advanced modelling—such as mapping raw data to ontological terms or generating knowledge graphs—typically benefits from the experience described above. 

## Practical examples from the community
**FAIR Data Point**<br>
The UMCs in the Netherlands are either in the process of setting up or already have a local FDP. For example, see [Amsterdam UMC’s FDP](https://fdp.healthdataspace.amsterdam/). Health-RI provides [guidance](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279150593) for setting up the FDP for the National Health Data Catalogue. 

**VASCA registry**<br>
Implemented the CDE semantic data model and implemented the DCAT metadata schema and EJPRD metadata schema.
For more information see the following publications:
* [The de novo FAIRification process of a registry for vascular anomalies](https://doi.org/10.1186/s13023-021-02004-y)
* [De-novo FAIRification via an Electronic Data Capture system by automated transformation of filled electronic Case Report Forms into machine-readable data](https://doi.org/10.1016/j.jbi.2021.103897)

**PRISMA**<br>
Implemented the Health-RI metadata schema in the FDP to apply the Health-RI core metadata schema to metadata from the [PRISMA study](https://www.prisma-studie.nl/). You can view PRISMA metadata in the [Radboudumc FAIR Data Point](https://fdp.radboudumc.nl/catalog/fa48b19f-f390-4023-872d-f0f0024bfcec). 

## Training
* [A portal to (Meta)data](https://zenodo.org/records/15676294), a presentation-lecture on gathering metadata elements at different levels.

## Suggestions
{% include metroline_steps/suggestions_released.html %}
