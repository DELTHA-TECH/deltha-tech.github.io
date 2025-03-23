#!/bin/bash

echo "Corrigiendo errores de imágenes '$img' en index.html..."

cd ~/deltha-tech.github.io || exit 1

# Reemplazos manuales por imagen real desde tus carpetas
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/Samsung/samsung2.jpg" alt="Samsung Galaxy">' index.html
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/Xiaomi/xiaomi2.jpg" alt="Xiaomi Redmi">' index.html
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/iPhone/iphone2.jpg" alt="iPhone 14 Pro">' index.html
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/Honor/honor2.jpg" alt="Honor Magic">' index.html
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/ServicioTecnico/servicio2.jpg" alt="Cambio de batería">' index.html
sed -i '0,/\$img/ s|<img src="\$img"|<img src="imagenes/analisis_forense/Recuperación de información 2.png" alt="Recuperación de documentos">' index.html

echo "Verificando si quedan errores:"
grep "\$img" index.html || echo "¡Todo reemplazado correctamente!"

# Git add, commit y push
git add index.html
git commit -m "Corrigiendo referencias '$img' en imágenes"
git push origin master

echo "¡Listo! Las imágenes ahora deben aparecer correctamente en:"
echo "https://deltha-tech.github.io"
