#!/bin/bash

echo "==> Copiando imágenes desde galería..."

base_src="/storage/emulated/0/Pictures/Gallery/owner"
base_dest="$HOME/deltha-tech.github.io/imagenes"

# Crear carpetas destino
mkdir -p "$base_dest/Samsung" "$base_dest/Xiaomi" "$base_dest/Honor" "$base_dest/iPhone" "$base_dest/ServicioTecnico" "$base_dest/Forense" "$base_dest/Logos"

# LOGOS
cp "$base_src/logo de marcas /Logo Samsung.jpg" "$base_dest/Logos/"
cp "$base_src/logo de marcas /Logo Xiaomi.jpg" "$base_dest/Logos/"
cp "$base_src/logo de marcas /Logo Honor.jpg" "$base_dest/Logos/"
cp "$base_src/logo de marcas /Logo iPhone.jpg" "$base_dest/Logos/"

# Samsung
cp "$base_src/modelós de Samsung "/*.jpg "$base_dest/Samsung/" 2>/dev/null
cp "$base_src/modelós de Samsung "/*.png "$base_dest/Samsung/" 2>/dev/null

# Xiaomi
cp "$base_src/modelós de Xiaomi "/* "$base_dest/Xiaomi/" 2>/dev/null

# Honor
cp "$base_src/modelós de honor "/* "$base_dest/Honor/" 2>/dev/null

# iPhone
cp "$base_src/modelós de iPhone "/* "$base_dest/iPhone/" 2>/dev/null

# Servicio Técnico
cp "$base_src/servicio técnico "/* "$base_dest/ServicioTecnico/" 2>/dev/null

# Forense
cp "$base_src/análisis forence "/* "$base_dest/Forense/" 2>/dev/null

echo "==> Archivos copiados."

# Ejecutar optimización y limpieza
bash optimizar_y_limpiar_imgs.sh

# Subir todo a GitHub
bash subir_todo.sh

echo "==> Sitio DELTHA-TECH actualizado completamente con nuevas imágenes, optimización y publicación."
