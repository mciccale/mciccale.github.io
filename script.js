// Abstract disclosure buttons: <button aria-expanded aria-controls="id">
// toggles the `hidden` attribute of the element with that id.
document.addEventListener('click', (event) => {
  const button = event.target.closest('.abstract-toggle');
  if (!button) return;
  const open = button.getAttribute('aria-expanded') !== 'true';
  button.setAttribute('aria-expanded', String(open));
  document.getElementById(button.getAttribute('aria-controls')).hidden = !open;
});
