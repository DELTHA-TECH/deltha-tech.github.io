#!/bin/bash
echo "[+] Iniciando corrección de rutas de imágenes..."

# Backup
cp index.html index_backup_$(date +%s).html
echo "[+] Respaldo de index.html creado."

# Corrige rutas de imágenes con sed
sed -i 's|src="images/Logos |src="images/Logos/|g' index.html
sed -i 's|src="images/ServicioTecnico |src="images/ServicioTecnico/|g' index.html
sed -i 's|src="images/Forense |src="images/Forense/|g' index.html
sed -i 's|src="images/Samsung |src="images/Samsung/|g' index.html
sed -i 's|src="images/Honor |src="images/Honor/|g' index.html
sed -i 's|src="images/Xiaomi |src="images/Xiaomi/|g' index.html
sed -i 's|src="images/iPhone |src="images/iPhone/|g' index.html

# Elimina espacios extra si los hubiera en rutas
find images -depth -name "* *" -exec rename 's/ /_/g' {} +
sed -i 's/ /_/g' index.html

# Agrega alt y title genéricos si faltan (sólo ejemplo simple)
sed -i 's/<img .*>/<img \1 alt="Imagen de producto" title="DELTHA-TECH">/g' index.html

echo "[+] Rutas de imágenes corregidas y nombres con espacios reparados."

# Subir cambios a GitHub
echo "[+] Subiendo corrección a GitHub..."
git add .
git commit -m "Corrección de rutas de imágenes y nombres"
git push

echo "[+] ¡Corrección completada! Revisa tu sitio: https://deltha-tech.github.io/"
