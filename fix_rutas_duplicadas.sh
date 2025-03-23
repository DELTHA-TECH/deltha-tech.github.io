#!/bin/bash

echo "Verificando rutas duplicadas en index.html..."

# Contar cuántas rutas incorrectas hay
errores=$(grep -c 'src="imagenes/imagenes/' index.html)

if [ "$errores" -gt 0 ]; then
    echo "Se encontraron $errores rutas duplicadas. Corrigiendo..."
    sed -i 's|src="imagenes/imagenes/|src="imagenes/|g' index.html

    echo "Guardando cambios..."
    git add index.html
    git commit -m "Fix: rutas duplicadas de imágenes corregidas automáticamente"
    git push origin master

    echo "¡Listo! Las rutas duplicadas han sido corregidas y subidas a GitHub."
    echo "Revisa en unos segundos tu sitio: https://deltha-tech.github.io/"
else
    echo "No se encontraron rutas duplicadas. Todo está en orden."
fi
