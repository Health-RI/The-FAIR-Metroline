(function () {
  'use strict';

  var counter = 0;

  // H3 headings matching "Step N..." collapse by default
  var STEP_HEADING_RE = /^Step\s+\d+/i;

  function shouldStartCollapsed(heading) {
    if (heading.classList.contains('cs-collapsed')) return true;
    if (heading.tagName === 'H3' && STEP_HEADING_RE.test(heading.textContent.trim())) return true;
    return false;
  }

  function makeCollapsible(container, headingTag, stopSelectors) {
    var headings = Array.from(container.querySelectorAll(':scope > ' + headingTag));
    headings.forEach(function (heading) {
      var id = 'cs-' + (++counter);

      // Collect following direct siblings until a stop-level heading
      var toMove = [];
      var next = heading.nextElementSibling;
      while (next) {
        if (stopSelectors.some(function (s) { return next.matches(s); })) break;
        toMove.push(next);
        next = next.nextElementSibling;
      }

      if (toMove.length === 0) return;

      var collapsed = shouldStartCollapsed(heading);

      // Create the Bootstrap collapse wrapper
      var wrapper = document.createElement('div');
      wrapper.id = id;
      wrapper.classList.add('collapse', 'cs-section');
      if (!collapsed) wrapper.classList.add('show');
      heading.insertAdjacentElement('afterend', wrapper);
      toMove.forEach(function (el) { wrapper.appendChild(el); });

      // Wire up Bootstrap collapse on the heading
      heading.setAttribute('data-bs-toggle', 'collapse');
      heading.setAttribute('data-bs-target', '#' + id);
      heading.setAttribute('aria-expanded', String(!collapsed));
      heading.setAttribute('aria-controls', id);
      heading.classList.add('cs-heading');
    });
  }

  document.addEventListener('DOMContentLoaded', function () {
    var content = document.getElementById('content');
    if (!content) return;

    // Pass 1: wrap H2 sections (everything up to the next H2)
    makeCollapsible(content, 'h2', ['h2']);

    // Pass 2: wrap H3 sections within each H2 wrapper
    content.querySelectorAll('.cs-section').forEach(function (wrapper) {
      makeCollapsible(wrapper, 'h3', ['h3']);
    });
  });
})();
