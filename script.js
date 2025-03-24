function cambiarIdioma(idioma) {
  document.querySelectorAll('[data-es], [data-en]').forEach(el => {
    el.textContent = el.dataset[idioma];
  });
}
function filtrar(clase) {
  document.querySelectorAll('.galeria img').forEach(img => {
    if (clase === 'todo' || img.classList.contains(clase)) {
      img.style.display = '';
    } else {
      img.style.display = 'none';
    }
  });
}
