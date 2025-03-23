#!/bin/bash

echo "Corrigiendo referencias de imágenes en index.html..."
cd ~/deltha-tech.github.io || exit 1

# 1. Backup
cp index.html index_backup_con_vars.html

# 2. Extraer todas las imágenes y preparar lista
echo "Recolectando rutas de imágenes..."
imagenes=()
while IFS= read -r -d '' archivo; do
  imagenes+=("${archivo#./}")
done < <(find imagenes/ -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -print0)

# 3. Reemplazar cada "$img" en orden por las rutas encontradas
nuevo_index="index.html"
contador=0

for ruta in "${imagenes[@]}"; do
  if grep -q '\$img' "$nuevo_index"; then
    sed -i "0,/\$img/s|\$img|$ruta|" "$nuevo_index"
    ((contador++))
  else
    break
  fi
done

echo "Se reemplazaron $contador referencias de imágenes en index.html"

# 4. Mostrar vista previa de las líneas con <img src= después
grep -i "img src=" index.html

# 5. Confirmar
echo "¡Listo! Tu archivo index.html tiene imágenes reales ahora."
echo "Puedes abrir https://deltha-tech.github.io para ver los cambios."
