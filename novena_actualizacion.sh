#!/bin/bash

# Script: novena_actualizacion.sh
# Descripción: Reorganiza imágenes por marca, corrige rutas y optimiza el diseño del sitio web.

echo "[+] Iniciando novena actualización: optimización y corrección de diseño..."

# 1. Crear directorios para cada marca si no existen
declare -a marcas=("Honor" "Samsung" "Xiaomi" "iPhone")
for marca in "${marcas[@]}"; do
    if [ ! -d "./imagenes/$marca" ]; then
        mkdir -p "./imagenes/$marca"
        echo "[+] Directorio creado para la marca: $marca"
    fi
done

# 2. Mover imágenes a sus respectivos directorios
declare -A imagenes_por_marca=(
    ["Honor"]="Magic_7_lite.webp Play_9A.jpg X_6b.jpg X_7b.jpg X_8c.png"
    ["Samsung"]="A05.png A06.jpg A16.png A25.png A35.jpg A55.png S24_ultra.jpg"
    ["Xiaomi"]="13_4g.webp 14c.jpg A3_x.jpg A3.jpg Note_13_pro_plus.jpg Note_13.png Note_14.png"
    ["iPhone"]="13.webp 15_pro_max.png 15.png 16_pro_max.jpg 16.jpg"
)

for marca in "${!imagenes_por_marca[@]}"; do
    for imagen in ${imagenes_por_marca[$marca]}; do
        if [ -f "./imagenes/$imagen" ]; then
            mv "./imagenes/$imagen" "./imagenes/$marca/"
            echo "[+] Imagen $imagen movida a ./imagenes/$marca/"
        else
            echo "[!] Imagen $imagen no encontrada en el directorio ./imagenes/"
        fi
    done
done

# 3. Actualizar el archivo index.html con las nuevas rutas y diseño
if [ -f "index.html" ]; then
    cp index.html "index_backup_$(date +%s).html"
    echo "[+] Respaldo de index.html creado."

    # Generar nuevo contenido para index.html
    cat <<EOL > index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELTHA-TECH | Tecnología Futurista</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <header>
        <img src="imagenes/logo.png" alt="Logo DELTHA-TECH" class="logo-principal">
        <h1>Bienvenido a DELTHA-TECH</h1>
        <p>Expertos en tecnología móvil, reparación profesional y análisis forense digital. Tu aliado número uno en innovación y seguridad tecnológica.</p>
    </header>
    <main>
        <section id="catalogo">
            <h2>Catálogo de Modelos</h2>
EOL

    for marca in "${marcas[@]}"; do
        cat <<EOL >> index.html
            <div class="marca">
                <h3>$marca</h3>
                <div class="modelos">
EOL
        for imagen in ${imagenes_por_marca[$marca]}; do
            nombre_modelo=$(echo $imagen | sed -E 's/[_\.].*//g')
            cat <<EOL >> index.html
                    <div class="modelo">
                        <img src="imagenes/$marca/$imagen" alt="$nombre_modelo">
                        <p>$nombre_modelo</p>
                    </div>
EOL
        done
        cat <<EOL >> index.html
                </div>
            </div>
EOL
    done

    cat <<EOL >> index.html
        </section>
        <section id="servicio-tecnico">
            <h2>Servicio Técnico Especializado</h2>
            <p>Ofrecemos cambio de pantalla, batería, reparación de placas, flex, entrada de carga, instalación de protectores y más.</p>
        </section>
        <section id="analisis-forense">
            <h2>Análisis Forense</h2>
            <p>Recuperamos fotos, videos, documentos y realizamos análisis profesionales en celulares y computadoras.</p>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 DELTHA-TECH. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
EOL

    echo "[+] Archivo index.html actualizado con nuevo diseño y rutas de imágenes."
else
    echo "[!] Archivo index.html no encontrado. Abortando actualización."
    exit 1
fi

echo "[+] Novena actualización completada exitosamente."
