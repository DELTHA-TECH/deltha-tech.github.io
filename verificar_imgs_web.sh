#!/bin/bash
echo "Verificando imágenes en línea desde https://deltha-tech.github.io/ ..."
echo "----------------------------------------"

# Extraer rutas de imagen del index.html
grep -oP 'src="imagenes/[^"]+' index.html | sed 's/src="//' | sort | uniq > rutas_imgs_temp.txt

total=$(wc -l < rutas_imgs_temp.txt)
contador=1

while read -r ruta; do
    url="https://deltha-tech.github.io/$ruta"
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    if [ "$status" == "200" ]; then
        echo "[$contador/$total] ✅ OK: $ruta"
    else
        echo "[$contador/$total] ❌ No encontrada (Error $status): $ruta"
    fi

    contador=$((contador+1))
done < rutas_imgs_temp.txt

rm rutas_imgs_temp.txt
echo "----------------------------------------"
echo "Verificación finalizada."
