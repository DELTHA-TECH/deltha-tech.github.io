#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Instalando dependencias necesarias..."
pkg update -y && pkg upgrade -y
pkg install -y git imagemagick

echo "[+] Verificando carpetas necesarias..."
mkdir -p images/{Samsung,Xiaomi,iPhone,Honor,Forense,ServicioTecnico,Logos}

echo "[+] Copiando imágenes desde almacenamiento interno..."
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de Samsung '/* images/Samsung/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de Xiaomi '/* images/Xiaomi/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de iPhone '/* images/iPhone/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de honor '/* images/Honor/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'análisis forence '/* images/Forense/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'servicio técnico '/* images/ServicioTecnico/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'logo DELTHA-TECH'/* images/Logos/ 2>/dev/null
cp -r ~/storage/shared/Pictures/Gallery/owner/'logo de marcas '/* images/Logos/ 2>/dev/null

echo "[+] Optimizando imágenes a menos de 300 KB..."
find images -type f -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -exec mogrify -strip -resize 1080x1080\> -quality 85 {} \;

echo "[+] Creando index.html futurista..."
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>DELTHA-TECH | Electrónica Futurista</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      background: linear-gradient(135deg, #000000, #0f2027, #203a43, #2c5364);
      color: #00ffe7;
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
      overflow-x: hidden;
    }
    h1, h2 {
      text-align: center;
      text-shadow: 0 0 10px #00ffe7;
    }
    .galeria {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
      gap: 12px;
      padding: 20px;
    }
    .galeria img {
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 0 12px #00ffe7;
      transition: transform 0.3s ease;
    }
    .galeria img:hover {
      transform: scale(1.05);
    }
    .whatsapp-btn {
      position: fixed;
      bottom: 25px;
      right: 25px;
      background-color: #25D366;
      color: white;
      border-radius: 50%;
      width: 65px;
      height: 65px;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 30px;
      box-shadow: 0 0 20px #25D366;
      z-index: 999;
      animation: bounce 2s infinite;
    }
    .whatsapp-msg {
      position: fixed;
      bottom: 95px;
      right: 25px;
      background-color: #222;
      color: #fff;
      padding: 8px 12px;
      border-radius: 10px;
      font-size: 14px;
      display: none;
    }
    .whatsapp-btn:hover + .whatsapp-msg {
      display: block;
    }
    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }
  </style>
</head>
<body>
  <h1>DELTHA-TECH</h1>
  <h2>Celulares y Servicios Técnicos Futuristas</h2>

  <div class="galeria">
    $(for folder in Samsung Xiaomi iPhone Honor Forense ServicioTecnico Logos; do
      for img in images/$folder/*; do
        echo "<img src='$img' alt='$folder'>"
      done
    done)
  </div>

  <a class="whatsapp-btn" href="https://wa.me/51910763905" target="_blank">W</a>
  <div class="whatsapp-msg">¿Necesitas ayuda?</div>
</body>
</html>
EOF

echo "[+] Subiendo a GitHub..."
git add .
git commit -m "Página futurista con galería y botón de WhatsApp"
git push

echo "[+] Sitio actualizado. Revisa: https://deltha-tech.github.io/"
