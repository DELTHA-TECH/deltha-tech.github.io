#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Corrigiendo rutas de imágenes en index.html..."

# Respaldamos el archivo original
cp index.html index_backup.html

# Reemplazar rutas incorrectas por las correctas
sed -i 's|src="[^"]*\.png\|jpg\|jpeg\|webp"|src="images/\1"|g' index.html

# Escapar espacios y caracteres especiales
sed -i 's/ /%20/g' index.html
sed -i 's/á/a/g; s/é/e/g; s/í/i/g; s/ó/o/g; s/ú/u/g; s/ñ/n/g' index.html

echo "[+] Subiendo cambios a GitHub..."
git add index.html
git commit -m "Corrigiendo rutas de imágenes para visualización en GitHub Pages"
git push

echo "[+] Revisa tu web en: https://deltha-tech.github.io/"
