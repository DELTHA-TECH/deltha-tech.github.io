#!/bin/bash

# Optimizar imágenes a menos de 300KB
echo "Optimizando imágenes..."
find images/ -type f -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -exec mogrify -strip -resize 1920x1920\> -quality 80 -path {} \;

# Regenerar index.html
echo "Generando index.html..."

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>DELTHA-TECH | Tecnología Futurista</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="images/Logos/favicon.ico">
  <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Orbitron', sans-serif;
      background: linear-gradient(135deg, #0f0f0f, #1a1a1a);
      color: #0ff;
    }
    h1, h2 { text-align: center; color: #0ff; }
    .galeria { display: flex; flex-wrap: wrap; justify-content: center; gap: 10px; padding: 10px; }
    .galeria img {
      width: 180px; height: auto;
      border: 2px solid #0ff;
      border-radius: 8px;
      transition: transform 0.3s ease;
    }
    .galeria img:hover {
      transform: scale(1.1);
      box-shadow: 0 0 20px #0ff;
    }
    .logo { width: 180px; display: block; margin: auto; }
    .section { padding: 20px; }
  </style>
</head>
<body>
  <img src="images/Logos/$(ls images/Logos | grep -i 'deltha' | head -n 1)" alt="Logo DELTHA-TECH" class="logo">
  <h1>Bienvenidos a DELTHA-TECH</h1>
  <h2>Celulares por Marca</h2>
EOF

# Insertar cada sección de productos automáticamente
for marca in Samsung Xiaomi iPhone Honor; do
  echo "<div class='section'><h2>$marca</h2><div class='galeria'>" >> index.html
  for img in images/$marca/*; do
    nombre=$(basename "$img")
    echo "<img src=\"$img\" alt=\"$nombre\">" >> index.html
  done
  echo "</div></div>" >> index.html
done

# Sección de análisis forense
echo "<div class='section'><h2>Análisis Forense</h2><div class='galeria'>" >> index.html
for img in images/Forense/*; do
  nombre=$(basename "$img")
  echo "<img src=\"$img\" alt=\"$nombre\">" >> index.html
done
echo "</div></div>" >> index.html

# Sección de servicios técnicos
echo "<div class='section'><h2>Servicios Técnicos</h2><div class='galeria'>" >> index.html
for img in images/ServicioTecnico/*; do
  nombre=$(basename "$img")
  echo "<img src=\"$img\" alt=\"$nombre\">" >> index.html
done
echo "</div></div>" >> index.html

# WhatsApp flotante
cat <<EOF >> index.html
<a href="https://wa.me/51910763905" style="position:fixed;bottom:20px;right:20px;background:#25d366;color:white;border-radius:50%;padding:15px;font-size:20px;box-shadow:0 0 15px #25d366;z-index:1000;text-decoration:none;" title="¿Necesitas ayuda?">
  WhatsApp
</a>
</body>
</html>
EOF

# Subir cambios a GitHub
git add .
git commit -m "Actualizando galería con imágenes aplicadas"
git push
echo "¡Página web actualizada con éxito!"
