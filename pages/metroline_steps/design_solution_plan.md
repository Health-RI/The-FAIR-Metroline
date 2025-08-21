---
title: Design solution plan
permalink: /metroline_steps/design_solution_plan
---

{% include assign_current_step.html %}
{% include development_status.html step=current_step %}

>***FAIRification planning should not only focus on the selection of suitable technologies or standards, but also on prioritising the effort required to raise the FAIR level of the targeted resources for the realisation of the related objectives. [A goal-oriented method for FAIRification planning](https://doi.org/10.21203/rs.3.rs-3092538/v1)***
>
> {{ current_step.summary }}

## Short description
A solution plan provides a structured approach to addressing identified gaps in FAIR compliance. By comparing the outcomes of the pre-FAIR assessment with the previously defined FAIRification objectives, you can design a targeted solution plan. This plan transforms assessment insights into actionable steps, ensuring that technical, organisational, and procedural aspects are considered. It helps your team allocate resources efficiently and prepares for upcoming challenges. The outcome is a clear roadmap that enhances data management and facilitates improved FAIRification.

## Why is this step important 
Designing a solution plan ensures that assessment insights are systematically translated into a structured plan, preventing fragmented and ineffective FAIRification efforts. The pre-FAIR assessment identifies key gaps and challenges in FAIR compliance, such as incomplete metadata, lack of a data storage strategy, or missing documentation practices. If left unaddressed, these issues can hinder data quality, interoperability, and reuse.

A well-defined solution plan helps to:
* **Break down the steps** involved in FAIRification and explain them clearly for people new to the process.
* **Create awareness of accountability,** encouraging team members to take ownership of the tasks assigned to them.
* **Identify potential risks** to achieving the objectives, such as the absence of tools, standards, or other key resources.
* **Optimise the use of available resources** and define clear success criteria to track progress and measure impact.
* **Enhance data quality,** leading to better insights, improved compliance with FAIR principles, and increased efficiency in research processes.

## How to 
### Step 1 - Identify and prioritise critical FAIR issues
Using the pre-FAIR assessment findings, identify and rank key issues based on urgency, impact, and feasibility. Prioritisation ensures that critical gaps, such as incomplete metadata, lack of persistent identifiers, or missing documentation, are addressed first.

**Example:** If metadata incompleteness is blocking data reuse, improving metadata standards should take precedence over less critical issues.

### Step 2 - Define SMART objectives for the prioritised issues
For each prioritised issue, define SMART objectives, goals that are 
* **Specific.** Clearly state what needs to be achieved.
* **Measurable.** Define indicators to track progress and outcomes.
* **Achievable.** Ensure the objective is realistic given your resources.
* **Relevant.** Make sure it aligns with your overall FAIRification goals.
* **Time-bound.** Set a clear deadline or timeframe for achieving the objective.

These SMART objectives will guide the implementation of your solution plan and provide a way to measure progress. Make sure they align with your FAIRification objectives defined in [Metroline Step: Define FAIRification objectives]({{site.baseurl}}/metroline_steps/define_fairification_objectives). 

**Tip:** [The FAIRification Process framework](https://faircookbook.elixir-europe.org/content/recipes/introduction/fairification-process.html) emphasises defining clear goals before implementation. Taking the time to explicitly refine FAIRification goals at this stage helps ensure a structured and effective solution plan.

**Example of refined objective:** By \[date], update metadata for 90% of datasets to comply with \[standard], ensuring all required fields are completed.

**Example of alignment with FAIRification objective:** The SMART goal from the example above is aligned with the following FAIRification objective: “Metadata must be [mapped](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279281676) to the [DCAT-AP core schema](https://github.com/Health-RI/health-ri-metadata/) and provided via a [FAIR Data Point](https://health-ri.atlassian.net/wiki/spaces/FSD/pages/279183386)”.

### Step 3 - Identify constraints and adapt the plan
Evaluate the current infrastructure, policies, and governance environment. Identify constraints such as legal barriers, technical limitations, or resource availability. Develop mitigation strategies to address them. You might have to revisit Step 2 (Refine your FAIRification objectives) depending on the constraints found in this step.

**Example:** If data governance policies prevent external repository use, consider alternative institutional solutions and update your solution plan accordingly.

### Step 4 - Align to best practices using appropriate tools and methodologies
Choose tools, frameworks, and methodologies that best address identified gaps. Resources such as [FAIRsharing](http://fairsharing.org/), [FAIR Cookbook](https://faircookbook.elixir-europe.org/content/home.html), [FAIR Implementation Profiles (FIPs)]({{site.baseurl}}/metroline_steps/creating_a_fair_implementation_profile) and this FAIR Metroline ensure alignment with best practices. Discussing your plan with FAIR experts who work in similar projects can also help in selecting the most suitable resources. 

**Tip:** In many cases, existing tools and methodologies can be reused or adapted. The [FAIRification process framework](https://faircookbook.elixir-europe.org/content/recipes/introduction/fairification-process.html) (FAIR Cookbook) provides structured guidance on selecting and applying tools at different stages of FAIRification. It offers practical recipes that can help ensure your chosen methodologies align with FAIR best practices. For a structured approach to implementing FAIR principles, explore the [How to GO FAIR](https://www.go-fair.org/how-to-go-fair/) guide, which provides methodologies and best practices for FAIRification.

**Example:** In your pre-FAIR assessment, you identified that the current weblink pointing to your work is not persistent as it is constantly changing. You need persistent identifiers to ensure that your work remains findable, accessible, and citable over time, even if locations change. This is in line with your FAIRification objectives ‘a persistent identifier for my metadata is provided’ and ‘persistent identifiers for my datasets are provided’. The [FAIR Cookbook](https://faircookbook.elixir-europe.org/content/recipes/findability/identifiers.html) provides guidance on how to implement persistent identifiers and also [lists](https://faircookbook.elixir-europe.org/content/recipes/findability/identifiers.html#identifier-resolution-services) providers of such services.

### Step 5 - Involve key stakeholders to develop the solution plan
Involve key stakeholders, including those from the pre-FAIR assessment phase, data stewards, domain experts, and IT teams to develop a feasible solution plan. It is essential to balance the technical requirements (such as metadata standards) with organisational goals (such as compliance with the research code) . This alignment ensures that: 
* Solutions are technically implementable within existing infrastructure. 
* Organisational policies and funding constraints are considered. 
* Data management practices integrate seamlessly with research workflows. 
* Long-term sustainability and scalability of FAIR improvements are ensured. 

For additional guidance on coordinating data management efforts across teams, see the [Data Management Coordination page](https://rdmkit.elixir-europe.org/dm_coordination) from RDMKit.

**Tip:** Regular check-ins help maintain engagement and prevent misalignment.

### Step 6 - Develop a structured roadmap to implement the plan
Translate the objectives from Step 2 into an implementation roadmap (see the table below for a roadmap example) outlining key actions, responsibilities, timelines, and resources. Define key performance indicators (KPIs) to track progress and enable adjustments.

An iterative, agile approach helps structure the roadmap, allowing flexibility and continuous refinement. [The FAIRification process framework](https://faircookbook.elixir-europe.org/content/recipes/introduction/fairification-process.html) (FAIR Cookbook) emphasises breaking implementation into manageable phases to ensure steady progress while adapting to evolving requirements.

For example, when making data FAIR, datasets can be split into smaller sets, improving step by step. Much like an agile kitchen (see [Types of Project Management Methodologies](https://www.futurelearn.com/info/courses/project-initiation-open/0/steps/215764)), where chefs adapt dishes based on available ingredients, refine flavours as they cook, and collaborate to enhance each other’s work, FAIRification benefits from incremental improvements, teamwork, and adaptability. By iterating on smaller datasets and building on previous improvements, each cycle moves closer to full FAIR implementation.

| Objective        | Action                               | Responsible                                      | Timeline | Resources                                                                                                                     | Status      |
|------------------|--------------------------------------|--------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------|-------------|
| Improve metadata | Assess availability of your metadata | Data steward                                     | Week 1   | [Metroline Step: Assess availability of your metadata]({{site.baseurl}}/metroline_steps/assess_availability_of_your_metadata) | In Progress |
| Improve metadata | Analyse metadata semantics           | Semantic specialist, domain expert, data Steward | Week 2   | [Metroline Step: Analyse data semantics]({{site.baseurl}}/metroline_steps/analyse_data_semantics)                             | To do       |

**Example:** For GO-Plan, a template was developed to facilitate the identification of FAIRification objectives. This template has been successfully applied in two tutorials, with participants reporting that it effectively guided them through the process.

## Expertise requirements for this step 
Designing a solution plan is typically a collaborative effort by a range of experts, as described in [Metroline Step: Build the Team]({{site.baseurl}}/metroline_steps/build_the_team).
* **FAIR experts.** Provide guidance on best practices, standards, and methodologies.
* **Domain experts.** Define data semantics, quality standards, and use cases.
* **Data stewards.** Ensure data and metadata comply with FAIR principles.
* **IT specialists.** Support infrastructure needs, interoperability, and tool integration.
* **Project managers.** Oversee planning, stakeholder coordination, and implementation tracking.

## Practical examples from the community 
This section should show the step applied in a real project. Links to demonstrator projects. 

## Training
* [FAIRification Tools and Templates – ELIXIR-UK Fellowship](https://fellowship.elixiruknode.org/latest/rdmbites-fairification-tools-and-templates)
* [FAIRification Workflow – FAIR Toolkit](https://fairtoolkit.pistoiaalliance.org/methods/fairification-workflow/)
* [FAIR Implementation Profile]({{site.baseurl}}/metroline_steps/creating_a_fair_implementation_profile)
* [Tutorial: Insights in FAIRification planning](https://fairification-planning.github.io/)

## Suggestions
{% include metroline_steps/suggestions_released.html %}
