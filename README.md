[![theme badge](https://img.shields.io/badge/ELIXIR%20toolkit%20theme-jekyll-blue?color=0d6efd)](https://github.com/ELIXIR-Belgium/elixir-toolkit-theme)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

# Introduction
<p float="left">
  <img src="assets/img/main_logo.png" alt="Logo" style="float: left; margin-right: 15px; width: 50px;">
</p>

 The FAIR Metroline provides practical guidance to help you reach your FAIR goals and make your data more FAIR. Each Metroline step includes a short description, aimed at a general audience, as well as a section describing the expertise that may be necessary for the how-to section. This expertise can vary greatly per step and may include, for example, domain experts, software engineers or legal professionals. Given the time commitment and specialised knowledge needed, most steps will require the expertise of at least a data steward.

The development of the FAIR Metroline is currently ongoing in Confluence. To enhance flexibility and improve findability, we are transferring both published pages and those available for external review to this web-based version.

## How to cite
When referencing content from the FAIR Metroline pages, please cite as follows:

> FAIR Metroline. A step-by-step route to making data FAIR (Findable, Accessible, Interoperable and Reusable). https://fairmetroline.org

# Local Development

## Prerequisites

1. **Git** - Install from [git-scm.com](https://git-scm.com/downloads)
2. **Docker Desktop** - Install from [docker.com](https://www.docker.com/products/docker-desktop/)
3. **SSH Key** (for contributors, not reviewers) - Set up following [GitHub's SSH guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## Clone the Repository

```bash
# Clone using HTTPS (read-only)
git clone https://github.com/Health-RI/The-FAIR-Metroline.git
cd The-FAIR-Metroline

# Or clone using SSH (required for contributors)
git clone git@github.com:Health-RI/The-FAIR-Metroline.git
cd The-FAIR-Metroline
```

## Build and Run

Make sure Docker Desktop is running, then:

```bash
# Build the Docker image
docker build -t fair-metroline .

# Run the site
docker run -p 4000:4000 -v $(pwd):/site fair-metroline
```

Open http://localhost:4000 in your browser. The site will automatically reload when you make changes!

To stop: Press `Ctrl+C`

# License
This project is licensed under the [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). See the [LICENSE.txt](./LICENSE.txt) file for the full legal text.

## Credits

This project was originally based on [elixir-toolkit-theme-example](https://github.com/ELIXIR-Belgium/elixir-toolkit-theme-example).
