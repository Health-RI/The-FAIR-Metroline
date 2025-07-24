// Since the metroline_interactive_svg.html is updated every now and then, we use this script to generate
// the downloadable svg files (available in the about.md)

async function downloadMetrolineSVG({ stripAnchors = false } = {}) {
  try {
    const response = await fetch("/assets/includes/metroline_interactive.svg");
    if (!response.ok) throw new Error("Could not fetch SVG");

    // 1. Read and preprocess raw SVG text
    let svgText = await response.text();
    svgText = svgText.replace(/{{\s*site\.baseurl\s*}}/g, "https://fairmetroline.org");

    const svgStartIndex = svgText.indexOf("<svg");
    if (svgStartIndex === -1) throw new Error("No <svg> tag found.");
    svgText = svgText.slice(svgStartIndex);

    // 2. Parse the SVG into DOM
    const parser = new DOMParser();
    const svgDoc = parser.parseFromString(svgText, "image/svg+xml");
    const originalSvg = svgDoc.querySelector("svg");
    if (!originalSvg) throw new Error("Parsed SVG is invalid");

    // 3. If requested, unwrap <a> tags and preserve transforms
    if (stripAnchors) {
      originalSvg.querySelectorAll("a").forEach(anchor => {
        const g = document.createElementNS("http://www.w3.org/2000/svg", "g");
        const t = anchor.getAttribute("transform");
        if (t) g.setAttribute("transform", t);
        while (anchor.firstChild) g.appendChild(anchor.firstChild);
        anchor.replaceWith(g);
      });
    }

    // 4. Serialize back to string
    let finalSvg = new XMLSerializer().serializeToString(originalSvg);

    // 5. If clickable, ensure links are absolute and namespace is correct
    if (!stripAnchors) {
      finalSvg = finalSvg
        .replace(/<a([^>]+)href=/g, '<a xlink:href=')
        .replace(/xlink:href="\/(metroline_steps\/[^"]+)"/g, 'xlink:href="https://fairmetroline.org/$1"');

      if (!/xmlns:xlink=/.test(finalSvg)) {
        finalSvg = finalSvg.replace(/<svg /, '<svg xmlns:xlink="http://www.w3.org/1999/xlink" ');
      }
    }

    // 6. Create and trigger download
    const filename = stripAnchors ? "metroline_unclickable.svg" : "metroline_clickable.svg";
    const blob = new Blob([finalSvg], { type: "image/svg+xml" });
    const url = URL.createObjectURL(blob);

    const a = Object.assign(document.createElement("a"), {
      href: url,
      download: filename
    });
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  } catch (err) {
    alert("Error downloading SVG: " + err.message);
  }
}
