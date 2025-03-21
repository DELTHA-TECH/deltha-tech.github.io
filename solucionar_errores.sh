#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Verificando e instalando dependencias..."
pkg update -y && pkg upgrade -y
pkg install -y git imagemagick

echo "[+] Comprobando y creando carpetas de imágenes si no existen..."
mkdir -p images/{Samsung,Xiaomi,iPhone,Honor,Forense,ServicioTecnico,Logos}

echo "[+] Corrigiendo rutas de imágenes en index.html..."
sed -i 's|storage/shared/Pictures/Gallery/owner/||g' index.html
sed -i 's|logo DELTHA-TECH|Logos|g' index.html
sed -i 's|logo de marcas|Logos|g' index.html
sed -i 's|modelós de Samsung|Samsung|g' index.html
sed -i 's|modelós de Xiaomi|Xiaomi|g' index.html
sed -i 's|modelós de iPhone|iPhone|g' index.html
sed -i 's|modelós de honor|Honor|g' index.html
sed -i 's|análisis forence|Forense|g' index.html
sed -i 's|servicio técnico|ServicioTecnico|g' index.html

echo "[+] Optimizando imágenes a menos de 300 KB..."
find images -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" | while read img; do
  convert "$img" -resize 1024x1024\> -quality 85 -define jpeg:extent=300KB "$img"
done

echo "[+] Subiendo cambios a GitHub..."
git add .
git commit -m "Corrigiendo rutas de imágenes y solucionando errores de visualización"
git push

echo "[+] Todo listo. Revisa tu sitio en: https://deltha-tech.github.io/"
