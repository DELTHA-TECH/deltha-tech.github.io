#!/bin/bash
echo "[+] Iniciando OCTAVA actualización MEGA FUTURISTA de DELTHA-TECH..."

# Paso 1: Respaldar index.html
timestamp=$(date +%s)
cp index.html index_backup_$timestamp.html
echo "[+] Respaldo creado: index_backup_$timestamp.html"

# Paso 2: Corregir nombres de imágenes con espacios
find ./imagenes -depth -name "* *" -execdir bash -c 'mv "$1" "${1// /_}"' bash {} \;

# Paso 3: Crear nuevo index futurista (HTML se genera automáticamente)
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DELTHA-TECH | Tecnología Futurista</title>
  <link rel="stylesheet" href="css/futurista.css">
  <script src="js/animaciones.js" defer></script>
</head>
<body>
  <div class="logo-principal">
    <img src="imagenes/logo_DELTHA-TECH/logo_DELTHA-TECH.png" alt="Logo DELTHA-TECH">
  </div>

  <div class="intro">
    <h1>Bienvenido a DELTHA-TECH</h1>
    <p>Expertos en tecnología móvil, reparación profesional y análisis forense digital. Tu aliado número uno en innovación y seguridad tecnológica.</p>
  </div>

  <div class="sello-agua"></div>

  <!-- Galería de modelos por marca -->
  <section class="galeria">
    <h2>Catálogo de Modelos</h2>

    <!-- Honor -->
    <div class="marca">
      <img src="imagenes/logo_de_marcas/Logo_Honor.jpg" alt="Logo Honor">
      <div class="modelos">
        <img src="imagenes/modelós_de_honor/Magic_7_lite.webp" alt="Magic 7 Lite">
        <img src="imagenes/modelós_de_honor/Play_9A.jpg" alt="Play 9A">
        <img src="imagenes/modelós_de_honor/X_6b.jpg" alt="X 6b">
        <img src="imagenes/modelós_de_honor/X_7b.jpg" alt="X 7b">
        <img src="imagenes/modelós_de_honor/X_8c.png" alt="X 8c">
      </div>
    </div>

    <!-- Samsung -->
    <div class="marca">
      <img src="imagenes/logo_de_marcas/Logo_Samsung.jpg" alt="Logo Samsung">
      <div class="modelos">
        <img src="imagenes/modelós_de_Samsung/A05.png" alt="A05">
        <img src="imagenes/modelós_de_Samsung/A06.jpg" alt="A06">
        <img src="imagenes/modelós_de_Samsung/A16.png" alt="A16">
        <img src="imagenes/modelós_de_Samsung/A25.png" alt="A25">
        <img src="imagenes/modelós_de_Samsung/A35.jpg" alt="A35">
        <img src="imagenes/modelós_de_Samsung/A55.png" alt="A55">
        <img src="imagenes/modelós_de_Samsung/S24_ultra.jpg" alt="S24 Ultra">
      </div>
    </div>

    <!-- Xiaomi -->
    <div class="marca">
      <img src="imagenes/logo_de_marcas/Logo_Xiaomi.jpg" alt="Logo Xiaomi">
      <div class="modelos">
        <img src="imagenes/modelós_de_Xiaomi/13_4g.webp" alt="13 4G">
        <img src="imagenes/modelós_de_Xiaomi/14c.jpg" alt="14c">
        <img src="imagenes/modelós_de_Xiaomi/A3_x.jpg" alt="A3 x">
        <img src="imagenes/modelós_de_Xiaomi/A3.jpg" alt="A3">
        <img src="imagenes/modelós_de_Xiaomi/Note_13_pro_plus.jpg" alt="Note 13 Pro Plus">
        <img src="imagenes/modelós_de_Xiaomi/Note_13.png" alt="Note 13">
        <img src="imagenes/modelós_de_Xiaomi/Note_14.png" alt="Note 14">
      </div>
    </div>

    <!-- iPhone -->
    <div class="marca">
      <img src="imagenes/logo_de_marcas/Logo_iPhone.jpg" alt="Logo iPhone">
      <div class="modelos">
        <img src="imagenes/modelós_de_iPhone/13.webp" alt="iPhone 13">
        <img src="imagenes/modelós_de_iPhone/15_pro_max.png" alt="15 Pro Max">
        <img src="imagenes/modelós_de_iPhone/15.png" alt="15">
        <img src="imagenes/modelós_de_iPhone/16_pro_max.jpg" alt="16 Pro Max">
        <img src="imagenes/modelós_de_iPhone/16.jpg" alt="16">
      </div>
    </div>
  </section>

  <!-- Servicios Técnicos -->
  <section class="servicios">
    <h2>Servicio Técnico Especializado</h2>
    <p>Ofrecemos cambio de pantalla, batería, reparación de placas, flex, entrada de carga, instalación de protectores y más.</p>
    <div class="imagenes-servicios">
      $(find imagenes/servicio_técnico -type f -name '*.jpg' -or -name '*.png' -or -name '*.webp' | sort | sed 's|^|<img src="|;s|$|" alt="Servicio Técnico">|')
    </div>
  </section>

  <!-- Análisis Forense -->
  <section class="forense">
    <h2>Análisis Forense</h2>
    <p>Recuperamos fotos, videos, documentos y realizamos análisis profesionales en celulares y computadoras.</p>
    <div class="imagenes-forense">
      $(find imagenes/análisis_forence -type f -name '*.jpg' -or -name '*.png' -or -name '*.webp' | sort | sed 's|^|<img src="|;s|$|" alt="Análisis Forense">|')
    </div>
  </section>

  <!-- Botón de WhatsApp flotante -->
  <a href="https://wa.me/51910763905" class="whatsapp-float" target="_blank" title="¿Necesitas ayuda? Escríbenos ahora">
    <img src="imagenes/logo_DELTHA-TECH/whatsapp_icon.png" alt="WhatsApp">
  </a>

</body>
</html>
EOF

echo "[+] index.html actualizado con logos, modelos, servicios y efectos futuristas."

# Paso 4: Confirmación
echo "[+] Puedes revisar los cambios en: https://deltha-tech.github.io"
echo "[+] No olvides hacer git add, commit y push para que se actualice en línea."
