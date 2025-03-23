#!/bin/bash
echo "Copiando todas las imágenes faltantes al proyecto..."

# Crear carpetas necesarias
mkdir -p imagenes/Samsung imagenes/Xiaomi imagenes/Honor imagenes/iPhone imagenes/ServicioTecnico imagenes/analisis_forense imagenes/logos

# Samsung
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A05.png" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A06.jpg" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A16.png" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A25.png" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A35.jpg" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A55 .png" imagenes/Samsung/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /S24 ultra.jpg" imagenes/Samsung/

# Xiaomi
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /13 4g.webp" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /14c.jpg" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /A3 x.jpg" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /A3.jpg" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 13 pro plus.jpg" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 13.png" imagenes/Xiaomi/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 14.png" imagenes/Xiaomi/

# Honor
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /Magic 7 Lite.webp" imagenes/Honor/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /Play 9A.jpg" imagenes/Honor/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 6b.jpg" imagenes/Honor/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 7b.jpg" imagenes/Honor/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 8c.png" imagenes/Honor/

# iPhone
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /13.webp" imagenes/iPhone/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /15.png" imagenes/iPhone/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /15 pro max.png" imagenes/iPhone/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /16.jpg" imagenes/iPhone/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /16 pro max.jpg" imagenes/iPhone/

# Logos de marcas
cp -v "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Samsung.jpg" imagenes/logos/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Xiaomi.jpg" imagenes/logos/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Honor.jpg" imagenes/logos/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo iPhone.jpg" imagenes/logos/

# Servicio Técnico
cp -v "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de batería.jpg" imagenes/ServicioTecnico/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de entrada.jpg" imagenes/ServicioTecnico/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de glas.jpg" imagenes/ServicioTecnico/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de pantalla.jpg" imagenes/ServicioTecnico/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Reparación de placas.jpg" imagenes/ServicioTecnico/

# Análisis Forense
cp -v "/storage/emulated/0/Pictures/Gallery/owner/análisis forence /Recuperación de información 1.png" imagenes/analisis_forense/
cp -v "/storage/emulated/0/Pictures/Gallery/owner/análisis forence /Recuperación de información 2.png" imagenes/analisis_forense/

# Optimizar imágenes a menos de 300KB
echo "Optimizando imágenes..."
find imagenes/ -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -exec mogrify -strip -resize 1500x1500\> -quality 80 {} \;

# Subir a GitHub
echo "Subiendo al repositorio..."
git add imagenes/
git commit -m "Subiendo imágenes completas de modelos, logos, servicio técnico y análisis forense"
git push origin master

echo "¡Imágenes subidas correctamente! Verifica en: https://deltha-tech.github.io"
