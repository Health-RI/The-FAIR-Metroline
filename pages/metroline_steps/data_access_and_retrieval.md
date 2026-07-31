---
title: Data access and retrieval
permalink: /metroline_steps/data_access_and_retrieval
---

{% include glossary_tooltips.html %}
{% include assign_current_step.html %}
{% include development_status.html step=current_step %}
{% include metroline_steps/step-metadata.html step=current_step %}

>***Data locked away benefits no one, but when data is shared responsibly and carefully with bright minds everywhere, we get results that will give us all a healthier future. ([UK Biobank is safely sharing health data to drive medical research](https://www.theguardian.com/science/2025/apr/18/uk-biobank-is-safely-sharing-health-data-to-drive-medical-research))***
>
> {{ current_step.summary }}

## Short description 
Data must be acquired responsibly and efficiently. This includes identifying how to access and retrieve the data and how to ensure the data meets legal, ethical, and technical requirements. This page outlines the steps and considerations involved in acquiring data.

This guidance is written from the perspective of a data user (data re-user), for example, a researcher aiming to find and obtain existing datasets for analysis or FAIRification. It complements the [Metroline step: Define access conditions]({{site.baseurl}}/metroline_steps/define_access_conditions), which is written from the perspective of a data holder who determines how data can be shared.

This page outlines the steps and considerations involved in acquiring data.

## Why is this step important
Correct and responsible data access and retrieval ensures you:
* **Comply with regulations.** You confirm that the data can be used legally and ethically, meeting requirements such as GDPR.
* **Safeguard data integrity.** Secure transfer methods and integrity checks (e.g. checksum) make sure the data are complete and unchanged.
* **Ensure controlled access.** By following agreed procedures, you make it possible for authorised users to obtain the data under the correct conditions.
* **Enable reproducibility.** Documenting where the data came from and how it was retrieved allows the process to be repeated if needed (e.g. queries, APIs, permissions, or filtering steps used). This ensures that others can repeat the retrieval process accurately, making the data truly reproducible.

## How to
### Step 1 - Identify the data source
Locate a trusted source that holds the dataset of interest. This may include:
* Certified or trusted data repositories (providing metadata and data) and data catalogues (providing metadata with references to data). These can be subject-specific, (e.g. [BBMRI-ERIC Sample and Data Portal](https://www.bbmri-eric.eu/bbmri-sample-and-data-portal/), institutional (e.g. [Radboud Data Repository](https://data.ru.nl/)) or national (e.g. [National Health Data Portal](https://www.healthdata.nl/en))
* Electronic health or patient record systems (e.g. HiX)
* Biobanks or cohort studies with structured datasets (e.g. [lifelines collection](https://data-catalogue.lifelines.nl/@molgenis-experimental/molgenis-app-lifelines-webshop/dist/index.html#/shop/))
* Institutional research data catalogues (e.g. [UMCG research data catalogue](https://umcgresearchdatacatalogue.nl/UMCG/catalogue))

Verify that the source provides persistent identifiers, rich metadata, and clear licensing information. 

When possible, choose sources that:
* Provide **persistent identifiers (PIDs)** for the dataset ([FCB046 - Identify resolution services](https://faircookbook.elixir-europe.org/content/recipes/infrastructure/id-resolution.html))
* Supply **rich metadata** describing the dataset’s content, provenance and license
* Are indexed in trusted registries or catalogues
* Have a clear record of data quality (e.g. accuracy, completeness, consistency and timelines, which indicate that the data are reliable for analysis). See e.g. [Quality Control and Assessment – Multi-omics Toolbox (MOTBX)](https://motbx.eatris.eu/resource-category/quality-control-and-assessment/).
* Prefer sources where data and metadata meet verifiable FAIR characteristics, such as:
  * Use of open or widely adopted file formats (e.g. CSV, JSON, RDF, or domain standards)
  * Availability of machine-readable metadata
  * Use of controlled vocabularies or ontologies where applicable
  * Clear provenance and licensing information

  Where possible, consult FAIR maturity indicators or assessment tools (see [Metroline step: Pre-FAIR assessment]({{site.baseurl}}/metroline_steps/pre_fair_assessment)) to evaluate how well a dataset aligns with FAIR principles.

{% include info-box.html type="info" title="What if the source does not provide a PID?" text="
If the source does not have a PID, for instance in case of extractions of electronic health or patient records, you can share the queries used to extract the data. In that case, others can use the queries to replicate the dataset. 
"%}

{% include info-box.html type="example" title="Example - step 1" text="
A researcher studying cardiovascular disease wants to reuse genomic and clinical data from a biobank catalogue to perform a secondary analysis.
"%}

### Step 2 – Determine access requirements
Check if access is public, restricted, or non-public. The type of data often determines the access level: very sensitive or personally identifiable data are more likely to require restricted or non-public access.
* **Public.** Data is openly available without restrictions, often under open license (e.g. [CC-BY](https://creativecommons.org/licenses/by/4.0/), [CC0](https://creativecommons.org/public-domain/cc0/)). Typically includes aggregated, anonymized, or non-sensitive datasets.
* **Restricted.** Data access requires registration or agreement to conditions (e.g. academic/non-commercial use only). 
* **Non-public.** Data is not openly accessible due to privacy, ethical, legal, or commercial constraints. Access typically requires formal approval (e.g. via a data access committee).

Once you found a dataset, you need to check the license and usage rights to see if you can actually reuse the data. For more information on data licenses, see [here](https://book.the-turing-way.org/reproducible-research/licensing/licensing-data).

Depending on the access level and sensitivity, you may need:
* Institutional approval
* Ethics board or data access committee clearance
* Legal agreements such as Data Agreements (e.g. Processing, Transfer, Usage, Sharing etc.). In addition, independent of licenses or agreements, data may be subject to applicable legislation (e.g. GDPR for personal data), which must be assessed before access or transfer.

If you would like to know more about Access conditions and how they are defined, please refer to [Metroline step: Define access conditions]({{site.baseurl}}/metroline_steps/define_access_conditions).

{% include info-box.html type="example" title="Example - step 2" text="
The researcher discovers that the dataset is non-public and must submit an application to a data access committee and sign a Data Use Agreement before access is granted.
"%}

### Step 3 – Choose a retrieval method
Select an appropriate method, this may depend on dataset’s size, sensitivity and intended use:
* **Application Programming Interfaces.** Automated and scalable, ideal for frequent or programmatic retrieval. This can be REST, GraphQL or other API types, often returning JSON, CSV or RDF. APIs are ideal for automation and integrating retrieval into workflows.
  <br>Some data infrastructures support hybrid access, where metadata or filtered results are retrieved via an API, and the corresponding files or bulk data are downloaded separately (e.g. via HTTP(s), cloud storage or (s)FTP). This approach is useful when querying large datasets to identify subsets before initiating bulk transfer, optimising both performance and bandwidth. 
* **Query language access.** Some repositories allow data to be retrieved by running queries directly against a database or knowledge graph ([FCB070 - FAIR and Knowledge graphs](https://faircookbook.elixir-europe.org/content/recipes/introduction/FAIR-and-knowledge-graphs.html)).
  * [SQL](https://www.w3schools.com/sql/sql_intro.asp). Used for structured data in relational databases.
  * [SPARQL](https://www.w3.org/TR/sparql11-query/). Used for querying RDF/linked data endpoints, enabling retrieval of highly specific variables, entities or relationships ([FCB040 - Exploring data with SPARQL](https://faircookbook.elixir-europe.org/content/recipes/applied-examples/fair-data-matrix/2-rose-metabolites-Python-RDF-querying-analysis.html)).
* **Web interface.** Manual downloads from portals, useful for small datasets or exploratory use. These direct downloads are typically suitable for small-to-medium datasets where scalability is not required. They offer a quick and intuitive way to inspect data structure and content before deciding whether a large-scale or automated retrieval is needed. Example portals which offer such an interface include:
  * [GEO (Gene Expression Omnibus)](https://www.ncbi.nlm.nih.gov/geo/) for genomic data
  * [BBMRI-ERIC Directory](https://directory.bbmri-eric.eu/ERIC/directory/#/catalogue) for Biobank metadata
  * [dbGaP](https://www.ncbi.nlm.nih.gov/gap) for genomic + phenotype data
  * [Zenodo](https://zenodo.org/) for general research data
* **Secure file transfer.** For large and sensitive datasets, use secure and authenticated transfer tools, such as:
  * [SURFfilesender](https://filesender.surf.nl/)  
  * [SFTP](https://learn.microsoft.com/en-us/connectors/sftpwithssh/) ([FCB014 - transferring data with SFTP](https://faircookbook.elixir-europe.org/content/recipes/accessibility/sftp.html))
  * [Aspera](https://www.ibm.com/products/aspera) ([FCB015 - Downloading data with Aspera](https://faircookbook.elixir-europe.org/content/recipes/accessibility/aspera.html))
* **Secure processing environments (SPEs).** In some cases, data cannot be downloaded due to sensitivity. Instead, access is provided within a secure remote environment where data can be analysed but not exported. This approach is common for highly sensitive data (e.g. health or population data) and represents a model where access is granted without full data transfer.

For datasets hosted on large-scale cloud platforms (e.g. Azure), data access may be provided through dedicated services like object storage (e.g.Azure Blob), cloud-hosted APIs, or cloud data warehouses. These platforms support scalable, high-performance data access and are often used for storing large genomics, imaging, or real-world data. Depending on the configuration, you may retrieve data using authenticated URLs, SDKs, or cloud-native tools (e.g. aws s3 cp, gsutil, or Azure CLI). Always ensure you understand the access permissions, egress costs and security settings when retrieving data from cloud environments.

{% include info-box.html type="example" title="Example - step 3" text="
After approval, the researcher learns that the data cannot be downloaded directly but must be accessed via a secure processing environment, where analysis can be performed remotely.
"%}

### Step 4 – Data retrieval and transfer considerations
Consider the following:
* **File format and structure.** Determine whether files are in CSV, JSON, RDF, XML, HDF5, imaging formats or other, as this will affect processing. Some formats (e.g. many small files vs. one large archive, plain text vs. compressed formats (.zip, .tar.gz)) can affect download time, transfer reliability (see Step 5 below for more information on checking integrity) and whether special tools are needed to retrieve or unpack the data.
Representation may also vary:
  * Flat tables (e.g. CSV, TSV) are commonly used for structured tabular data and are easy to process in spreadsheets or statistical tools.
  * Graph-based formats (e.g. RDF, JSON-LD) represent complex relationships between entities and are ideal for semantic data or knowledge graphs. The choice of representation will affect downstream integration and analysis.
* **Size and speed of transfer.** Large files may require dedicated bandwidth or scheduled transfer.
* **Retry/resume capabilities.** For bulk transfer of multi-gigabyte datasets such as medical or omics datasets, use tools that can resume interrupted transfers instead of restarting (e.g. [Aspera Connect](https://www.ibm.com/docs/en/aspera-on-cloud?topic=admin-aspera-connect-transfer-client), [Globus](https://www.globus.org/data-transfer), [rsync](https://en.wikipedia.org/wiki/Rsync), [wget/curl](https://www.warp.dev/terminus/curl-vs-wget) with resume flags). This saves time and reduces the risk of incomplete downloads.
* **Encryption in transit.** Sensitive datasets should always be encrypted during transfer with access controls.
* **Remote access without transfer.** In some cases, data cannot be moved due to size or sensitivity. Access may instead occur via secure remote environments (e.g. virtual machines, data enclaves, or cloud-based analysis platforms) where analysis is performed without downloading the data locally. Logging and documentation of the retrieval process still apply.

Keep logs of the retrieval process, including timestamps, tools used, and any transfer issues.

From a data user perspective, these technical characteristics should be evaluated in terms of whether the data is fit for your intended use. This includes whether:
* The file formats can be opened and processed with available tools (including domain-specific or proprietary software if needed)
* The structure and level of detail match your research question
* Sufficient metadata and documentation are available to correctly interpret the data

{% include info-box.html type="example" title="Example - step 4" text="
The researcher accesses the environment, exports approved results, and logs the tools and queries used for transparency.
"%}

### Step 5 – Validate and store safely
Verify data integrity and store it in a secure, access-controlled environment with appropriate metadata.

After retrieval, you should:
* **Verify integrity.** Use [checksums](https://pomfort.com/article/managing-data-part-one-data-integrity-with-checksums-and-hashes/) to confirm that the files match the originals (requires the original hash to be provided).
* **Ensure privacy safeguards.** When handling sensitive personal data, confirm that appropriate privacy-preserving techniques such as pseudonymisation (removal of direct identifiers) or anonymisation (irreversible data masking) have been applied in compliance with GDPR or local regulations. In case of unexpected/incidental findings (e.g. patient’s names), check policies for the appropriate response.
* **Store securely.** Place data in an access-controlled environment that complies with institutional and legal standards. Also check if you comply with data usage requirements and agreements if any were made. If using sensitive information, make sure you use proper encryption.
* **Preserve metadata.** Place dataset documentation, provenance records and retrieval notes alongside the data.
* **Back up appropriately.** Follow institutional or project-level backup policies.
* **Register (meta)data in public registries.** To support findability, consider registering the (meta)data in open platforms (e.g. [GEO](https://www.ncbi.nlm.nih.gov/geo/)).  

{% include info-box.html type="info" title="What is a checksum?" text="
A checksum is a short digital code that works like a fingerprint for a file, letting you verify that the data hasn’t changed or been corrupted during transfer.
"%}

{% include info-box.html type="example" title="Example - step 5" text="
The researcher verifies file integrity using checksums and stores derived data and metadata in a secure institutional environment.
"%}

## Practical examples from the community 
{% include metroline_steps/looking_for_examples.html %}

## Training
Training on data reuse and access is crucial to meet FAIR principles and legal requirements. To acquire and retrieve data responsibly, researchers need to understand both the **technical processes** (e.g. secure file transfer, APIs, data validation) and the **legal/ethical frameworks** (e.g. data licenses, consent, institutional approvals). Several training resources are available to build these competencies:
* **ELIXIR Luxembourg – Practicalities of Data Handling.** A [presentation](https://doi.org/10.5281/zenodo.4068228) covering key topics in secure data transfer, storage, encryption and checksums. 
* **GOBLET – Bioinformatics Introductory Module.** An introductory [self-study course](https://www.mygoblet.org/training-portal/materials/bioinformatics-introductory-module/) designed for life science students to learn about databases, sequence data, expression analysis, and basic bioinformatics tools.
* **FAIR Cookbook.** Offers practical recipes on data access and secure transfer methods (e.g. [FCB014 - Transferring data with SFTP](https://w3id.org/faircookbook/FCB014), [FCB015 - Downloading data with Aspera](https://w3id.org/faircookbook/FCB015)).
* **RDMkit – Data Transfer Guide.** Covers the practical and legal aspects of transferring research data, with emphasis on GDPR compliance and technical integrity checks. See [Your tasks: Data transfer](https://rdmkit.elixir-europe.org/data_transfer.html).

Additionally, some more specific trainings on regulations such as the GDPR in the European context are useful to have the overview of legal requirements for data access and retrieval. 
* **GDPR 4 Data Support - RDNL.** The [GDPR 4 Data Support (GDPR4DS) course](https://researchdata.nl/gdpr-4-data-support/) is an introductory course designed for data supporters who want to understand more about the General Data Protection Regulation (GDPR) in the context of research and want to strengthen their role in protecting personal data.  

Training should also cover
* Data quality assessment (e.g. completeness, consistency, bias)
* Intellectual property and collaboration with private parties, including licensing and data ownership considerations
* Emerging initiatives such as data quality labels (e.g. [QUANTUM framework](https://quantumproject.eu/quantum-academy/)) may provide structured approaches to assessing and communicating dataset quality (note: still under development).

## Suggestions
{% include metroline_steps/suggestions_development.html src=page.title%}
