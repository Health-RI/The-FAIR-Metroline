# Review and check scripts

Helpers for the tool catalogue (`_data/tools_v2.yml`). Python scripts need `openpyxl`, `pyyaml`,
`jsonschema` and `beautifulsoup4` (`pip install openpyxl pyyaml jsonschema beautifulsoup4`).

| Script | What it does | Run |
|---|---|---|
| `import_review.py` | Rebuilds `_data/tools_v2.yml` from the colour-coded review workbook `_review/tools4fair-annotation-form_new_v3.xlsx` (column names in row 2): green/yellow cells become verified (top level), white cells go under `pending`, and purple/pink and red (flagged) cells go under `pending` as open decisions, struck values and tools are dropped. Fields that were not in the review (institutes, FAIRsharing ids) come from `tools_v2_before_import.yml`; `redirect_from` and related tools (no longer in the sheet) come from the current `tools_v2.yml`. Registry ids (bio.tools, GitHub, RSD; entered as full URLs since v3) switch on bio.tools/GitHub data on the live page only when green or yellow. A GitHub organisation URL becomes a "Source code" link. The two DOI columns become `ids.doi` (publication) and `ids.software_doi`. A keyword cell saying "unknown" or "tbd" means no keyword. Editors' changes after the review (tools left out, corrected values) are set in `LEFT_OUT` and `CHANGES` at the top of the script, so a new import keeps them. Writes `import_report.json` (purple decisions, mapped notes). Re-running it on an unchanged workbook gives an identical file. | `python _review/scripts/import_review.py` |
| `review_status.py` | Writes `_review/review-status.md` (open purple decisions, mapped notes, what is verified per field and per tool) from `tools_v2.yml` and `import_report.json`. | after an import: `python _review/scripts/review_status.py` |
| `live_check.py` | Checks the built tool pages against the verified values in `tools_v2.yml`, with every unverified (`.tp-pending`) element removed, as on the live site; also checks the catalogue order and the "this tool has none" note. | build the site, then `python _review/scripts/live_check.py` (or `SITE=<dir>` for another build folder) |
| `internal_links.py` | Lists internal links in a built site whose target does not exist. | `python _review/scripts/internal_links.py _site` |
| `scenarios.rb` | Unit tests for the tool page generator (which value wins: verified, fetched with verified ids, pending, fetched with pending ids; links, activity, licences) and the bio.tools/GitHub enrichment. No network. | `docker run --rm -v "$PWD":/site -v "$PWD/_review/scripts":/s fair-metroline ruby /s/scenarios.rb` |

`scenarios.rb` expects the repository at `/site`, as in the Docker command above.

## Registry data (bio.tools, GitHub, OpenAlex)

The site build does not go online. `_scripts/fetch_tool_data.rb` fetches bio.tools, GitHub (repository, latest release, CITATION.cff) and OpenAlex (citations) for every tool and writes `_data/tools_fetched.json`; the tool pages read only that file. The workflow `.github/workflows/refresh-tool-data.yml` runs it every Monday (or by hand under Actions) and opens a pull request against `dev` when the data changed.

Run it by hand after changing registry ids or DOIs in `tools_v2.yml` (a tool page without fetched data logs a warning during the build):

    docker run --rm -e GITHUB_TOKEN -e OPENALEX_API_KEY -v "$PWD":/site -w /site fair-metroline bundle exec ruby _scripts/fetch_tool_data.rb

Publications come from bio.tools; the verified sheet DOI (`ids.doi`) is used only when bio.tools lists no paper. OpenAlex counts their citations (a preprint and its article count once); papers OpenAlex does not know keep the count bio.tools stored. Each paper links to its citation details on Dimensions.

