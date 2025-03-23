#!/bin/bash
echo "Optimizando imágenes mayores a 300KB y eliminando duplicadas..."
echo

# Requiere: imagemagick y optipng
pkg install -y imagemagick optipng

# Función para comprimir JPG
optimizar_jpg() {
  mogrify -quality 85 "$1"
}

# Función para comprimir PNG
optimizar_png() {
  optipng -o2 "$1" > /dev/null
}

# Contadores
total=0
optimizadas=0
duplicadas=0

# Buscar imágenes mayores a 300KB
find . -iname "*.jpg" -o -iname "*.png" -type f | while read img; do
  peso=$(du -k "$img" | cut -f1)
  if [ "$peso" -gt 300 ]; then
    total=$((total + 1))
    echo "OPTIMIZANDO: $img ($peso KB)"
    if [[ "$img" == *.jpg ]]; then
      optimizar_jpg "$img"
    elif [[ "$img" == *.png ]]; then
      optimizar_png "$img"
    fi
    optimizadas=$((optimizadas + 1))
  fi
done

# Buscar duplicados exactos (por nombre y peso) entre imágenes/ y images/
echo
echo "Buscando imágenes duplicadas en 'imagenes/' y 'images/'..."
for file in $(find ./imagenes/ -type f -iname "*.jpg" -o -iname "*.png"); do
  base=$(basename "$file")
  size1=$(stat -c%s "$file")
  match=$(find ./images/ -type f -name "$base")

  for m in $match; do
    size2=$(stat -c%s "$m")
    if [ "$size1" = "$size2" ]; then
      echo "DUPLICADO: $m (igual que $file) - Eliminando"
      rm "$m"
      duplicadas=$((duplicadas + 1))
    fi
  done
done

# Resumen final
echo
echo "Resumen:"
echo "---------------------------------"
echo "Total imágenes >300KB encontradas: $total"
echo "Imágenes optimizadas: $optimizadas"
echo "Imágenes duplicadas eliminadas: $duplicadas"
echo "---------------------------------"
echo "Proceso completado."

exit 0
#!/bin/bash

echo "Iniciando optimización de imágenes y limpieza de duplicados..."

# Buscar imágenes JPG y PNG
find . -type f -iname "*.jpg" -o -iname "*.png" | while read file; do
  size_kb=$(du -k "$file" | cut -f1)
  if [ "$size_kb" -gt 300 ]; then
    echo "OPTIMIZANDO: $file (${size_kb}KB)"
    ext="${file##*.}"
    lowercase_ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
    if [[ "$lowercase_ext" == "jpg" || "$lowercase_ext" == "jpeg" ]]; then
      convert "$file" -strip -interlace Plane -sampling-factor 4:2:0 -quality 70 "$file"
    elif [[ "$lowercase_ext" == "png" ]]; then
      optipng -o7 -quiet "$file"
    fi
  fi
done

# Eliminar imágenes duplicadas por nombre y tamaño
echo "Buscando y eliminando duplicados..."
find . -type f -iname "*.jpg" -o -iname "*.png" -exec md5sum {} + | sort | uniq -w32 -dD | awk '{print $2}' | sort | uniq | tail -n +2 | while read duplicate; do
  echo "Eliminando duplicado: $duplicate"
  rm "$duplicate"
done

echo "Optimización y limpieza completadas."
