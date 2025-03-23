#!/data/data/com.termux/files/usr/bin/bash

echo "Iniciando proceso de copia, renombrado, optimización y subida de imágenes..."

# Crear rutas destino
mkdir -p imagenes/{Samsung,Xiaomi,Honor,iPhone,ServicioTecnico,analisis_forense,Logos}

# Función para copiar, renombrar, optimizar y mover una imagen
procesar_imagen() {
  origen="$1"
  categoria="$2"
  nuevo_nombre="$3"

  destino="imagenes/$categoria/$nuevo_nombre"
  # Optimizar imagen (convertir si es > 300KB)
  size_kb=$(du -k "$origen" | cut -f1)
  if [ "$size_kb" -gt 300 ]; then
    echo "Optimizando $nuevo_nombre ($size_kb KB)..."
    convert "$origen" -resize 1024x1024 -quality 80 "$destino"
  else
    cp "$origen" "$destino"
  fi
  echo "✅ Copiada: $destino"
}

# Samsung
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A05.png" Samsung samsung1.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A06.jpg" Samsung samsung2.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A16.png" Samsung samsung3.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A25.png" Samsung samsung4.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A35.jpg" Samsung samsung5.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /A55 .png" Samsung samsung6.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Samsung /S24 ultra.jpg" Samsung samsung7.jpg

# Xiaomi
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /13 4g.webp" Xiaomi xiaomi1.webp
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /14c.jpg" Xiaomi xiaomi2.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /A3 x.jpg" Xiaomi xiaomi3.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /A3.jpg" Xiaomi xiaomi4.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 13 pro plus.jpg" Xiaomi xiaomi5.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 13.png" Xiaomi xiaomi6.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de Xiaomi /Note 14.png" Xiaomi xiaomi7.png

# Honor
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /Magic 7 Lite.webp" Honor honor1.webp
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /Play 9A.jpg" Honor honor2.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 6b.jpg" Honor honor3.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 7b.jpg" Honor honor4.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de honor /X 8c.png" Honor honor5.png

# iPhone
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /13.webp" iPhone iphone1.webp
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /15 pro max.png" iPhone iphone2.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /15.png" iPhone iphone3.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /16 pro max.jpg" iPhone iphone4.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/modelós de iPhone /16.jpg" iPhone iphone5.jpg

# Servicio Técnico
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de batería.jpg" ServicioTecnico servicio1.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de entrada.jpg" ServicioTecnico servicio2.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de glas.jpg" ServicioTecnico servicio3.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Cambio de pantalla.jpg" ServicioTecnico servicio4.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/servicio técnico /Reparación de placas.jpg" ServicioTecnico servicio5.jpg

# Análisis Forense
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/análisis forence /Recuperación de información 1.png" analisis_forense forense1.png
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/análisis forence /Recuperación de información 2.png" analisis_forense forense2.png

# Logos
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Samsung.jpg" Logos logo_samsung.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Xiaomi.jpg" Logos logo_xiaomi.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo Honor.jpg" Logos logo_honor.jpg
procesar_imagen "/storage/emulated/0/Pictures/Gallery/owner/logo de marcas /Logo iPhone.jpg" Logos logo_iphone.jpg

echo "Añadiendo cambios al repositorio Git..."
git add imagenes/
git commit -m "Subida automática de imágenes optimizadas para la web"
git push

echo "Proceso completo. Revisa tu sitio en https://deltha-tech.github.io"
