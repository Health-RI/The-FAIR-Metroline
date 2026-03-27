---
title: Contact
---

Thank you for your interest in FAIR Metroline. If you have any questions, comments or suggestions, we’d be happy to hear from you. Please feel free to reach out at any time.

## General enquiries
For all general questions or to contact the editorial team, please email [Mijke Jetten](mailto:mijke.jetten@health-ri.nl) or [Sander de Ridder](mailto:sander.deridder@health-ri.nl).

## Quick suggestion
Have questions, suggestions or comments about a FAIR Metroline step? Use the form below to share your feedback with us.

_Note: If you previously opened this form without submitting it, Microsoft Forms may offer to resume the old draft. Choose “Create new draft” to start a fresh feedback form for this page._

<div class="responsive-iframe-container">
  <iframe
    id="feedback-form"
    allowfullscreen
    loading="lazy"
    referrerpolicy="no-referrer">
  </iframe>
</div>

<script>
  const params = new URLSearchParams(window.location.search);
  const src = params.get("src") || "";

  // prefill "4. Which page?" (=race1cfc093884912b8348e9c4f3441ff) with the value provided by the URL (if available)
  const formBase = "https://forms.office.com/Pages/ResponsePage.aspx?id=CuPeS5QMZUi8Uh2fiUpJdWSpamuZzTlOrxbb6u-zC4hUNDZJSERMWDFKV05VQURQM0xURFJLUDBNWS4u";
  const formUrl = formBase + "&race1cfc093884912b8348e9c4f3441ff=" + encodeURIComponent(src);

  document.getElementById("feedback-form").src = formUrl;

  // clear the parameter from the address to make it look more pretty
  if (params.has("src")) {
    window.history.replaceState({}, "", window.location.pathname);
  }
</script>

