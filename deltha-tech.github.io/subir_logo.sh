#!/data/data/com.termux/files/usr/bin/bash

# ========== CONFIGURACIÓN ==========
LOGO_ORIGEN="/storage/emulated/0/Pictures/Gallery/owner/logo DELTHA-TECH/DELTHA-TECH logo.jpg"
LOGO_NOMBRE="logo.jpg"
DESTINO="DELTHA-TECH/img"
HTML="DELTHA-TECH/index.html"
MENSAJE="Subida automática del logo DELTHA-TECH"

echo "========== SUBIDA AUTOMÁTICA DEL LOGO =========="

# 1. Verificar logo original
if [ ! -f "$LOGO_ORIGEN" ]; then
    echo "ERROR: No se encontró el logo en:"
    echo "$LOGO_ORIGEN"
    exit 1
fi

# 2. Crear carpeta destino
mkdir -p "$DESTINO"

# 3. Copiar el logo
cp -v "$LOGO_ORIGEN" "$DESTINO/$LOGO_NOMBRE" || { echo "ERROR al copiar el logo."; exit 1; }

# 4. Insertar en HTML si no está
if ! grep -q "$LOGO_NOMBRE" "$HTML"; then
    sed -i "/<body>/a <div style=\"text-align:center;margin:20px;\"><img src=\"img/$LOGO_NOMBRE\" alt=\"Logo DELTHA-TECH\" style=\"width:180px; max-width:90%;\"></div>" "$HTML"
    echo "Logo insertado en $HTML"
else
    echo "El logo ya estaba insertado en el HTML."
fi

# 5. Subir a GitHub
git add .
git commit -m "$MENSAJE"
git push

echo "========== PROCESO COMPLETADO =========="

