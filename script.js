let FF_FOUC_FIX; // to prevent Firefox FOUC

/**
 * For toggling the abstract.
 */
function toggleAbstract(link) {
  const abstract = link.closest('.pub-body').querySelector('.pub-abstract');
  abstract.classList.toggle('open');
  link.textContent = abstract.classList.contains('open')
	? 'Abstract \u{25B2}'
	: 'Abstract \u{25BC}';
}
