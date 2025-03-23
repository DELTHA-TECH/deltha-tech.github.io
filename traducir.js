function cambiarIdioma() {
  const textos = document.querySelectorAll('[data-es], [data-en]');
  textos.forEach(el => {
    if (el.innerText === el.getAttribute("data-es")) {
      el.innerText = el.getAttribute("data-en");
    } else {
      el.innerText = el.getAttribute("data-es");
    }
  });
}
