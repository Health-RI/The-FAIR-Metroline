---
title: Define access conditions
permalink: /metroline_steps/define_access_conditions
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***The “A” of FAIR – As Open as Possible, as Closed as Necessary. ([Landi et al. 2019](https://doi.org/10.1162/dint_a_00027))***
>
> {{ current_step.summary }}

## Short description 
According to the FAIR principles, data should be shared “[as open as possible and as closed as necessary](https://direct.mit.edu/dint/article/2/1-2/47/9998/The-A-of-FAIR-As-Open-as-Possible-as-Closed-as)” 
– open to allow reuse, but closed to protect privacy of the participants. In practice that means establishing the conditions 
under which researchers can get access to the data and how it can be reused, and deciding if the data can be further shared. 

* **Data Access Policy or Protocol.** The access conditions are described in the Data Access Policy and Protocol. 
A Data Access Policy outlines the overarching principles, rules, and responsibilities governing who can access data, under what conditions, and why (example: [CESSDA Data Access Policy](https://zenodo.org/records/6722000)). 
A Data Access Protocol provides the step-by-step instructions for implementing those rules in practice. 
For example, if data is not published open access, access to the data can be governed by the PI or other responsible party, 
or a Data Access Committee ([DAC](https://bmcmedethics.biomedcentral.com/articles/10.1186/s12910-020-0453-z)) if one is established for the study.

* **Data Usage Agreement and License.** The reuse conditions are specified in either a license or Data Usage Agreement (DUA). 
A license specifies a standard set of terms and conditions under which data can be shared and reused, whereas a DUA can be customised with specific conditions.

* **Metadata.** Information regarding both data access and reuse conditions should be specified in the metadata as well. 
This is why the metadata itself should always be published open access, allowing researchers to easily find information about data access and reuse conditions.

Access can be layered, which means that different components of the data are accessible under different conditions. 
For example, the metadata should be open access and available for reuse under a CC0 license, but the data itself could 
be published under restricted access, requiring explicit approval. 
Ideally, accessibility is specified in such a way that it is understandable by humans and machines, allowing machines 
to perform an appropriate action. Machine-readibility can be partly accomplished by specifying the accessibility in the metadata.

Note that this Metroline step does not describe the process of evaluating whether a data access request matches the defined 
access and reuse conditions. This process is quite complex and can vary per institute. To inquire about institute-specific 
procedures for the different Dutch University Medical Centers, please find specific contact details at the ELSI Serivcedesk.

## Why is this step important
Accessibility, much like Findability and Interoperability, plays a vital role in ensuring that data can be effectively reused. 
This step provides guidelines to define and document the conditions under which the data can be legally and ethically accessed 
and reused both by humans and machines.

Establishing a Data Access Policy or Protocol for your data is an important aspect of data stewardship and should ideally be done at the start of the project. 
One reason for this is that, in many cases, patients have to provide informed consent for data sharing and reuse prior to the start of data collection (see also 
[Metroline Step: Obtain informed consent]({{site.baseurl}}/metroline_steps/obtain_informed_consent)). The data access and sharing policy of your study should be 
tailored to your project and it should take the Data Governance Policy of your institute into account. It is also a core requirement in the study’s Data Management Plan (DMP).  

## How to
This How-to section is an overview of steps that can be taken to specify access conditions for your data. 
These conditions may range from open access with an appropriate usage licence to controlled access governed by a data access policy, 
with reuse conditions defined in a data usage agreement.
The exact execution of this Metroline step very much depends on the specific case/data for which access conditions have to be defined. 
It is advised to consult your local data stewardship support to figure out the best strategy.

In addition, as stated in the Short description, metadata that accompanies your data should always be published open access. 
Regardless of the sensitivity level assigned to the data, metadata should always be made publicly available in an appropriate repository or data catalogue, 
as it typically does not contain personal or sensitive information, unlike the data itself. Publishing metadata ensures that the existence of the dataset is Findable, 
even if access to the data itself is restricted. This practice aligns with the FAIR principles, particularly the "Findable" and "Accessible".

For information on how to register metadata, see [Metroline Step: Assess availability of your metadata]({{site.baseurl}}/metroline_steps/assess_availability_of_your_metadata), 
[Metroline Step: Register resource level metadata]({{site.baseurl}}/metroline_steps/register_resource_level_metadata), 
[Metroline Step: Register structural metadata]({{site.baseurl}}/metroline_steps/register_structural_metadata).

### Step 1 - Establish data sensitivity level
When setting up a data access policy, you need to establish data sensitivity. 
To do that be sure to identify any aspects that affect data sharing:

1. **Personal or sensitive data.** Check whether your data contains personal information or sensitive data.

   - Per GDPR definition, “Personal data are any information which are related to an identified or identifiable natural person.” 
   ([GDPR Art. 4 (1)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02016R0679-20160504))

   - Sensitive data are special categories of personal data whose misuse could result in serious negative consequences of the person. 
   Those include: “Data revealing racial or ethnic origin, political opinions, religious or philosophical beliefs, 
   or trade union membership, and the processing of genetic data, biometric data for the purpose of uniquely identifying a natural person, 
   data concerning health or data concerning a natural person's sex life or sexual orientation.” 
   ([GDPR Art. 9 (1)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02016R0679-20160504))

   - To help you decide whether your data contains personal data, you can use the 
   [assessment tools developed by Utrecht University](https://utrechtuniversity.github.io/dataprivacyhandbook/personal-data-assess.html#personal-data-assess).
   
2. **Copyright or patent application, intellectual property.** Check if the data needs any extra protection, besides privacy. 

   - For example, if the data is subject to copyright or patent, it might not be possible to publish open access. 

   - If there is a need to protect intellectual property, the data could be published with embargoed or restricted access.

3. **Legal base.** Check the legal base for the data access and reuse, such as:
    - Data Sharing Agreement with data provider or other applicable agreement/license if the study is reusing [secondary data](https://en.wikipedia.org/wiki/Secondary_research). 
    Some data providers might have limitations or conditions on the access of their data (e.g. repository’s term of service, 
    such as [Netherlands Cancer Registry](https://iknl.nl/international/data-request)).
   
    - Informed consent if the study collected participants’ data. Publishing personal data or sharing it for purpose of reuse must be covered in the Informed Consent.
    See also [Metroline Step: Obtain informed consent]({{site.baseurl}}/metroline_steps/obtain_informed_consent).
   
    - Public or legitimate interest can be also used as a legal base to share personal data, as long as the data access 
    is compliant with appropriate privacy protection regulations and does not override the interests and rights of data subjects. 
    ([GDPR Art. 6 (f)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02016R0679-20160504)) 
    This legal base was often used during the COVID-19 pandemic, where sharing health data was crucial for 
    the prevention and management of oubreaks and development of health policies 
    ([Liu et al., 2023](https://doi.org/10.1186/s12874-023-01927-3)). 

4. **Additional requirements**
    - Take into account the requirements and recommendations of your institute: Is there a general data access policy applicable 
    in your institute that should be taken into account or could be used as a basis?  
    To inquire about institute-specific procedures for the different Dutch university medical centers, please find specific 
    contact details at the [ELSI Serivcedesk](https://elsi.health-ri.nl/instituutspecifieke-informatie).

    - Check the requirements of your funder. For example, [NWO](https://www.nwo.nl/en/research-data-management) 
    and [ZonMW](https://www.zonmw.nl/en/open-access-policy) require the data resulting from their grants to be published as open as possible.
   
    - Consider the best practices in your research domain. Some research fields developed the minimal information to be shared 
   or interchange standards (such as [MIAPE](https://www.psidev.info/miape) in proteomics or [CDISC](https://www.cdisc.org/standards) for clinical data). 
   Such standards usually do not contain sensitive information, but the essential metadata and contextual details, 
   which support application of FAIR principles (particularly Findable and Reusable) even if the (raw) data itself is restricted. 
   Domains working with (sensitive) personal data have data catalogues and repositories available to support the “as open as possible, 
   as closed as necessary” mission (e.g. [ClinicalTrials.gov](http://clinicaltrials.gov/) for publishing the metadata).

### Step 2 - Decide the level of data access

Based on the established considerations in [Step 1](#step-1---establish-data-sensitivity-level), choose which data access level fits the data the best. 
There are different levels of accessibility, which cater to different data security needs.
Keep in mind that different levels can be applicable to different kinds of data, even within the same research project.
For example, raw data containing personal information should be under restricted (closed) access but the aggregated data 
used for conclusions could be published under open access if they don’t contain any personal information.

- **Open access:** Data is shared publicly for anyone to view, download and process. Some restrictions still might apply 
to what can be done with the data. These reuse conditions can be specified in a licence.

  - Open access is a rarely used access level for the sharing of human data. To use open access researchers need to ensure 
  that the shared data cannot be traced back to individual study participants. In other words the data needs to be anonymised, 
  which is difficult in practice.
  
- **Restricted access:** Also called controlled or mediated access. Access is restricted and data can only be shared with 
researchers whose data access request is reviewed and approved by the party in charge of governing data access 
(responsible PI, data manager or Data Access Committee). This access level requires a well-described Data Access Policy 
which specifies under which conditions the data can be shared.

  - Such access is applied when data contains personal or sensitive data which require compliance with specific conditions. 
  For example, reuse fits within the scope of the original Informed Consent, or data is accessed by non-profit organisations.
  
- **Registered access:** Registered access is a type of restricted access, when data is shared with researchers who are 
registered with the repository that serve the shared data (often via their institutional account) and who agree to follow the data usage policy.

  - One of the most common ways of sharing the data, through its deposition into a 
  [trusted repository](https://www.oclc.org/content/dam/research/activities/trustedrep/repositories.pdf) which then controls the data access.

- **Closed access:** This accessibility level could be applied in case of very personal or confidential information which 
is not fit for sharing or does not have explicit informed consent for sharing the data. The metadata is published in a 
data catalogue to ensure that others can find the information about the data, but the data itself is inaccessible. 
In such cases, the data owner might set up special forms of data sharing. For example, the owners could perform the 
reuser’s analysis within their own environment and only share the results.

- **(Extra level) Embargoed access:** When first deposited, data can be under embargo initially. This means that the 
accompanying metadata is published (and can be linked to the publication via the 
[Persistent Identifier](https://www.howtofair.dk/how-to-fair/persistent-identifiers/)), but the data itself is only 
accessible after a specified period of time. At the end of this embargo period, data will become available by either open, 
registered or restricted access, depending on the chosen accessibility level. This access control is often used when 
publishing an article and the researcher wants to protect intellectual property and prevent potential scooping.

There are tools, such as [Access levels and licences decision tree](https://rdr.tutorials.ru.nl/a/1945331-access-levels-and-licences) 
from Radboud Universiteit, to help you decide which access level is suitable for your data. Contact your institutional 
support (e.g. data steward) in case you have difficulties choosing the appropriate access level for your data.

Make sure that the decided level of data accessibility aligns with the established FAIR objectives 
(see [Metroline Step: Define FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives)).

### Step 3 -  Prepare necessary documentation

Based on the issues identified in [Step 1](#step-1---establish-data-sensitivity-level) that affect data sharing and chosen 
access level in [Step 2](#step-2---decide-the-level-of-data-access), documentation specifying the access and reuse conditions of the data need to be prepared.

In case of **open data access**, define additional reuse conditions in a licence (see also [RDM kit](https://rdmkit.elixir-europe.org/licensing)).

- Some institutes might have a default licence in place for reuse of open access data.

- In case a CC licence is applicable to your data, you can use the CC licence chooser
([Chooser - Creative Commons](https://creativecommons.org/chooser/)) to pick the appropriate licence.

For **restricted access** data a Data Access Policy and Data Use Agreement need to be defined.

- The **Data Access Policy** includes information about the access level (see [Step 2](#step-2---decide-the-level-of-data-access)), 
eligibility of access (who can access the data), acceptable scope of the data re-use, and other legal, privacy and ethics considerations.

- **Data Use Agreement** (DUA) is a contract which states the terms and conditions under which data can be shared and reused. 
Contrary to a licence, which is more general, the DUA can be customized to a specific access/reuse request. 
Institutions may also define Data Transfer Agreements (DTA) or Material Transfer Agreements (MTA, for biosamples). 
While these agreements are conceptually similar (define responsibilities, permitted uses, and restrictions), they may 
differ in scope or terminology depending on institutional policies. Always contact your local legal department for support.

Often, there are institutional templates available which can be used. The NFU (Dutch federation of university medical centers) 
also has some templates, available with the Health-RI servicedesk 
[here](https://elsi.health-ri.nl/categorieen/verzamelen-en-uitgeven-van-data-en-lichaamsmateriaal/waar-vind-ik-een-voorbeeld-van-0). 
Consult your institutional legal department when drafting contracts to ensure compliance with the law and regulations.

Since the DUA is only human-readable, consider specifying the reuse conditions also in a machine-readable format. 
For example, elements of the Data Use Ontology (DUO) or the Common Conditions of Use Elements (CCE) can be used to code reuse conditions.

- The [Data Use Ontology (DUO)](https://www.ga4gh.org/product/data-use-ontology-duo/) is developed by the 
- Global Alliance for Genomics and Health (GA4GH) and ‘provides a standard set of terms that can be used to tag datasets 
with use permissions’. You can browse the full list of DUO terms 
[here](https://www.ebi.ac.uk/ols4/ontologies/duo/classes/http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FDUO_0000001?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FDUO_0000001).

- [Common Conditions of Use Elements (CCE)](https://doi.org/10.1038/s41597-024-03279-z) are an alternative way to make 
the reuse conditions machine-readable. CCEs can be used to specify Digital Use Conditions (DUC), in which permissions or 
obligations related to a resource can be formulated. More information can also be found with [HDRUK](https://www.hdrmidlands.org.uk/wp-content/uploads/2024/10/DUC-CEE.pdf).  
You can view all elements in the tables provided in the publication ([Criterion type CCE terms](https://www.nature.com/articles/s41597-024-03279-z/tables/1) 
and [process type CCE terms](https://www.nature.com/articles/s41597-024-03279-z/tables/2)).  
The [DUC-CCE profiler](https://ducejprd.le.ac.uk/) is a practical tool to specify a DUC-CCE profile. A machine-readable export can be generated.

### Step 4 -  Publish data and metadata in a data repository

Make sure to choose a repository that supports the access level as defined in [Step 2](#step-2---decide-the-level-of-data-access).
If your data is published under restricted access, make sure to publish the metadata and the Data Access Policy and 
Data Use Agreement as open access documentation.

Use a data repository that is commonly used in your research domain to improve the findability of the data. 
Make sure that the chosen repository is a “[trusted repository](https://erc.europa.eu/news-events/news/new-guide-trusted-repositories-promoting-open-science-and-meeting-grant)”. Such repositories aim to support the FAIR and Open Access 
principles, ensuring the data is available and secure long-term, and use metadata standards. They also implement access controls, 
encryption and governance for sensitive data (such as pseudonymised personal information). Many are certified with 
[CoreTrustSeal](https://www.coretrustseal.org/) and [ISO 16363](http://www.iso16363.org/).

You can browse through the [Registry of Research Data Repositories (re3data)](https://www.re3data.org/), [FAIRsharing](https://fairsharing.org/) 
or [Data Repository Finder](https://data-repository-finder.ll.mit.edu/) to select a repository that fits your needs.

### Step 5 - Publish metadata in National Health Data Catalog (Optional)

If the metadata of the data repository doesn’t support metadata properties to describe the access conditions, consider 
publishing metadata in the [National Health Data Catalog](https://www.healthdata.nl/en/about-catalogue). 
This metadata schema includes the following properties which can be used to describe the access conditions of your data:

- **Access rights.** Describes the level of access of the dataset. You can choose one of the following options:

  - Open Data (Public): The dataset is available under general open data rules, such as those covered by the High Value Datasets Implementing Regulation.

  - Protected Data (Restricted): The dataset contains protected data and is accessible only under specific conditions, 
  as outlined in regulations like the Data Governance Act.

  - Sensitive Data (Non-public): The dataset includes resources that may contain sensitive or personal information, 
  falling under regulations such as the EHDS Regulation.

    - Since most (biomedical) data contain personal information, these datasets will need to take the value “non-public” for the access rights property.  
    Keep in mind here that, in case you adhere to the [HealthDCAT-AP](https://healthdataeu.pages.code.europa.eu/healthdcat-ap/releases/release-5/) 
    metadata schema, for “non-public” datasets the number of mandatory properties is higher than for “public” or 
    “restricted” datasets. So you will need to provide more information about your data in the metadata.
    
- **License.** The license indicates if and how data can be reused. For Open Access data Creative Commons licenses are often used. 
In case of restricted access data, the Geonovum [link for Non-open data](https://definities.geostandaarden.nl/dcat-ap-nl/id/waardelijst/licenties/niet_open) can be used.

- **Rights.** Additional information about the data access conditions can be specified. In case of restricted access you 
can add a link to the Data Use Agreement (human-readable) or encoded use conditions (machine-readable). 
See [Step 3](#step-3---prepare-necessary-documentation) for information about machine-readable access conditions.

## Expertise requirements for this step 

The following role from [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team)) is necessary for this step:

- **Researcher** - knowledge about the data/research, and the domain best practices, responsible for implementation of 
accessibility policy and following-through (e.g. granting access).

- **Data steward** - Implement or support the Researcher in implementation by providing knowledge about FAIR practices 
and applicable accessibility regulations.

- **Data curator** - support the Researcher in the implementation.

- **Legal expert** - advise the Researcher on legal aspects of data sharing and reuse.

## Practical examples from the community 
{% include metroline_steps/looking_for_examples.html %}

## Training
{% include metroline_steps/training_will_be_added.html %}

[Essentials 4 Data Support](https://danstraining.moodlecloud.com/course/view.php?id=11) 
([section V - LEGISLATION AND POLICY](https://danstraining.moodlecloud.com/course/section.php?id=86))

## Suggestions
{% include metroline_steps/suggestions_development.html %}
