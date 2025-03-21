#!/data/data/com.termux/files/usr/bin/bash

# Script para comprimir imágenes a menos de 300 KB usando magick
optimizar() {
  origen="$1"
  destino="$2"
  mkdir -p "$destino"
  for img in "$origen"/*.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
    [ -f "$img" ] || continue
    nombre=$(basename "$img")
    magick "$img" -resize 1080x1080 -strip -quality 75 -define jpeg:extent=299KB "$destino/$nombre"
  done
}

# Base del proyecto
PROYECTO=~/DELTHA-TECH/deltha-tech.github.io/imagenes

# Optimizar logos
optimizar "/storage/emulated/0/Pictures/Gallery/owner/logo DELTHA-TECH" "$PROYECTO"
optimizar "/storage/emulated/0/Pictures/Gallery/owner/galería de fotos" "$PROYECTO"

# Samsung
optimizar "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung" "$PROYECTO/Samsung"

# Xiaomi
optimizar "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi" "$PROYECTO/Xiaomi"

# Honor
optimizar "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor" "$PROYECTO/Honor"

# iPhone
optimizar "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone" "$PROYECTO/iPhone"

# Análisis forense
optimizar "/storage/emulated/0/Pictures/Gallery/owner/análisis forence" "$PROYECTO/forense"

# Servicio técnico
optimizar "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico" "$PROYECTO/tecnico"

echo "¡Imágenes optimizadas y organizadas exitosamente!"
