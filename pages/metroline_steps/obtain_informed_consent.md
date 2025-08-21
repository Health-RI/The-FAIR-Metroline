---
title: Obtain informed consent
permalink: /metroline_steps/obtain_informed_consent
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Obtaining consent is not only an ethical obligation, but also a legal compulsion. [Informed Consent: An Ethical Obligation or Legal Compulsion?](https://pmc.ncbi.nlm.nih.gov/articles/PMC2840885/)***
>
> {{ current_step.summary }}

## Short description
Informed consent (IC) is the process by which a patient voluntarily agrees to a medical procedure, treatment, or participation in research after being fully informed of the relevant details. Collecting data as well as its reuse for scientific purposes typically requires participants' IC. To align with the FAIR principles, it is essential that these data-sharing practices are explicitly addressed in the informed consent form. Additionally, consent may also be required for activities such as data archiving and linkage to external registries.

Many different forms of IC exist. The image below highlights some variants of informed consent and how they are (generally) related.

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/obtain_informed_consent/consent_types.png" 
   alt="Informed consent"
   size="large"
   caption="" %}

This step provides considerations and resources for setting up an Informed Consent Form (ICF) and a Subject Information Sheet (SIS) that align with the FAIR principles. It assumes you are aware of whether your study falls under the WMO (Medical Research Involving Human Subjects Act / Wet medisch-wetenschappelijk onderzoek met mensen) or whether your study is considered non-WMO. If you are unsure, visit the [CCMO website](https://english.ccmo.nl/investigators/legal-framework-for-medical-scientific-research/your-research-is-it-subject-to-the-wmo-or-not), consult the [ELSI Servicedesk](https://elsi.health-ri.nl/categorieen/toetsing-van-onderzoek/wanneer-medisch-onderzoek-wmo-plichtig) (website available in Dutch, but questions can be asked in English as well) or seek assistance from your local experts

To ensure a dataset can efficiently be accessed, processed, and utilised by machines with minimal manual intervention (i.e. machine-actionable data), information from the IC must also be available in the metadata, making it machine-actionable. This enables automated systems to interpret consent terms to a certain extent, facilitating the ethical and legal sharing of data across systems while safeguarding participant rights. Making an IC more machine-actionable, will be addressed in another Metroline step (future plans).

## Why is this step important 
The FAIR principles aim to make data useful for immediate research and future purposes, such as replication, validation, and meta-analysis, while safeguarding participants' privacy and rights. Therefore, informed consent must address both current and potential future data use in compliance with GDPR requirements. This step offers guidance on creating an effective informed consent form (ICF) and subject information sheet (SIS) to meet these standards.

## How to 
IC is an essential component for collecting and reusing data. To ensure an IC complies to laws and regulations it has to be checked. Research that falls under the WMO must undergo a review by an accredited Medical Research Ethics Committees (MREC) or the Central Committee on Research Involving Human Subjects (CCMO). Non-WMO studies should be reviewed by an ethical committee, such as an MREC. Research is not allowed to start without a positive decision of the appropriate reviewing committee. 

If your study is subject to the WMO go to [Step 1](#step-1---follow-wmo-informed-consent-requirements-for-data-reuse) and for a non-WMO study go to [Step 2](#step-2---follow-non-wmo-informed-consent-requirements-for-data-reuse). [Step 3](#step-3---address-additional-fair-consent-requirements-for-data-sharing-linkage-and-retention
) describes additional paragraphs relevant for FAIR, which you should consider for your ICF and SIS. In [Step 4](#step-4---address-special-consent-considerations-for-cohorts-deceased-participants-and-other-cases
), issues you may encounter in specific cases are highlighted, for example, when you’re setting up a cohort study.  

{% include info-box.html type="warning" text="
While this guidance aims to provide up-to-date and accurate information, you should always check with your local privacy and legal specialists! Also, where examples are provided, always check the actual templates to ensure you have the most up-to-date information.
"%}


### Step 1 - Follow WMO informed consent requirements for data reuse
The CCMO has published SIS models for both adults and children and **strongly** recommends their usage. The models are available in both [English](https://english.ccmo.nl/investigators/standard-research-file-for-research-subject-to-the-dutch-wmo-act/e-information-research-subjects/e1-e2.-information-sheet-and-consent-form-research-subjects) and [Dutch](https://www.ccmo.nl/onderzoekers/standaardonderzoeksdossier/e-informatie-onderzoeksdeelnemers/e1-informatiebrief-en-toestemmingsformulier-onderzoeksdeelnemers). The MREC/CCMO reviewing committee only assesses the Dutch SIS and ICF. However, if a participant who is not adequately fluent in Dutch is asked to participate in a study, the information must be provided in a language the participant is proficient in.

**Subject Information Sheet (SIS)**

The CCMO’s SIS has the following item relevant for FAIR:
* Can we use your data and body material for other research?

Here, it is crucial that the researcher clearly explains the potential purposes for which collected data or materials may be reused. While these purposes can be broader than the original study's aim, they should not be overly vague. For instance, "cancer research" or “healthy ageing“ might be acceptable, but "any research" would not. If stored data/material is used for a different purpose than indicated the SIS, participants must give permission again or usage is not permitted.

**Informed Consent Form (ICF)**

The CCMO’s SIS contains an ICF as an Appendix. The following items are relevant for FAIR and should be used as provided:
* I give consent to store my data to use for other research, as stated in the information sheet.
* I give consent to have my (remaining) body material stored for use in other research, as stated in the information sheet. The body material is stored for this purpose for another [xx] years.

_Participants under 16 years old (children)_

For participants who are younger than 16, parents or guardians must provide signed informed consent on behalf of the child. A consent form for parents or guardians is included in the appendices of the [CCMO website](https://english.ccmo.nl/investigators/standard-research-file-for-research-subject-to-the-dutch-wmo-act/e-information-research-subjects/e1-e2.-information-sheet-and-consent-form-research-subjects/e1-e2a-template-subject-information-sheet-for-research-subjects-16-years-of-age-children). The accompanying information letter should be updated to address the parents or guardians, including a statement granting permission for the child.
   * **Children under 12 years old.** Children are informed about the study using a discussion guide ([model bespreekblad](https://www.ccmo.nl/publicaties/formulieren/2019/10/14/e1-e2-model-bespreekblad-voor-kinderen-tot-12-jaar)), which can be found on the CCMO website. Once a child reaches the age of 12, they must also provide written consent. However, parents or guardians are not required to sign another consent form.
   * **Children aged 12-16 years old.** Both the child and their parents or guardians must give consent. Once the child turns 16, written consent of the parents or guardians is no longer necessary.

_(Temporarily) incapacitated adults_

Includes individuals with conditions such as advanced dementia, significant intellectual disabilities, comatose states, or severe mental illnesses. The appendices of the CCMO template contain a consent form for legal representatives or authorised individuals who may sign for the participant. These individuals may include a curator, mentor, spouse, registered partner, parents, adult children, or siblings.

If the subject becomes temporarily incapacitated, consent must still be obtained from the individual whenever possible. If the individual later regains the ability to provide consent, they may do so at that time. The information letter should clearly outline how data collected during the period of incapacity will be handled, specifying whether the data will be kept for the study or destroyed.

Next, proceed to [step 3](#step-3---address-additional-fair-consent-requirements-for-data-sharing-linkage-and-retention).

### Step 2 - Follow non-WMO informed consent requirements for data reuse
First, check with your local MREC which SIS and ICF templates they have available and accept. Verify whether these templates contain FAIR components. The ELSI Servicedesk provides [standardised text](https://elsi.health-ri.nl/sites/elsi/files/2024-10/Alinea%20hergebruik%20DEF.docx) that can be used in the SIS and ICF (only available in Dutch). 

**Subject Information Sheet (SIS)**

Translated to English, the SIS needs information concerning the following topics (see the standardised text for the full details):
* May we use your data <if applicable> [and biomaterial] for other scientific research?

Add such a section to your SIS to ensure it allows for FAIR usage of data and materials.

Here, it is crucial that the researcher clearly explains the potential purposes for which collected data or materials may be reused. While these purposes can be broader than the original study's aim, they should not be overly vague. For instance, "cancer research" or “healthy ageing“ might be acceptable, but "any research" would not. If stored data/material is used for a different purpose than indicated the SIS, participants must give permission again or usage is not permitted.

**Informed Consent Form (ICF)**

Translated to English, the ICF needs to include the following:
* I consent to my data <if applicable> [and (residual) bodily material] being used for other scientific research, as outlined in the information letter.

_Participants < 16 years old (children)_

If the MREC requires you to use a specific SIS/ICF template for children, check whether it contains FAIR components. If it does not contain FAIR components, consider reusing the entry described above and consult your local experts, such as a data protection / privacy officer, for exact integration before subjecting the documents for review .

### Step 3 - Address additional FAIR consent requirements for data sharing, linkage and retention
The information below is translated from Amsterdam UMC’s [Dutch Non-WMO template](https://metc.amsterdamumc.org/wp-content/uploads/2024/09/E1E2.-Niet-WMO-model-informatiebrief-onderzoek-niet-WMO-versie-d.d.-15-08-2024.docx) and the ELSI Servicedesk’s [standardised text](https://elsi.health-ri.nl/sites/elsi/files/2024-10/Alinea%20hergebruik%20DEF.docx). If you decide to use any of these passages, please verify with your local experts.

#### 3.1 Sharing data with parties outside of the EU
**Subject Information Sheet (ELSI Servicedesk)**

* \<if applicable> If we collaborate with countries outside the European Union
    * In this study, we send encoded data [and biological material] to countries outside the EU because [explain the reason here]. It is [also] possible that the data will be shared outside the EU for other scientific research.      
      We only share your data [and biological materials] with researchers outside the EU if they handle your data [and biological materials] as securely as required for researchers within the EU. We also make written agreements with them regarding this.

**Informed Consent Form**

See [this FAQ](https://elsi.health-ri.nl/categorieen/data-delen-en-koppelen/wat-zijn-de-wettelijke-mogelijkheden-om-data-te-mogen-doorgeven) (in Dutch) why asking consent for this topic is generally not necessary.

#### 3.2 Sharing data with commercial parties
**Subject Information Sheet (Amsterdam UMC)**
* Consent for sharing data and bodily material with commercial parties
  * In this study, we share your data with [name of company or companies]. If you do not want us to share your data with commercial parties, you can indicate this on the consent form.

**Informed Consent Form**
* I do/do not (cross out what does not apply) consent to the sharing of my data/bodily material with commercial companies mentioned in the letter.

#### 3.3 Database linkage
Linking with other databases, such as CBS, PALGA and NKR, is often essential to answering a research question. To facilitate **future research**, you should explicitly address this in your project. As no template text currently exists for this purpose, consult local experts for guidance on drafting the passage correctly.

For the reuse and linkage of **existing data** to external databases, carefully review the existing SIS and PIF. Consult local experts to confirm whether data linkage is permitted. The following can be used as a starting point for drafting your SIS and ICF.

##### 3.3.1 CBS linkage
The cause of death data must be intended for scientific research in the field of public health and the study must be carried out by a university, university hospital, planning bureau, or other institution, as referred to in [Art. 41 of the Statistics Netherlands Act](https://wetten.overheid.nl/BWBR0015926/2022-03-02/#Hoofdstuk5_Paragraaf3_Artikel41).

**Subject Information Sheet (Amsterdam UMC)**
* May we request data about you from CBS?
    * Statistics Netherlands (CBS) is the official authority in the Netherlands that records causes of death. If you were to pass away during the study, we ask for your consent to request information about the cause of your death from CBS. We will only request this information if it is relevant to this study.

**Informed Consent Form**
* I do/do not (cross out what does not apply) consent to the request for my data from CBS.

##### 3.3.2 Generic database linkage
**Subject Information Sheet (based on [AOCR](https://www.aocr.nl/wp-content/uploads/2025/02/PIF-Archipelago-biobank-algemene-versie-4.3-d.d.-12-04-2024.pdf))**

* Linking with existing Dutch registration systems.
    * To gain more insight into the development and progression of your condition, we require additional data. This data will be obtained by requesting information from existing Dutch health-related registration systems, such as [name of database]. Any linking with Dutch health-related registration systems will only take place after consultation with the <committee>.

**Informed Consent Form (Amsterdam UMC)**
* I do/do not (cross out what does not apply) consent to [the linking of/requesting] my data from [name of database].

#### 3.4 How long do we retain your data?
Please note that fixed retention periods apply to the type of research. You are required to adhere to the retention period stated in your informed consent (IC), also for publications.

**Subject Information Sheet (Amsterdam UMC)**
* We retain your data for [xx] years [at the hospital/general practice/research centre]. It will also be retained for [xx] years at [name of institution/company].

Depending on local policies, you could consider:
* At least [xx] years or as long as necessary for scientific research.

### Step 4 - Address special consent considerations for cohorts, deceased participants and other cases
#### 4.1 Cohort studies
If you are setting up an ICF and SIS for a cohort study, keep the following in mind:  
* **Check your consent for scope.** If your current consent has a specific scope, reuse must fall within this scope.
* **Evolving laws and consent requirements.** Long-term cohort studies often encounter changes in laws and regulations over time, including evolving IC requirements.  Consider how earlier IC agreements may differ from current standards, such as permissions for sharing data outside the EU.
* **Participant dropouts.** Account for participants who drop out between measurement rounds. For example, if a participant last contributed 10 years ago, their original IC remains valid, which can create complexities. Depending on the circumstances, it may be possible to switch to an op-out if there is a proper legal basis. Check with your local specialists.
* **Transition to adulthood in birth cohorts.** For birth cohorts, consider how IC changes when children reach adulthood. While parents initially provide consent, adults may decide to withdraw or modify the use of their previously collected data.
* **Future data retrieval and linkage.** Plan for potential future data uses, such as retrieving cause-of-death information from CBS (see 3.3) or updating addresses through the BRP. Ensure IC explicitly addresses these possibilities.
* **Retention period for data and biomaterial.** Clearly define the data retention period in the SIS/ICF. Specify whether the period begins after the study concludes to avoid premature data deletion. Alternatively, consider specifying periodic evaluations of data retention (e.g., every 5 years) with participant notification.

#### 4.2 Deceased participants. 
While the GDPR is no longer applicable, ethically you may want to adhere to the already specified choices. Bear in mind that the WGBO is still applicable. 

#### 4.3 Anonymised data. 
If data is anonymised, it is no longer considered personal data under regulations like the GDPR. 

#### 4.4 Research involving animals. 
Here, informed consent is not applicable in the same way it is for human research. Instead, ethical approval is required to ensure the humane treatment of animals. This is out of scope. For more information check [Dierexperimentencommissie (DEC) | Centrale Commissie Dierproeven](https://www.centralecommissiedierproeven.nl/onderwerpen/dierexperimentencommissie-dec (available in Dutch).

### Step 5 - Submit your FAIR-ready SIS and ICF for final committee review
With your SIS and ICF fully FAIR ready and approved by your data protection officer, get it reviewed by the appropriate committee:
* An accredited MREC for Non-WMO studies 
* An accredited MREC or the CCMO for WMO studies

## Expertise requirements for this step 
The following role from [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team) is necessary for this step:
* ELSI expert 
  * National level
    * [The ELSI servicedesk](https://elsi.health-ri.nl/) for general information and questions 
  * Local level
    * Amsterdam UMC - Privacy Bescherming & Informatie Beveiliging (<privacy@amsterdamumc.nl>)

## Practical examples from the community 
* [COMPRAYA’s SIS](https://www.compraya.nl/files/e1-e2ppicomprayastudie_m20com_v1.9_14032023_clean.pdf) (in Dutch) contains a section about, for example, future use of data and materials (page 7).

## Training
Available training resources include:
* [GDPR 4 Data Support RDNL](https://researchdata.nl/en/two-ways-to-get-started-2/)
* [Utrecht University Data Privacy Handbook](https://utrechtuniversity.github.io/dataprivacyhandbook/)

## Suggestions
{% include metroline_steps/suggestions_released.html %}

