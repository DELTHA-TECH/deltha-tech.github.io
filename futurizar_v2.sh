#!/data/data/com.termux/files/usr/bin/bash

echo "==> Instalando dependencias necesarias..."
pkg update -y && pkg install -y git imagemagick

echo "==> Optimizando imágenes a menos de 300KB..."
find logo logos_marcas productos servicio_tecnico analisis_forense -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' | while read img; do
  convert "$img" -resize 1080x1080\> -quality 85 -define jpeg:extent=300KB "$img"
done

echo "==> Generando archivo index.html futurista..."
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELTHA-TECH | Tecnología y Servicios Futuristas</title>
  <link rel="stylesheet" href="style.css">
  <script src="https://unpkg.com/scrollreveal"></script>
</head>
<body>
  <div class="fondo-animado"></div>

  <header>
    <img src="logo/DELTHA-TECH logo.jpg" alt="Logo DELTHA-TECH" class="logo-central">
    <h1 class="titulo">Bienvenido a DELTHA-TECH</h1>
    <p class="intro">Especialistas en venta de celulares Samsung, Xiaomi, Honor, iPhone, análisis forense y servicio técnico profesional.</p>
  </header>

  <nav class="menu-glass">
    <button onclick="cambiarIdioma('es')">ES</button>
    <button onclick="cambiarIdioma('en')">EN</button>
  </nav>

  <section id="galeria" class="galeria-productos">
    <h2>Productos</h2>
    <div class="filtros">
      <button onclick="filtrar('samsung')"><img src="logos_marcas/Logo Samsung.jpg" alt="Samsung"></button>
      <button onclick="filtrar('xiaomi')"><img src="logos_marcas/Logo Xiaomi.jpg" alt="Xiaomi"></button>
      <button onclick="filtrar('honor')"><img src="logos_marcas/Logo Honor.jpg" alt="Honor"></button>
      <button onclick="filtrar('iphone')"><img src="logos_marcas/Logo iPhone.jpg" alt="iPhone"></button>
    </div>
    <div class="productos">
EOF

# Agregar imágenes de productos
for marca in samsung xiaomi honor iphone; do
  for img in productos/$marca/*; do
    nombre=$(basename "$img")
    echo "<img src=\"$img\" alt=\"$nombre\" class=\"producto $marca\">" >> index.html
  done
done

cat >> index.html << 'EOF'
    </div>
  </section>

  <section class="servicio-tecnico">
    <h2>Servicio Técnico Especializado</h2>
    <p>Realizamos cambio de pantalla, batería, glass, entrada, flex, placas, y más.</p>
    <div class="imagenes-servicio">
EOF

# Agregar imágenes del servicio técnico
for img in servicio_tecnico/*; do
  nombre=$(basename "$img")
  echo "<figure><img src=\"$img\" alt=\"$nombre\"><figcaption>$nombre</figcaption></figure>" >> index.html
done

cat >> index.html << 'EOF'
    </div>
  </section>

  <section class="analisis-forense">
    <h2>Análisis Forense y Recuperación de Datos</h2>
    <p>Recuperamos fotos, videos y documentos de celulares y computadoras.</p>
    <div class="imagenes-analisis">
EOF

# Agregar imágenes de análisis forense
for img in analisis_forense/*; do
  nombre=$(basename "$img")
  echo "<figure><img src=\"$img\" alt=\"$nombre\"><figcaption>$nombre</figcaption></figure>" >> index.html
done

cat >> index.html << 'EOF'
    </div>
  </section>

  <footer>
    <h3>Contáctanos</h3>
    <p>WhatsApp: <a href="https://wa.me/51910763905">910-763-905</a> / <a href="https://wa.me/51987180885">987-180-885</a></p>
    <p>Correo: contacto@deltha-tech.com</p>
    <p>Ubicación: Perú</p>
  </footer>

  <div class="whatsapp-boton" onclick="window.open('https://wa.me/51910763905','_blank')">
    <div class="mensaje-hover">¿Necesitas ayuda?</div>
  </div>

  <script src="script.js"></script>
</body>
</html>
EOF

echo "==> Generando estilos futuristas..."
cat > style.css << 'EOF'
body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background: #0f0f1a;
  color: #eee;
  overflow-x: hidden;
}
.fondo-animado {
  position: fixed;
  width: 100%;
  height: 100%;
  background: radial-gradient(circle, #0ff2, #00f1), url('logo/DELTHA-TECH logo.jpg') center center no-repeat;
  background-size: contain;
  opacity: 0.03;
  z-index: -1;
}
.logo-central {
  width: 180px;
  margin: 20px auto;
  display: block;
}
.titulo, .intro {
  text-align: center;
}
.menu-glass {
  backdrop-filter: blur(12px);
  background: rgba(255, 255, 255, 0.05);
  padding: 10px;
  display: flex;
  justify-content: center;
  gap: 20px;
}
.galeria-productos .filtros img {
  width: 40px;
  height: auto;
}
.productos, .imagenes-servicio, .imagenes-analisis {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 10px;
}
.productos img, .imagenes-servicio img, .imagenes-analisis img {
  width: 160px;
  height: auto;
  border-radius: 10px;
  transition: transform 0.3s;
}
.productos img:hover, .imagenes-servicio img:hover, .imagenes-analisis img:hover {
  transform: scale(1.05);
}
.whatsapp-boton {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #25d366;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  box-shadow: 0 0 20px #25d366;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  animation: rebote 2s infinite;
}
.mensaje-hover {
  display: none;
  position: absolute;
  bottom: 70px;
  right: 20px;
  background: #111;
  padding: 5px 10px;
  border-radius: 6px;
  color: #0f0;
}
.whatsapp-boton:hover .mensaje-hover {
  display: block;
}
@keyframes rebote {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-6px); }
}
EOF

echo "==> Generando script de interacción..."
cat > script.js << 'EOF'
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
EOF

echo "==> Subiendo todo a GitHub..."
git add .
git commit -m "Actualización futurista con diseño interactivo v2"
git push

echo "==> ¡Sitio web DELTHA-TECH actualizado con éxito!"
