(function () {
  /**
   * Convert a glossary term into the fragment ID used on /glossary/.
   * This needs to stay aligned with however the glossary page generates IDs.
   */
  function slugify(text) {
    return String(text)
      .toLowerCase()
      .trim()
      .replace(/['"]/g, "")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "");
  }

  /**
   * Escape regex special characters so a term can be used safely
   * inside a dynamically built regular expression.
   */
  function escapeRegExp(text) {
    return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  }

  /**
   * Define what counts as a "word character" for boundary checks.
   * We use this instead of \b because glossary terms may contain
   * punctuation such as brackets or parentheses.
   */
  function isWordChar(char) {
    return /[A-Za-z0-9]/.test(char);
  }

  /**
   * Create a normalised key for a glossary concept.
   * This is used to track whether a concept has already been linked
   * once on the page, regardless of which alias matched first.
   */
  function normaliseKey(text) {
    return String(text).trim().toLowerCase();
  }

  /**
   * Treat all-uppercase aliases such as API, SIS, BRP and CCMO as
   * case-sensitive. Normal phrases are matched case-insensitively.
   *
   * This avoids noisy matches like "api" while still allowing
   * "trusted repository" to match "Trusted repository".
   */
  function isAllCapsAlias(text) {
    const value = String(text).trim();
    return /[A-Z]/.test(value) && value === value.toUpperCase();
  }

  /**
   * Skip text nodes that live inside elements where glossary linking
   * would be visually noisy or structurally undesirable.
   *
   * Current exclusions:
   * - existing links
   * - code/preformatted content
   * - scripts/styles/textareas
   * - already processed glossary links
   * - headings
   * - strong, because run-in side heads are often marked up as <strong>
   *
   * If you later introduce a dedicated class for run-in side heads,
   * it would be better to skip that class instead of skipping all <strong>.
   */
  function shouldSkipNode(node) {
    const parent = node.parentElement;
    if (!parent) return true;

    return !!parent.closest(
      "a, code, pre, script, style, textarea, .glossary-term, h1, h2, h3, h4, h5, h6, strong"
    );
  }

  /**
   * Transform raw glossary JSON into an internal structure that is
   * easier and faster to match against.
   *
   * For each glossary item we:
   * - keep one canonical concept key
   * - collect canonical term + aliases as labels
   * - deduplicate labels
   * - mark uppercase aliases as case-sensitive
   * - sort labels by length so longer phrases win over shorter ones
   *
   * Example:
   * term: "Application Programming Interface"
   * aliases: ["API", "Application Programming Interface (API)"]
   */
  function buildEntries(glossary) {
    const entries = [];

    for (const item of glossary || []) {
      if (!item.term || !item.definition) continue;

      const canonicalTerm = String(item.term).trim();
      const aliases = Array.isArray(item.aliases) ? item.aliases : [];

      const labels = [canonicalTerm, ...aliases]
        .map(label => String(label).trim())
        .filter(Boolean);

      const uniqueLabels = [...new Set(labels)].map(label => ({
        text: label,
        caseSensitive: isAllCapsAlias(label)
      }));

      // Prefer longer labels first so, for example,
      // "Subject Information Sheet (SIS)" beats "SIS".
      uniqueLabels.sort((a, b) => b.text.length - a.text.length);

      entries.push({
        // Used for de-duplicating concept matches on a page.
        key: normaliseKey(canonicalTerm),

        // Human-readable canonical label for debugging.
        canonicalTerm,

        // Canonical term + aliases, sorted longest first.
        labels: uniqueLabels,

        // Tooltip content.
        definition: String(item.definition).trim(),

        // Kept in case source data is useful later.
        sources: Array.isArray(item.sources) ? item.sources : [],

        // Target on the glossary page.
        url: "/glossary/#" + slugify(canonicalTerm)
      });
    }

    // Also sort the concepts by their longest label length so more
    // specific concepts get first chance to match in a text node.
    entries.sort((a, b) => {
      const aLongest = a.labels[0] ? a.labels[0].text.length : 0;
      const bLongest = b.labels[0] ? b.labels[0].text.length : 0;
      return bLongest - aLongest;
    });

    return entries;
  }

  /**
   * Look for one label inside a text string.
   *
   * Important:
   * - Uppercase aliases are matched case-sensitively.
   * - Other labels are matched case-insensitively.
   * - We do custom boundary checks before accepting a match.
   *
   * Why custom boundaries?
   * We cannot rely on \b because terms such as
   * "(Controlled) Vocabulary" or "Subject Information Sheet (SIS)"
   * contain punctuation that does not behave well with word boundaries.
   */
  function findLabelMatch(text, labelConfig) {
    if (!text || !labelConfig || !labelConfig.text) return null;

    const flags = labelConfig.caseSensitive ? "g" : "gi";
    const pattern = new RegExp(escapeRegExp(labelConfig.text), flags);
    let match;

    while ((match = pattern.exec(text)) !== null) {
      const start = match.index;
      const end = start + match[0].length;

      const before = start > 0 ? text[start - 1] : "";
      const after = end < text.length ? text[end] : "";

      const beforeIsWord = before && isWordChar(before);
      const afterIsWord = after && isWordChar(after);

      // Only accept the match when it is not embedded inside a larger token.
      // This prevents matches like:
      // - API inside superAPIclient
      // - SIS inside SIScode
      // - data management inside metadatamanagementsystem
      if (!beforeIsWord && !afterIsWord) {
        return {
          index: start,
          text: match[0]
        };
      }
    }

    return null;
  }

  /**
   * Try all labels for one glossary concept until one matches.
   * Labels are already sorted longest-first, so the most specific
   * wording is preferred.
   */
  function findEntryMatch(text, entry) {
    for (const label of entry.labels) {
      const match = findLabelMatch(text, label);
      if (match) return match;
    }
    return null;
  }

  /**
   * Create the actual inline glossary link that appears in the page.
   * Hover/focus behaviour is handled by CSS using data-definition.
   */
  function createGlossaryLink(text, entry) {
    const link = document.createElement("a");
    link.className = "glossary-term";
    link.setAttribute("href", entry.url);
    link.setAttribute("data-definition", entry.definition);
    link.textContent = text;
    return link;
  }

  /**
   * Replace the first matching glossary concept found in a single text node.
   *
   * Important behaviour:
   * - only the first occurrence of each concept is linked on the page
   * - if an alias matched first, the canonical term is considered "seen" too
   *
   * Example:
   * If "API" matched earlier, we should not later link
   * "Application Programming Interface" on the same page.
   */
  function wrapFirstMatchInTextNode(textNode, entries, seenConcepts) {
    const text = textNode.nodeValue;
    if (!text || !text.trim()) return false;

    for (const entry of entries) {
      if (seenConcepts.has(entry.key)) continue;

      const match = findEntryMatch(text, entry);
      if (!match) continue;

      const fragment = document.createDocumentFragment();
      const start = match.index;
      const end = start + match.text.length;

      fragment.appendChild(
        document.createTextNode(text.slice(0, start))
      );

      fragment.appendChild(
        createGlossaryLink(match.text, entry)
      );

      fragment.appendChild(
        document.createTextNode(text.slice(end))
      );

      textNode.parentNode.replaceChild(fragment, textNode);
      seenConcepts.add(entry.key);

      console.log("Matched glossary concept:", entry.canonicalTerm, "via", match.text);

      return true;
    }

    return false;
  }

  /**
   * Walk all text nodes in the chosen root element, skipping excluded
   * containers and linking glossary terms where appropriate.
   *
   * We gather the text nodes first, then process them. This avoids
   * interfering with the tree walker while mutating the DOM.
   */
  function processNode(root, entries) {
    const walker = document.createTreeWalker(
      root,
      NodeFilter.SHOW_TEXT,
      null
    );

    const textNodes = [];
    const seenConcepts = new Set();
    let node;

    while ((node = walker.nextNode())) {
      if (!shouldSkipNode(node)) {
        textNodes.push(node);
      }
    }

    for (const textNode of textNodes) {
      wrapFirstMatchInTextNode(textNode, entries, seenConcepts);
    }
  }

  /**
   * Initialise glossary enhancement after the DOM is ready.
   *
   * Expected input:
   * window.GLOSSARY = [
   *   {
   *     term: "...",
   *     definition: "...",         --> definition of the term
   *     citation: "...",           --> citation in case definition comes from a paper
   *     aliases: [...],            --> aliases for the term
   *     sources: [                 --> generally one, but can have multiple
   *        {
   *            "label": "...",     --> label for the source
   *            "url": "..."        --> url for the source
   *        }
   *     ]
   *   }
   * ]
   */
  document.addEventListener("DOMContentLoaded", function () {
    const glossary = window.GLOSSARY || [];
    const entries = buildEntries(glossary);

    // Prefer the main content area if present so we do not accidentally
    // process navigation, footer content or other non-body page regions.
    const content = document.querySelector("main") || document.body;

    console.log("Glossary entries prepared:", entries.length);
    processNode(content, entries);
  });
})();