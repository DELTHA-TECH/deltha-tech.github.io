#!/bin/bash
echo "Subiendo imágenes reales al repositorio..."

# Agregar todas las imágenes reales (jpg, jpeg, png, webp)
find imagenes/ -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -exec git add {} \;

# Confirmar y subir
git commit -m "Subiendo imágenes reales al sitio"
git push origin master

echo "¡Imágenes subidas correctamente! Ahora recarga https://deltha-tech.github.io"
