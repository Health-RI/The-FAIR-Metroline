"""Write _review/review-status.md from _data/tools_v2.yml and the last import's import_report.json.

Run after import_review.py: python _review/scripts/review_status.py
"""
import json
from pathlib import Path
import yaml

REPO = Path(__file__).resolve().parents[2]
HERE = Path(__file__).parent
entries = yaml.safe_load(open(REPO / "_data/tools_v2.yml"))
report = json.load(open(HERE / "import_report.json"))
imported = next(l for l in open(REPO / "_data/tools_v2.yml") if l.startswith("# Imported on")).strip("# :\n")
names = {e["id"]: e.get("name") or e.get("pending", {}).get("name") or e["id"] for e in entries}

# fields as the reviewers see them; links are split so a partly verified links block reads correctly
FIELDS = ["name", "short_description", "description", "tool_type", "fair", "lifecycle", "domains", "license", "cost",
          "code_availability", "maturity", "deprecated", "hosted", "links.homepage", "links.homepage_opens_tool",
          "links.docs", "links.docs_note", "links.download", "links.other", "logo", "ids", "how_to_cite", "keywords",
          "institutes", "related"]

def fields(block):
    out = set()
    for f in FIELDS:
        if f.startswith("links."):
            if f[6:] in (block.get("links") or {}): out.add(f)
        elif f in block:
            out.add(f)
    return out

def short(v, n=110):
    v = " ".join(str(v).split())
    return v if len(v) <= n else v[: n - 1] + "…"

lines = [
    "# Tool review status",
    "",
    f"{imported} into `_data/tools_v2.yml`. This page is written by",
    "`_review/scripts/review_status.py`; run it again after each import.",
    "",
    "- **Verified** (green or yellow in the sheet): the top level of each entry. This is all the live site shows.",
    "- **Pending** (white: not checked yet; purple: still to decide): under `pending:` in each entry. Hidden on the",
    "  live site; add `?unverified=1` to a tool page URL to see them with a dashed border (`?unverified=0` hides them).",
    "  When a value is checked, mark it green or yellow in the sheet and import again.",
    f"- **Removed** (crossed out): {', '.join(report['removed_tools']) or 'none'}.",
    "- **Not in the sheet**: related tools (the Related columns were removed) and institutes (Used by) are carried",
    "  over from the current file and `tools_v2_before_import.yml`, unverified unless they already were.",
    "",
    "## Decisions still open (purple or pink in the sheet)",
    "",
    "| Tool | Field | Value in the sheet |",
    "|---|---|---|",
]
lines += [f"| {names.get(t, t)} | {f} | {short(v)} |" for t, f, v in report["decide"]]
lines += [
    "",
    "## Reviewer notes turned into structured values",
    "",
    "| Tool | Column | Note | Became |",
    "|---|---|---|---|",
]
for t, col, note, became in report["notes_mapped"]:
    if isinstance(became, list):
        became = ", ".join(d["label"] for d in became)
    lines.append(f"| {names.get(t, t)} | {col} | {short(note, 70)} | {short(became, 60)} |")
lines += [
    "",
    "Mapping rules: `SaaS` → `hosted: true` (\"Online service\"); `nvt` → no download link;",
    "`platform website` → `docs_note: On the website`; `github readme` → the README of the GitHub homepage;",
    "a URL followed by a remark in brackets → the URL; keyword `unknown` → no keyword.",
    "",
    "## Verified for how many tools",
    "",
    "| Field | Verified | Pending |",
    "|---|---|---|",
]
for f in FIELDS:
    v = sum(f in fields(e) for e in entries)
    p = sum(f in fields(e.get("pending") or {}) for e in entries)
    if v or p:
        lines.append(f"| {f} | {v} | {p} |")
lines += [
    "",
    "## Per tool",
    "",
    "| Tool | Verified | Pending |",
    "|---|---|---|",
]
for e in entries:
    v, p = fields(e), fields(e.get("pending") or {})
    lines.append(f"| {names[e['id']]} | {', '.join(f for f in FIELDS if f in v)} | {', '.join(f for f in FIELDS if f in p)} |")

(REPO / "_review/review-status.md").write_text("\n".join(lines) + "\n")
print(f"review-status.md: {len(report['decide'])} open decisions, {len(entries)} tools")
