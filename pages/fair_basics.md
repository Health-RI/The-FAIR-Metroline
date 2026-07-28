---
title: FAIR basics
permalink: fair_basics
---

Vast amounts of valuable digital data and other resources are created every day. Yet many remain underused because they are difficult to discover, access, combine or interpret. Resources may be poorly described, stored in incompatible formats or lack clear information about how they can be used.

The FAIR principles ([Wilkinson et al., 2016](https://doi.org/10.1038/sdata.2016.18)) aim to make digital objects **F**indable, **A**ccessible, **I**nteroperable and **R**eusable by both humans and computers. Digital objects include data, tools and other research outputs. The FAIR Metroline focuses primarily on data and tools.

A key concept within FAIR is **metadata**, which is information about a digital object. For example, a dataset may contain information on the gender and diagnosis of 50 patients. The metadata for that dataset may include the study title, the contact person, the study start date and the conditions under which access can be requested. 

When publishing data, the aim is to make it “as open as possible, as closed as necessary”. FAIR data is not the same as open data. Data may be FAIR while access remains restricted for reasons such as privacy, confidentiality or intellectual property rights. The video below from Maastricht University explains the relationship between FAIR and Open Data.

<div style="display: flex; justify-content: center; margin: 2em auto;">
   <iframe
     width="500"
     style="aspect-ratio: 16 / 9;"
     src="https://www.youtube.com/embed/5OeCrQE3HhE"
     allowfullscreen>
   </iframe>
</div>

While privacy, confidentiality, intellectual property rights and other considerations may require access to data to be restricted, their metadata can often be published openly. Metadata allow others to discover that the data exist, understand what they contain and, where appropriate, request access from the data holder. Even when data is not publicly available, making them FAIR remains valuable because it improves their management and supports their future use and reuse.

Each FAIR principle addresses a different aspect of enabling the discovery, access, integration and reuse of data.

{% include image_with_caption.html 
   src="/assets/img/fair_basics.png" 
   alt="FAIR principles"
   size="large"
   caption="" %} 

* **Findable.** To reuse data, it must first be possible to discover it. FAIR therefore requires data to be accompanied by rich metadata so that they can be found by both humans and computers. Data catalogues typically expose metadata, making data easier to find.
* **Accessible.** Once data have been found, it should be clear how they can be accessed. FAIR requires data and metadata to be retrievable through standardised communication protocols, while allowing access controls where necessary. Access may be open, restricted or require authorisation, but the conditions for access should be transparent. Metadata should remain accessible even if the data themselves are no longer available.
* **Interoperable.** Interoperability requires data to use standardised formats and shared vocabularies so that they can be combined with other data and interpreted consistently. Using common formats and vocabularies helps ensure that data can be exchanged and understood correctly. Interoperability is often considered the most challenging aspect of FAIR implementation.
* **Reusable.** To support reuse, data should be accompanied by sufficient information about their origin, context and quality. This includes provenance information, which describes how the data were created, and a licence, which specifies how the data may be used and shared. Together, this information helps others understand, evaluate and reuse the data appropriately.

FAIR is straightforward in principle but can be challenging to implement in practice. This introduction focuses on the core concepts. For more detailed guidance on topics such as identifiers, metadata standards and semantic interoperability, explore the Scenarios and Guidance sections.

Want to know more? 
* See the FAIR guiding principles by the [GO FAIR Foundation](https://www.gofair.foundation/fair-principles) 

Want to know how FAIR your data are?
* Assess your data's FAIRness using a test from, for example, [Metroline Step: Pre-FAIR assessment]({{site.baseurl}}/metroline_steps/pre_fair_assessment)