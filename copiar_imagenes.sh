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
