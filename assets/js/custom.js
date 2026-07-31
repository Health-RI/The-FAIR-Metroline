// Matomo analytics tracking for all pages.
var _paq = window._paq = window._paq || [];

_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);

(function() {
  var u = 'https://healthri.matomo.cloud/';
  _paq.push(['setTrackerUrl', u + 'matomo.php']);
  _paq.push(['setSiteId', '7']);

  var d = document;
  var g = d.createElement('script');
  var s = d.getElementsByTagName('script')[0];
  g.async = true;
  g.src = 'https://cdn.matomo.cloud/healthri.matomo.cloud/matomo.js';
  s.parentNode.insertBefore(g, s);
})();
