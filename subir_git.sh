#!/bin/bash
echo "[+] Añadiendo todos los cambios al repositorio..."
git add .

echo "[+] Creando commit con mensaje personalizado..."
git commit -m "Décima actualización: imágenes desde galería organizadas por marca y servicio técnico"

echo "[+] Subiendo al repositorio GitHub..."
git push

echo "[✓] ¡Actualización subida correctamente a GitHub!"
