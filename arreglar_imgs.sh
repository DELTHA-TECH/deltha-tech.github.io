#!/bin/bash

echo "Corrigiendo visualización de imágenes en tu sitio DELTHA-TECH..."

# 1. Nos aseguramos de estar en el proyecto correcto
cd ~/deltha-tech.github.io || exit

# 2. Mostrar estado actual
echo "Verificando imágenes..."
ls imagenes/

# 3. Añadir todas las imágenes nuevas y existentes
echo "Agregando imágenes al repositorio..."
git add imagenes/*

# 4. Mensaje de confirmación
echo "Listo para hacer commit..."

# 5. Commit sin modificar archivos HTML
git commit -m "Subiendo imágenes necesarias para visualización correcta"

# 6. Subida al repositorio
git push origin master

echo "¡Imágenes subidas correctamente!"
echo "Revisa en unos segundos tu web: https://deltha-tech.github.io/"
