---
title: Have a FAIR data steward on board
permalink: /metroline_steps/have_a_fair_data_steward_on_board
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***Data stewardship is a relatively new profession and a catch-all term for numerous support functions, roles and activities. It implies professional and careful treatment of data throughout all stages of a research process. The core responsibilities and tasks vary, from policy advising and consultancy, to operational and technical support and IT related tasks. Responsibilities also vary between and among the different research-performing organisations, and data stewards (DS) often have different job titles. ([RDMkit](https://rdmkit.elixir-europe.org/data_steward))***
>
> {{ current_step.summary }}

## Short description
Proper data stewardship ensures research data is Findable, Accessible, Interoperable and Reusable (FAIR) in the long term through data management, archiving and reuse. Creating FAIR data requires attention from the planning phase of a study to its lifelong maintenance.  Hence, according to FAIRification models such as [FAIRopoly](https://www.ejprarediseases.org/fairopoly/) and [A Generic Workflow for the Data FAIRification Process](https://direct.mit.edu/dint/article/2/1-2/56/9988/A-Generic-Workflow-for-the-Data-FAIRification), a FAIR data steward - familiar with the local environment and FAIRification - should guide this process. This role can be filled by a trained team member or by using existing central support services within organisation or national initiatives such as Health-RI.

## Why is this step important 
Good data stewardship incorporates the FAIR data principles and ensures sustainable integration in the research cycle. It is a collective effort requiring actions and competencies from researchers, project teams, institutes, research disciplines and funders. Each organisation tailors its research data management (RDM) policy to its own context, with funders and institutions defining roles and responsibilities differently, such as expectations for research teams, host institutions and third-party organisations like data centres ([Towards FAIR Data Steward as profession for the Lifesciences](https://zenodo.org/records/3474789/files/Report_FAIR%20Data%20Steward%20in%20Lifesciences_v2.pdf)).

Having a FAIR data steward in your multidisciplinary team (see [Metroline Step: Build the team]({{site.baseurl}}/metroline_steps/build_the_team)) offers key benefits (see [FAIRopoly](https://www.ejprarediseases.org/fairopoly/)).
* **FAIR expertise.** A team member with general FAIR knowledge and expertise helps achieve FAIR objectives (see [Metroline Step: Define your FAIRification Objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives)) more easily and faster. 
* **FAIR standards.** A FAIR data steward provides expertise in metadata standards and semantic modelling, essential for achieving interoperability between collections, studies and datasets.
* **FAIR technologies.** They also bring knowledge of technologies and tools that automate or improve FAIRness within and beyond the institution.
* **FAIR use cases.** Instead of reinventing the wheel, a FAIR data steward connects your team to community best practices and use cases for FAIRifying data.

## How to
### Step 1 - Identify the right data steward
To ensure effective data stewardship, consider which type of data steward best fits your team. The [NPOS/ELIXIR Data Stewardship Competency Framework](https://competency.ebi.ac.uk/framework/datasteward/1.0) distinguishes three key roles, all with FAIR as their core focus.
* **Policy oriented.** Develops and implements RDM policies within a team or organisation.
* **Research oriented.** Works directly with researchers, providing hands-on support for data management.
* **Infrastructure oriented.** Translates policy and research needs into suitable IT solutions, software, hardware and tools.

Each of these roles covers eight key competence areas (see below). A single data steward may oversee all areas, or responsibilities may be shared across multiple data stewards. Some organisations also have department- or division-based data stewards who focus on local RDM needs while aligning with central policies. When assembling your team, consider which competencies should be covered internally and identify resources for any gaps.

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/have_a_fair_data_steward_on_board/data_stewardship_roles.png" 
   alt="Data stewardship roles" 
   caption="NPOS/ELIXIR data stewardship roles" %}

The eight NPOS/ELIXIR competence areas are described below.
* **Policy & strategy.** Development, implementation and monitoring of the RDM policy and strategy of the institute.
* **Compliance.** Adherence to relevant codes of conduct, legislation and field specific standards.
* **Alignment with the FAIR data principles.** Incorporating FAIR principles and open science practices.
* **Services.** Availability of adequate RDM support in staff or services.
* **Infrastructure.** Availability of adequate RDM infrastructure.
* **Knowledge management.** Adequate level of knowledge and skills on RDM in the institute.
* **Network.** Maintaining connections with aligned expertise areas and relevant organisations.
* **Data archiving.** Adequate support and infrastructure for FAIR and long-term archiving of the institute’s data.

A formalised Dutch data steward profile has been adopted by many research performing organisations to professionalise data stewardship roles and create consistency across institutions. This profile is further detailed in Step 3.

### Step 2 - Determine the steward’s position in the organisation
Decide where the data steward will be based within your organisation. Depending on the structure and needs of your research team, a data steward may be:
* **Part-time within a central unit.** Hired from a library, knowledge hub or IT team to support multiple projects.
* **Dedicated to a project.** Embedded within the research team for hands-on data stewardship.
* **Department- or division-based.** Assigned within a specific department or research unit to align local practices with institutional policies.
* **External support.** Engaged as a consultant to cover missing competencies.

In some organisations, data stewardship is an extended role for existing data specialists or data managers. Departments may choose to train their existing data specialists to take on data steward responsibilities, rather than hiring a separate data steward. This approach helps integrate data stewardship into existing research workflows.

Some researchers may allocate their own budget to hire a data steward. In addition, some funders allow data stewardship costs within project budgets. If a dedicated steward cannot be hired, check whether your organisation provides existing data stewardship support to ensure proper coverage.

For further details on data steward allocation, see the **NPOS report on professionalising data stewardship in the Netherlands** ([chapter 2.3](https://doi.org/10.5281/zenodo.4623713)).

### Step 3 - Hire or consult a data steward
Hire or consult a data steward following the formalised Dutch data steward profile, which has been adopted to professionalise data stewardship roles and create consistency across institutions. This profile ensures clear role definitions and career prospects for data stewards. The areas below outline what a data steward may be responsible for, based on the formal Dutch job classification system (see the earlier cited report, Annex 5 and beyond).

{% include image_with_caption.html 
   src="/assets/img/metroline_steps/have_a_fair_data_steward_on_board/data_steward_job_profile.png" 
   alt="Data steward job profile"
   size="medium"
   caption="Components of the data steward job profile" %}


* **Policy & strategy.** Design strategies for raising awareness of RDM policies and regulations.
* **Compliance.** Advise on institutional compliance with RDM policies and regulations.
* **Facilitating good RDM practices.** Support stakeholders in adopting effective RDM practices.
* **RDM services.** Develop, implement and monitor RDM workflows and practices.
* **Data infrastructure.** Identify requirements for adequate RDM infrastructure and tools.
* **Knowledge management.** Assess and ensure the sustainability of RDM knowledge and skills.
* **Network & communication.** Build and maintain (inter)national RDM collaborations.
* **Data sharing & publishing.** Identify gaps in support for data sharing and publishing.
* **Coordination of work.** Supervise and support less experienced colleagues.
* **Coaching & process improvement.** Improve work processes at different levels.
* **Soft skills.** Apply competencies such as accuracy, persuasiveness, communication, collaboration and networking.

### Step 4 - Ensure support and compliance
If your team includes a FAIR data steward, ensure they have access to the right support and resources.
* **Training opportunities.** Ensure data stewards receive continuous training to stay updated on best practices, tools and policies.
* **Institutional and national networks.** Connect data stewards with institutional, national and international networks to foster collaboration and professional growth. Central networks should be the first point of contact, including institutional data steward groups (via the Local Digital Competence Centers (LDCC) or the Open Science Communities), national networks (e.g. the Data Stewards Interest Group) and international initiatives (e.g. RDA professionalising data stewardship Interest Group or the ELIXIR RDM Community). See the Building your Community page page for more details.
* **Domain-specific knowledge.** A data steward with expertise in your research field can better understand the data’s context and communicate effectively with researchers and stakeholders.
* **Funder requirements.** Many funders now require a data steward to be part of the project team. Check grant conditions to ensure compliance with specific expectations.
* **Publishing policies and local guidance.** Ensure data handling aligns with institutional policies and national and international regulations. Discuss early stage requirements with local guidance bodies to meet FAIR standards and repository guidelines.

## Expertise requirements for this step 
To determine the position of a FAIR data steward in your team, it is essential to understand their added value in relation to your FAIRification objectives. While a data steward can contribute in multiple areas, their responsibilities vary across institutions. In some, a single steward may cover multiple roles, whereas in others, tasks are divided across departments. Aligning stewardship with existing support structures helps prevent duplication and inefficiencies.
* **Technical skills.** A FAIR data steward brings expertise in data management, metadata standards, data integration and repository platforms, ensuring compliance with privacy and security regulations.
* **Collaboration with researchers.** They work closely with researchers to support data generation, collection and analysis, guiding them in selecting appropriate tools and platforms.
* **Integration with existing infrastructure.** They assess institutional workflows and infrastructure to integrate FAIR data stewardship while ensuring alignment with existing roles to avoid duplication.
* **Communication and advocacy.** They promote FAIR data practices within the team, engage stakeholders and funding agencies and foster a culture of data sharing and transparency.
* **Project management skills.** They oversee FAIR data implementation, including data management plans, data sharing coordination and compliance with funder and institutional policies. In some institutions, these tasks are handled by dedicated departments, requiring clear coordination.

## Practical examples from the community 
***[European Joint Programme on Rare Diseases (EJP RD)](https://www.ejprarediseases.org/)***
EJP RD provides various FAIRification services, guidance, tools and training, supported by a team of six FAIR data stewards. Their activities include (see the EJP RD FAIRification website for more details):
* participating in project, national and international meetings to exchange knowledge, share experiences and develop FAIRification guidance;
* identifying FAIRification bottlenecks and supporting the implementation of FAIRification processes within the project;
* assessing training needs and organising workshops and hackathons at the project level.

## Training
As data stewardship is a relatively new job profile and the field of data management and FAIR data practices continues to evolve, FAIR data stewards benefit from continuous learning. Staying updated on emerging trends, tools and standards helps them develop the necessary skills and expertise.
* Training for data stewards may cover data management best practices, data curation techniques, metadata standards and relevant tools and technologies. [RDMkit](https://rdmkit.elixir-europe.org/index) provides an overview of data management best practices and guidelines. 

While many trainings and resources focus on general RDM, they can often be adapted to emphasise FAIR principles and tailored to specific project needs.

The [NPOS report on professionalising data stewardship in the Netherlands](https://doi.org/10.5281/zenodo.4623713) contains a list of training opportunities and materials (pp. 148–162). Several organisations in the Netherlands provide data stewardship training, including:
* Research Data Netherlands (RDNL) [Essentials 4 Data Support](https://researchdata.nl/en/services/cursus/). A foundational, domain agnostic training in data management and data stewardship. Materials are publicly available.
* LCRDM [DCC Spring training days](https://lcrdm.nl/evenementen/dcc-spring-training-days-2024). Offers sessions on FAIR data and research data management. Most materials are freely available afterwards.
* Health-RI FAIR Data Stewardship Basics course. Provides training on core data stewardship principles ([2023](https://zenodo.org/doi/10.5281/zenodo.8116589) round, [2024](https://zenodo.org/records/11566785) round). Contact <a href="mailto:fairservicedesk@health-ri.nl">fairservicedesk@health-ri.nl</a> for upcoming editions.

Training events and materials on data management and FAIR can also be found through [Taxila](https://taxila.nl/) or [TeSS](https://tess.elixir-europe.org/). Additionally, [RDMkit training resources](https://rdmkit.elixir-europe.org/all_training_resources) may be useful. Moreover, see the [Health-RI FAIR Training and Capacity Building page](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/39256187/FAIR+Training+and+Capacity+building#Resources-to-find-FAIR-training-events-and-materials) to find training events and materials on data management and FAIR.

For those new to data stewardship, the blogpost [From Researcher to Data Steward: How to Get Started?](https://openworking.wordpress.com/2024/08/27/from-researcher-to-data-steward-how-to-get-started/) provides insights into learning paths and practical steps. This resource may also be useful for researchers managing their own data in smaller projects without a dedicated data steward.

## Suggestions
{% include metroline_steps/suggestions_released.html %}

