(function () {
  'use strict';

  var counter = 0;

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

      // Create the Bootstrap collapse wrapper
      var wrapper = document.createElement('div');
      wrapper.id = id;
      wrapper.classList.add('collapse', 'show', 'cs-section');
      heading.insertAdjacentElement('afterend', wrapper);
      toMove.forEach(function (el) { wrapper.appendChild(el); });

      // Wire up Bootstrap collapse on the heading
      heading.setAttribute('data-bs-toggle', 'collapse');
      heading.setAttribute('data-bs-target', '#' + id);
      heading.setAttribute('aria-expanded', 'true');
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
