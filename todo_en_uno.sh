#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[1;36m────────── DELTHA-TECH FULL POWER ──────────\033[0m"
sleep 1

# Paso 1: Optimizar imágenes
echo -e "\033[1;34m[1/4] Optimización de imágenes...\033[0m"
count=0
saved_kb=0
find assets/images -type f -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" | while read img; do
    original_size=$(du -k "$img" | cut -f1)
    mogrify -resize 1024x1024\> -quality 85 "$img"
    new_size=$(du -k "$img" | cut -f1)
    reduced=$((original_size - new_size))
    ((saved_kb+=reduced))
    echo -e "[✔] $(basename "$img") optimizada ↓$reduced KB"
done
echo -e "\033[1;32m→ Total ahorrado: $saved_kb KB\033[0m"

# Paso 2: Generar HTML futurista
echo -e "\033[1;34m[2/4] Generando index.html futurista...\033[0m"

cat > index.html << 'HTML'
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DELTHA-TECH | Tecnología Futurista</title>
  <link rel="stylesheet" href="style.css">
  <script defer src="script.js"></script>
</head>
<body>
  <header class="glass">
    <img src="assets/images/Logo DELTHA-TECH.jpg" class="logo-principal">
    <h1 id="intro">Tecnología del Futuro, Hoy</h1>
    <div class="language-toggle">
      <button onclick="cambiarIdioma('es')">ES</button>
      <button onclick="cambiarIdioma('en')">EN</button>
    </div>
  </header>

  <main>
    <section id="productos">
      <h2 data-es="Nuestros Productos" data-en="Our Products">Nuestros Productos</h2>
      <div class="filtros">
        <button onclick="filtrar('todo')">Todo</button>
        <button onclick="filtrar('samsung')">Samsung</button>
        <button onclick="filtrar('xiaomi')">Xiaomi</button>
        <button onclick="filtrar('honor')">Honor</button>
        <button onclick="filtrar('iphone')">iPhone</button>
      </div>
      <div class="galeria">
        <!-- Aquí se insertan las imágenes automáticamente -->
HTML

# Insertar imágenes en galería por carpeta
for brand in samsung xiaomi honor iphone; do
  carpeta="assets/images/modelós de ${brand^}"
  [ -d "$carpeta" ] && for img in "$carpeta"/*.{jpg,png,webp}; do
    [ -f "$img" ] && echo "<img src=\"$img\" class=\"item ${brand}\" loading=\"lazy\">" >> index.html
  done
done

# Continuar el HTML
cat >> index.html << 'HTML'
      </div>
    </section>

    <section id="servicios">
      <h2 data-es="Servicios Técnicos" data-en="Technical Services">Servicios Técnicos</h2>
      <div class="galeria">
HTML

# Servicios técnicos
for img in assets/images/servicio técnico/*.{jpg,png,webp}; do
  [ -f "$img" ] && {
    desc=$(basename "$img" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
    echo "<figure><img src=\"$img\" loading=\"lazy\"><figcaption>$desc</figcaption></figure>" >> index.html
  }
done

# Análisis forense
cat >> index.html << 'HTML'
      </div>
    </section>

    <section id="forense">
      <h2 data-es="Análisis Forense Digital" data-en="Digital Forensics">Análisis Forense Digital</h2>
      <p data-es="Recuperamos fotos, videos y documentos eliminados de celulares y computadoras." data-en="We recover deleted photos, videos and documents from phones and computers."></p>
      <div class="galeria">
HTML

for img in assets/images/análisis forence/*.{jpg,png,webp}; do
  [ -f "$img" ] && echo "<img src=\"$img\" loading=\"lazy\">" >> index.html
done

# Fin del HTML
cat >> index.html << 'HTML'
      </div>
    </section>
  </main>

  <div class="whatsapp-float" onclick="window.open('https://wa.me/51910763905','_blank')">
    <img src="assets/images/logo de marcas/whatsapp.png" alt="WhatsApp">
    <span class="tooltip" data-es="¿Necesitas ayuda?" data-en="Need help?">¿Necesitas ayuda?</span>
  </div>

</body>
</html>
HTML

# Paso 3: Agregar CSS y JS
echo -e "\033[1;34m[3/4] Agregando estilo futurista y funcionalidades...\033[0m"

cat > style.css << 'CSS'
body {
  margin: 0; font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(135deg, #000000, #0f0f1f);
  color: white; overflow-x: hidden;
}
header.glass {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 2rem; text-align: center;
}
.logo-principal {
  width: 120px; border-radius: 50%;
}
h1, h2 {
  text-shadow: 0 0 5px #0ff;
}
.filtros button {
  background: none; border: 1px solid #0ff; color: #0ff;
  margin: 0.2rem; padding: 0.5rem 1rem; border-radius: 5px;
}
.filtros button:hover {
  background: #0ff; color: black;
}
.galeria {
  display: flex; flex-wrap: wrap; justify-content: center;
  gap: 1rem; padding: 1rem;
}
.galeria img, figure {
  width: 160px; border: 2px solid #0ff; border-radius: 10px;
  transition: transform 0.3s ease;
}
figure figcaption {
  text-align: center; margin-top: 0.5rem; font-size: 0.9rem;
}
.galeria img:hover {
  transform: scale(1.05); box-shadow: 0 0 20px #0ff;
}
.language-toggle {
  margin-top: 1rem;
}
.language-toggle button {
  background: black; color: #0ff;
  border: 1px solid #0ff; padding: 0.5rem 1rem;
}
.whatsapp-float {
  position: fixed; bottom: 20px; right: 20px;
  background: #25D366; border-radius: 50%;
  width: 60px; height: 60px;
  display: flex; align-items: center; justify-content: center;
  box-shadow: 0 0 20px #25D366; animation: pulse 2s infinite;
}
.whatsapp-float img {
  width: 30px;
}
.tooltip {
  position: absolute; bottom: 70px; background: #0ff;
  color: black; padding: 5px 10px; border-radius: 5px;
  font-size: 0.8rem; display: none;
}
.whatsapp-float:hover .tooltip {
  display: block;
}
@keyframes pulse {
  0% { box-shadow: 0 0 5px #25D366; }
  50% { box-shadow: 0 0 20px #25D366; }
  100% { box-shadow: 0 0 5px #25D366; }
}
CSS

cat > script.js << 'JS'
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
JS

# Paso 4: Subir a GitHub
echo -e "\033[1;34m[4/4] Subiendo cambios a GitHub Pages...\033[0m"
git add .
git commit -m "Actualización futurista total con todo incluido"
git push

echo -e "\n\033[1;32m¡DELTHA-TECH actualizado y lanzado al futuro!\033[0m"
