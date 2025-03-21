function filtrar(marca) {
  const productos = document.querySelectorAll('.producto');
  productos.forEach(p => {
    if (marca === 'todos' || p.classList.contains(marca)) {
      p.style.display = 'block';
    } else {
      p.style.display = 'none';
    }
  });
}
