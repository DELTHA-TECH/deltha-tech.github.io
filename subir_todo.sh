#!/data/data/com.termux/files/usr/bin/bash

# Instalar herramientas necesarias
pkg update -y
pkg install -y git imagemagick

# Rutas internas de imágenes
ORIGEN="/storage/emulated/0/Pictures/Gallery/owner"
DESTINO="$HOME/deltha-tech.github.io/images"
mkdir -p "$DESTINO"

# Optimizar imágenes < 300KB
echo "Optimizando imágenes..."

find "$ORIGEN" -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' | while read -r IMG; do
    NOMBRE=$(basename "$IMG")
    convert "$IMG" -resize 1080x1080 -strip -quality 85 "$DESTINO/$NOMBRE"
    echo "Optimizado: $NOMBRE"
done

# Logo como favicon
cp "$DESTINO/DELTHA-TECH logo.jpg" "$HOME/deltha-tech.github.io/favicon.ico"

# Crear nuevo index futurista
cat > "$HOME/deltha-tech.github.io/index.html" <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DELTHA-TECH</title>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: url('images/DELTHA-TECH logo.jpg') no-repeat center center fixed;
      background-size: contain;
      background-blend-mode: soft-light;
      background-color: #0c0c0c;
      color: white;
    }
    header {
      text-align: center;
      padding: 2rem;
    }
    header img {
      max-width: 300px;
      filter: drop-shadow(0 0 15px cyan);
    }
    section {
      padding: 2rem;
    }
    h2 {
      border-left: 4px solid cyan;
      padding-left: 1rem;
      color: cyan;
    }
    .galeria img {
      width: 150px;
      margin: 10px;
      border: 2px solid cyan;
      border-radius: 10px;
      transition: 0.3s;
    }
    .galeria img:hover {
      transform: scale(1.1);
      box-shadow: 0 0 10px cyan;
    }
    .whatsapp-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #25d366;
      color: white;
      padding: 15px;
      border-radius: 50%;
      font-size: 24px;
      text-decoration: none;
      box-shadow: 0 0 10px #25d366;
    }
  </style>
</head>
<body>

<header>
  <img src="images/Logo DELTHA-TECH.jpg" alt="DELTHA-TECH Logo">
  <h1>Bienvenido a DELTHA-TECH</h1>
  <p>Tu tienda y servicio técnico futurista</p>
</header>

<section>
  <h2>Productos Samsung</h2>
  <div class="galeria">
    <img src="images/A05.png">
    <img src="images/A06.jpg">
    <img src="images/A16.png">
    <img src="images/A25.png">
    <img src="images/A35.jpg">
    <img src="images/A55 .png">
    <img src="images/S24 ultra.jpg">
  </div>
</section>

<section>
  <h2>Productos Xiaomi</h2>
  <div class="galeria">
    <img src="images/13 4g.webp">
    <img src="images/14c.jpg">
    <img src="images/A3 x.jpg">
    <img src="images/A3.jpg">
    <img src="images/Note 13 pro plus.jpg">
    <img src="images/Note 13.png">
    <img src="images/Note 14.png">
  </div>
</section>

<section>
  <h2>Productos Honor</h2>
  <div class="galeria">
    <img src="images/Magic 7 Lite.webp">
    <img src="images/Play 9A.jpg">
    <img src="images/X 6b.jpg">
    <img src="images/X 7b.jpg">
    <img src="images/X 8c.png">
  </div>
</section>

<section>
  <h2>Productos iPhone</h2>
  <div class="galeria">
    <img src="images/13.webp">
    <img src="images/15 pro max.png">
    <img src="images/15.png">
    <img src="images/16 pro max.jpg">
    <img src="images/16.jpg">
  </div>
</section>

<section>
  <h2>Servicios Técnicos</h2>
  <div class="galeria">
    <img src="images/Cambio de batería.jpg">
    <img src="images/Cambio de entrada.jpg">
    <img src="images/Cambio de glas.jpg">
    <img src="images/Cambio de pantalla.jpg">
    <img src="images/Reparación de placas.jpg">
  </div>
</section>

<section>
  <h2>Análisis Forense</h2>
  <p>Recuperamos fotos, videos, documentos y datos eliminados de celulares y computadoras.</p>
  <div class="galeria">
    <img src="images/Recuperación de información 1.png">
    <img src="images/Recuperación de información 2.png">
  </div>
</section>

<a class="whatsapp-btn" href="https://wa.me/51910763905" target="_blank">W</a>

</body>
</html>
EOF

# Subir a GitHub
cd "$HOME/deltha-tech.github.io"
git add .
git commit -m "Actualizando página futurista con imágenes optimizadas y logo"
git push
