#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Actualizando página web futurista..."

# Variables
INDEX="index.html"
BACKUP="index_backup_$(date +%s).html"

# 1. Respaldo
cp $INDEX $BACKUP
echo "[+] Respaldo creado: $BACKUP"

# 2. Crear nuevo contenido con actualizaciones
cat > $INDEX <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>DELTHA-TECH | Tecnología Futurista</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
      color: white;
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
      scroll-behavior: smooth;
    }
    header {
      text-align: center;
      padding: 40px 20px;
      background: rgba(0,0,0,0.6);
    }
    header h1 {
      font-size: 3em;
      color: #00f0ff;
      text-shadow: 0 0 10px #00f0ff;
    }
    .intro {
      text-align: center;
      padding: 20px;
      font-size: 1.2em;
      max-width: 900px;
      margin: auto;
      background: rgba(255,255,255,0.05);
      border-radius: 10px;
    }
    .section {
      padding: 40px 20px;
    }
    .section h2 {
      text-align: center;
      font-size: 2em;
      margin-bottom: 30px;
      color: #00f0ff;
      text-shadow: 0 0 5px #00f0ff;
    }
    .gallery {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .gallery-item {
      max-width: 220px;
      text-align: center;
    }
    .gallery-item img {
      width: 100%;
      border-radius: 10px;
      transition: transform 0.3s ease;
    }
    .gallery-item:hover img {
      transform: scale(1.05);
      box-shadow: 0 0 15px #00f0ff;
    }
    .desc {
      margin-top: 8px;
      font-size: 0.95em;
      color: #ccc;
    }
  </style>
</head>
<body>

<header>
  <h1>DELTHA-TECH</h1>
</header>

<section class="intro">
  <p>Bienvenidos a <strong>DELTHA-TECH</strong>, tu tienda y centro de servicios tecnológicos de confianza. Ofrecemos celulares de última generación de marcas como Samsung, Xiaomi, Honor e iPhone. También somos expertos en análisis forense digital y recuperación de datos.</p>
</section>

<section class="section">
  <h2>Servicio Técnico</h2>
  <div class="gallery">
EOF

# 3. Agregar imágenes de Servicio Técnico con descripción
for img in images/ServicioTecnico/*; do
  filename=$(basename "$img")
  case "$filename" in
    *pantalla*) desc="Cambio de pantalla";;
    *batería*|*bateria*) desc="Cambio de batería";;
    *glas*) desc="Cambio de glass";;
    *entrada*) desc="Cambio de entrada";;
    *placas*) desc="Reparación de placas";;
    *) desc="Servicio técnico";;
  esac
  echo "    <div class='gallery-item'><img src='$img'><div class='desc'>$desc</div></div>" >> $INDEX
done

# 4. Añadir sección de análisis forense
cat >> $INDEX <<EOF
  </div>
</section>

<section class="section">
  <h2>Análisis Forense</h2>
  <div class="intro">
    <p>Realizamos análisis forense profesional en celulares y computadoras. Recuperamos fotos eliminadas, videos importantes y documentos valiosos, incluso en casos críticos.</p>
  </div>
  <div class="gallery">
EOF

# 5. Agregar imágenes de Forense
for img in images/Forense/*; do
  echo "    <div class='gallery-item'><img src='$img'><div class='desc'>Recuperación de datos</div></div>" >> $INDEX
done

# 6. Cierre
cat >> $INDEX <<EOF
  </div>
</section>

</body>
</html>
EOF

# 7. Subir a GitHub
echo "[+] Subiendo cambios a GitHub..."
git add index.html
git commit -m "Actualización futurista con introducción y descripciones de servicios"
git push

echo "[+] Actualización completada. Verifica en: https://deltha-tech.github.io/"
