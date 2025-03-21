#!/data/data/com.termux/files/usr/bin/bash

# Paso 1: Crear carpetas si no existen
mkdir -p images/{Samsung,Xiaomi,iPhone,Honor,Forense,ServicioTecnico,Logos,Otros}

# Paso 2: Optimizar imágenes a <300KB
echo "Optimizando imágenes..."
find images/ -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -exec mogrify -resize 800x800 -quality 80 -strip {} \;

# Paso 3: Crear index.html futurista y responsivo
echo "Generando index.html..."

cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELTHA-TECH</title>
  <link rel="icon" href="images/Logos/favicon.ico" type="image/x-icon">
  <style>
    body {
      margin: 0;
      font-family: 'Orbitron', sans-serif;
      background: linear-gradient(135deg, #000000, #0f0f0f);
      color: #00ffee;
      overflow-x: hidden;
    }
    header {
      background: rgba(0, 0, 0, 0.9);
      padding: 20px;
      text-align: center;
      font-size: 2em;
      letter-spacing: 3px;
      border-bottom: 2px solid #0ff;
      box-shadow: 0 0 15px #0ff;
    }
    .galeria {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
      gap: 15px;
      padding: 20px;
    }
    .galeria img {
      width: 100%;
      border: 2px solid #0ff;
      border-radius: 10px;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
    }
    .galeria img:hover {
      transform: scale(1.1);
      box-shadow: 0 0 20px #0ff;
    }
    #whatsapp {
      position: fixed;
      bottom: 25px;
      right: 25px;
      z-index: 999;
      animation: neonPulse 1.5s infinite;
    }
    #whatsapp img {
      width: 60px;
      height: 60px;
    }
    @keyframes neonPulse {
      0%, 100% { filter: drop-shadow(0 0 5px #0f0) drop-shadow(0 0 10px #0f0); }
      50% { filter: drop-shadow(0 0 15px #0f0) drop-shadow(0 0 30px #0f0); }
    }
  </style>
</head>
<body>
  <header>DELTHA-TECH</header>

  <div class="galeria">
EOF

# Paso 4: Insertar imágenes automáticamente en la galería
for dir in Samsung Xiaomi iPhone Honor Forense ServicioTecnico Logos; do
  for img in images/$dir/*; do
    if [ -f "$img" ]; then
      echo "    <img src=\"$img\" alt=\"$dir\">" >> index.html
    fi
  done
done

# Cierre del HTML
cat >> index.html <<EOF
  </div>

  <div id="whatsapp">
    <a href="https://wa.me/51910763905" target="_blank">
      <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
    </a>
  </div>
</body>
</html>
EOF

# Paso 5: Subir a GitHub
git add .
git commit -m "Corrigiendo errores y mejorando página futurista"
git push

echo "¡Página actualizada exitosamente con diseño futurista y galería funcional!"
