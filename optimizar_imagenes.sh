#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[1;36m────────────── DELTHA-TECH Optimizer ──────────────\033[0m"
echo -e "\033[1;37mBuscando imágenes en: \033[1;32massets/images\033[0m"
sleep 1

count=0
saved_kb=0

find assets/images  -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp"  -type f | while read img; do
    original_size=$(du -k "$img" | cut -f1)
    mogrify -resize 1024x1024\> -quality 85 "$img"
    new_size=$(du -k "$img" | cut -f1)

    reduced=$((original_size - new_size))

    if [ $reduced -gt 0 ]; then
        ((count++))
        ((saved_kb+=reduced))
        echo -e "\033[1;35m[$count]\033[0m Optimizado: \033[1;33m$(basename "$img")\033[0m - \033[1;32m↓$reduced KB\033[0m"
    else
        echo -e "\033[1;30m[-]\033[0m Sin cambio: \033[1;37m$(basename "$img")\033[0m"
    fi
    sleep 0.1
done

echo -e "\n\033[1;36m¡Proceso completado!\033[0m"
echo -e "\033[1;32mImágenes optimizadas:\033[1;37m $count"
echo -e "\033[1;32mEspacio ahorrado total:\033[1;37m $saved_kb KB"
echo -e "\033[1;36m────────────────────────────────────────────────────\033[0m"
