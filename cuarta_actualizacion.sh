#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Iniciando cuarta actualización con mejoras visuales y correcciones..."

# Crear respaldo del index.html actual
cp index.html index_backup_$(date +%s).html
echo "[+] Respaldo de index.html creado."

# Reparar nombres de imágenes con espacios o codificación incorrecta
find images -type f | while read -r file; do
  clean_name=$(echo "$file" | sed 's/ /_/g' | sed 's/\\//g')
  if [ "$file" != "$clean_name" ]; then
    mv "$file" "$clean_name"
  fi
done

# Corregir rutas dentro de index.html
sed -i 's/ /_/g' index.html
sed -i 's/\\//g' index.html

# Inyectar mejoras al HTML automáticamente
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>DELTHA-TECH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      background: url('images/Logos/DELTHA-TECH_logo.jpg') no-repeat center center fixed;
      background-size: cover;
      color: #fff;
      font-family: 'Orbitron', sans-serif;
      margin: 0;
      padding: 0;
      backdrop-filter: blur(6px);
    }
    header {
      text-align: center;
      padding: 40px 10px 10px;
      background-color: rgba(0,0,0,0.6);
      border-bottom: 2px solid cyan;
    }
    header img {
      width: 180px;
      border-radius: 50%;
      border: 3px solid cyan;
    }
    h1 {
      margin: 15px 0 10px;
      font-size: 2.2em;
      text-shadow: 0 0 10px cyan;
    }
    h2 {
      margin: 30px 0 10px;
      font-size: 1.7em;
      text-align: center;
      color: #0ff;
      text-shadow: 0 0 8px #0ff;
    }
    .section {
      padding: 20px;
      margin: 20px auto;
      max-width: 1000px;
      background-color: rgba(0,0,0,0.6);
      border-radius: 12px;
    }
    .gallery img {
      max-width: 100%;
      width: 220px;
      margin: 10px;
      border: 2px solid #0ff;
      border-radius: 8px;
      transition: transform 0.3s ease;
    }
    .gallery img:hover {
      transform: scale(1.05);
    }
    .descripcion {
      text-align: center;
      font-size: 1em;
      margin-top: 5px;
    }
  </style>
</head>
<body>
<header>
  <img src="images/Logos/DELTHA-TECH_logo.jpg" alt="DELTHA-TECH Logo">
  <h1>Bienvenidos a DELTHA-TECH</h1>
  <p>Soluciones tecnológicas profesionales al alcance de tu mano</p>
</header>

<div class="section">
  <h2>¿Quiénes somos?</h2>
  <p style="text-align: center;">DELTHA-TECH es una empresa especializada en la venta de celulares modernos (Samsung, iPhone, Xiaomi, Honor) y servicios técnicos avanzados como cambio de pantallas, reparación de placas, análisis forense y recuperación de datos. Conectamos tecnología con soluciones reales.</p>
</div>

<div class="section">
  <h2>Servicios Técnicos</h2>
  <div class="gallery">
    <div>
      <img src="images/ServicioTecnico/Cambio_de_pantalla.jpg" alt="Cambio de pantalla">
      <div class="descripcion">Cambio de pantalla</div>
    </div>
    <div>
      <img src="images/ServicioTecnico/Reparación_de_placas.jpg" alt="Reparación de placas">
      <div class="descripcion">Reparación de placas</div>
    </div>
    <div>
      <img src="images/ServicioTecnico/Cambio_de_glas.jpg" alt="Cambio de glas">
      <div class="descripcion">Cambio de glas</div>
    </div>
    <div>
      <img src="images/ServicioTecnico/Cambio_de_entrada.jpg" alt="Cambio de entrada">
      <div class="descripcion">Cambio de entrada</div>
    </div>
    <div>
      <img src="images/ServicioTecnico/Cambio_de_batería.jpg" alt="Cambio de batería">
      <div class="descripcion">Cambio de batería</div>
    </div>
  </div>
</div>

<div class="section">
  <h2>Análisis Forense</h2>
  <p style="text-align: center;">Recuperamos fotos, videos y documentos eliminados de celulares y computadoras. Utilizamos herramientas profesionales para garantizar la mejor recuperación posible.</p>
  <div class="gallery">
    <img src="images/Forense/Recuperación_de_información_1.png" alt="Recuperación 1">
    <img src="images/Forense/Recuperación_de_información_2.png" alt="Recuperación 2">
  </div>
</div>

<div class="section">
  <h2>Marcas Disponibles</h2>
  <div class="gallery">
    <img src="images/Logos/Logo_Samsung.jpg" alt="Samsung">
    <img src="images/Logos/Logo_iPhone.jpg" alt="iPhone">
    <img src="images/Logos/Logo_Xiaomi.jpg" alt="Xiaomi">
    <img src="images/Logos/Logo_Honor.jpg" alt="Honor">
  </div>
</div>

</body>
</html>
EOF

echo "[+] HTML actualizado con visual futurista, logos y descripciones."

# Subir a GitHub
git add index.html
git commit -m "Cuarta actualización: logos visibles, mejoras visuales y descripciones"
git push

echo "[+] ¡Actualización completada! Visita: https://deltha-tech.github.io/"
