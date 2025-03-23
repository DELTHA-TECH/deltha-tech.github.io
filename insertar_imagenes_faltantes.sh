#!/bin/bash

echo "Insertando imágenes faltantes automáticamente en index.html..."

# Archivo original y de trabajo
INDEX="index.html"
BACKUP="index_backup_con_imgs_$(date +%s).html"

# Crear backup
cp "$INDEX" "$BACKUP"
echo "Backup creado: $BACKUP"

# Generar HTML de las imágenes
HTML_IMGS=""

for carpeta in imagenes/*/; do
  marca=$(basename "$carpeta" | sed 's/%20/ /g')
  HTML_IMGS+="<h2 class=\"marca-titulo\">$marca</h2><div class=\"galeria\">"
  
  for img in "$carpeta"*; do
    ruta=$(echo "$img" | sed 's/ /%20/g')
    nombre_img=$(basename "$img")
    HTML_IMGS+="<div class=\"item\"><img src=\"$ruta\" alt=\"$nombre_img\"></div>"
  done

  HTML_IMGS+="</div><hr style=\"border: 1px solid #00f0ff44; margin: 40px 0;\">"
done

# Insertar imágenes en el index.html, reemplazando donde diga <!--GALERIA_AUTO-->
sed -i "/<!--GALERIA_AUTO-->/r /dev/stdin" "$INDEX" <<< "$HTML_IMGS"

echo "Imágenes insertadas correctamente."

# Subir cambios
git add "$INDEX"
git commit -m "Insertando imágenes reales automáticamente"
git push origin master

echo "¡Imágenes agregadas e index.html actualizado!"
echo "Verifica en: https://deltha-tech.github.io"
