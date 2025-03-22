#!/bin/bash

# Crear carpetas destino si no existen
mkdir -p images/Samsung
mkdir -p images/Xiaomi
mkdir -p images/iPhone
mkdir -p images/Honor
mkdir -p images/Forense
mkdir -p images/ServicioTecnico
mkdir -p images/Logos

# Copiar imágenes desde el almacenamiento interno
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de Samsung '/. images/Samsung/
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de Xiaomi '/. images/Xiaomi/
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de iPhone '/. images/iPhone/
cp -r ~/storage/shared/Pictures/Gallery/owner/'modelós de honor '/. images/Honor/
cp -r ~/storage/shared/Pictures/Gallery/owner/'análisis forence '/. images/Forense/
cp -r ~/storage/shared/Pictures/Gallery/owner/'servicio técnico '/. images/ServicioTecnico/
cp -r ~/storage/shared/Pictures/Gallery/owner/'logo DELTHA-TECH'/. images/Logos/
cp -r ~/storage/shared/Pictures/Gallery/owner/'logo de marcas '/. images/Logos/

echo "¡Imágenes copiadas con éxito!"
#!/bin/bash

echo "[+] Iniciando copia automática de imágenes desde la galería..."

# Directorios origen en tu almacenamiento interno
ORIGEN=~/storage/shared/Pictures/Gallery/owner

# Directorios destino en el proyecto
DESTINO=./imagenes

# Función para copiar imágenes
copiar_imagenes() {
    carpeta_origen="$1"
    carpeta_destino="$2"

    mkdir -p "$DESTINO/$carpeta_destino"

    if cp -u "$ORIGEN/$carpeta_origen/"* "$DESTINO/$carpeta_destino/"; then
        echo "[+] Imágenes copiadas de '$carpeta_origen' a '$carpeta_destino'"
    else
        echo "[!] Error al copiar imágenes desde '$carpeta_origen'"
    fi
}

# Copiando modelos por marca
copiar_imagenes "modelós de iPhone" "iPhone"
copiar_imagenes "modelós de Xiaomi" "Xiaomi"
copiar_imagenes "modelós de honor" "Honor"
copiar_imagenes "modelós de Samsung" "Samsung"

# Copiando logos
copiar_imagenes "logo de marcas" "logos_marcas"
copiar_imagenes "logo DELTHA-TECH" "logos_empresa"

# Copiando servicio técnico y análisis forense
copiar_imagenes "servicio técnico" "servicio_tecnico"
copiar_imagenes "análisis forence " "analisis_forense"

echo "[✓] Copia completada. Verifica las imágenes en la carpeta ./imagenes/"
#!/bin/bash
echo "¡Imágenes copiadas con éxito!"
echo "[+] Iniciando copia automática de imágenes desde la galería..."

# Rutas corregidas con espacios y tildes
declare -A carpetas=(
    ["iPhone"]="modelós de iPhone "
    ["Xiaomi"]="modelós de Xiaomi "
    ["Honor"]="modelós de honor "
    ["Samsung"]="modelós de Samsung "
    ["Logos"]="logo de marcas "
    ["logos_empresa"]="logo DELTHA-TECH"
    ["ServicioTecnico"]="servicio técnico "
    ["analisis_forense"]="análisis forence "
)

# Crear carpetas destino
mkdir -p imagenes/{iPhone,Xiaomi,Honor,Samsung,Logos,logos_empresa,ServicioTecnico,analisis_forense}

# Copiar imágenes
for destino in "${!carpetas[@]}"; do
    origen="/data/data/com.termux/files/home/storage/shared/Pictures/Gallery/owner/${carpetas[$destino]}"
    if [ -d "$origen" ]; then
        cp "$origen"* "imagenes/$destino/"
        echo "[+] Imágenes copiadas de '${carpetas[$destino]}' a '$destino'"
    else
        echo "[!] Error al copiar imágenes desde '${carpetas[$destino]}'"
    fi
done

echo "[✓] Copia completada. Verifica las imágenes en la carpeta ./imagenes/"
