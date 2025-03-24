ScrollReveal().reveal('section', { delay: 300, distance: '20px', origin: 'bottom' });

function filtrar(marca) {
  document.querySelectorAll('.producto').forEach(img => {
    img.style.display = img.classList.contains(marca) ? 'block' : 'none';
  });
}
function cambiarIdioma(idioma) {
  // Aquí puedes cambiar dinámicamente textos usando JS si deseas
  alert("Idioma cambiado a: " + idioma.toUpperCase());
}
