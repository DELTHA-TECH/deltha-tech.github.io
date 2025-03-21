#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Instalando dependencias necesarias..."
pkg update -y && pkg upgrade -y
pkg install -y git imagemagick

echo "[+] Verificando carpetas necesarias..."
mkdir -p images/{Samsung,Xiaomi,Honor,iPhone,ServicioTecnico,Forense,Logos}

echo "[+] Optimización de imágenes a menos de 300 KB..."
find images -type f -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" -exec mogrify -resize 1024x1024\> -quality 85 -strip {} +

echo "[+] Creando index.html futurista con todos los elementos..."
cp index.html index_backup_$(date +%s).html

cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELTHA-TECH</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
  <style>
    body {
      margin: 0; padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #000000, #0f0f0f);
      color: white;
      overflow-x: hidden;
    }
    header {
      text-align: center;
      padding: 50px 20px;
      background: rgba(0,0,0,0.3);
      backdrop-filter: blur(10px);
    }
    header img {
      max-width: 200px;
      filter: drop-shadow(0 0 15px cyan);
    }
    h1 {
      font-size: 3em;
      color: cyan;
      text-shadow: 0 0 20px cyan;
    }
    .intro, .forense-intro {
      padding: 30px;
      text-align: center;
      background: rgba(0,0,0,0.5);
      margin: 20px;
      border-radius: 15px;
    }
    .galeria, .servicios, .forense {
      padding: 30px;
    }
    .galeria h2, .servicios h2, .forense h2 {
      color: #00ffff;
      text-align: center;
      font-size: 2em;
    }
    .grid {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .item {
      background: #111;
      border: 1px solid cyan;
      border-radius: 10px;
      overflow: hidden;
      max-width: 220px;
      text-align: center;
      box-shadow: 0 0 15px cyan;
      transition: transform 0.3s;
    }
    .item:hover {
      transform: scale(1.05);
    }
    .item img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }
    .item p {
      padding: 10px;
    }
    .whatsapp-button {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #25D366;
      border-radius: 50%;
      width: 60px;
      height: 60px;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 0 20px #25D366;
      z-index: 9999;
      animation: bounce 2s infinite;
    }
    .whatsapp-button::after {
      content: "¿Necesitas ayuda?";
      position: absolute;
      bottom: 70px;
      right: 0;
      background: rgba(0,0,0,0.8);
      padding: 5px 10px;
      color: white;
      font-size: 0.8em;
      border-radius: 10px;
      display: none;
    }
    .whatsapp-button:hover::after {
      display: block;
    }
    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }
  </style>
</head>
<body>

<header>
  <img src="images/Logos/DELTHA-TECH logo.jpg" alt="DELTHA-TECH Logo">
  <h1>DELTHA-TECH</h1>
</header>

<div class="intro">
  <p>En <strong>DELTHA-TECH</strong> nos especializamos en la venta de celulares Samsung, Xiaomi, Honor, iPhone, y en brindar servicios técnicos avanzados. ¡Lideramos la tecnología!</p>
</div>

<section class="galeria">
  <h2>Galería de Productos por Marca</h2>
  <div class="grid">
    $(for marca in Samsung Xiaomi Honor iPhone; do
      for img in images/$marca/*; do
        nombre=$(basename "$img")
        modelo=\$(echo "\$nombre" | sed 's/\.[^.]*\$//' | tr '_' ' ')
        echo "<div class='item'><img src='\$img'><p><strong>$marca:</strong> \$modelo</p></div>"
      done
    done)
  </div>
</section>

<section class="servicios">
  <h2>Servicios Técnicos</h2>
  <div class="grid">
    <div class="item"><img src="images/ServicioTecnico/Cambio de pantalla.jpg"><p>Cambio de pantalla</p></div>
    <div class="item"><img src="images/ServicioTecnico/Cambio de glas.jpg"><p>Cambio de glass</p></div>
    <div class="item"><img src="images/ServicioTecnico/Cambio de batería.jpg"><p>Cambio de batería</p></div>
    <div class="item"><img src="images/ServicioTecnico/Cambio de entrada.jpg"><p>Cambio de entrada</p></div>
    <div class="item"><img src="images/ServicioTecnico/Reparación de placas.jpg"><p>Reparación de placas</p></div>
  </div>
</section>

<section class="forense">
  <h2>Análisis Forense Digital</h2>
  <div class="forense-intro">
    <p>Recuperamos fotos, videos, documentos y analizamos dispositivos móviles y computadoras con tecnología de última generación.</p>
  </div>
  <div class="grid">
    $(for img in images/Forense/*; do
      nombre=$(basename "$img")
      titulo=\$(echo "\$nombre" | sed 's/\.[^.]*\$//' | tr '_' ' ')
      echo "<div class='item'><img src='\$img'><p>\$titulo</p></div>"
    done)
  </div>
</section>

<a href="https://wa.me/51910763905" class="whatsapp-button">
  <img src="https://cdn-icons-png.flaticon.com/512/124/124034.png" width="30" alt="WhatsApp">
</a>

</body>
</html>
EOF

echo "[+] Subiendo cambios a GitHub..."
git add .
git commit -m "Versión ultra futurista con logos, galería, intro y secciones mejoradas"
git push

echo "[+] Sitio actualizado: https://deltha-tech.github.io/"
