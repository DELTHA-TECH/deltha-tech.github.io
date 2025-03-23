#!/bin/bash

echo "Corrigiendo rutas duplicadas 'imagenes/imagenes/' en index.html..."

# Copia de seguridad antes de modificar
cp index.html index_backup_antes_de_rutas.html

# Reemplaza las rutas duplicadas
sed -i 's|imagenes/imagenes/|imagenes/|g' index.html

echo "¡Rutas de imágenes corregidas correctamente!"
echo "Puedes abrir https://deltha-tech.github.io para comprobar que ya se muestran bien."
