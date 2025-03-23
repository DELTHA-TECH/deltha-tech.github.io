#!/bin/bash

echo "Iniciando verificación de imágenes en index.html..."

# Ruta al archivo index.html
INDEX_FILE="index.html"

# Directorio base de las imágenes
IMG_DIR="imagenes"

# Expresión regular para encontrar todas las referencias a imágenes en index.html
IMG_REFS=$(grep -oP '(?<=<img src=")[^"]*' "$INDEX_FILE")

# Contador de errores
ERROR_COUNT=0

# Función para convertir a minúsculas
to_lowercase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# Recorrer cada referencia de imagen encontrada
while IFS= read -r IMG_REF; do
    # Ruta completa de la imagen
    FULL_PATH="$IMG_DIR/$IMG_REF"
    
    # Verificar si el archivo existe
    if [[ ! -f "$FULL_PATH" ]]; then
        # Si no existe, intentar encontrar una coincidencia sin distinguir mayúsculas y minúsculas
        LOWER_REF=$(to_lowercase "$FULL_PATH")
        MATCH=$(find "$IMG_DIR" -type f -iname "$(basename "$LOWER_REF")")
        
        if [[ -z "$MATCH" ]]; then
            echo "❌ No se encontró la imagen referenciada: $FULL_PATH"
            ((ERROR_COUNT++))
        else
            echo "⚠️  Discrepancia encontrada: '$FULL_PATH' debería ser '$MATCH'"
            ((ERROR_COUNT++))
        fi
    else
        echo "✅ Imagen encontrada: $FULL_PATH"
    fi
done <<< "$IMG_REFS"

# Resumen de la verificación
if [[ $ERROR_COUNT -eq 0 ]]; then
    echo "🎉 Todas las imágenes se están mostrando correctamente."
else
    echo "⚠️  Se encontraron $ERROR_COUNT problemas con las imágenes. Por favor, corrígelos para asegurar que todas las imágenes se muestren correctamente en tu sitio."
fi
