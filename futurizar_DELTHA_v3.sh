#!/data/data/com.termux/files/usr/bin/bash

echo "Iniciando FUTURIZACIÓN de DELTHA-TECH..."
sleep 1

# Backup del index actual
cp index.html index_backup_futurizado_$(date +%s).html
echo "Backup creado."

# Corrección de rutas duplicadas de imágenes
echo "Corrigiendo rutas tipo imagenes/imagenes/..."
sed -i 's/imagenes\/imagenes\//imagenes\//g' index.html

# Añadir estilos futuristas, animaciones, glass menu, fondo, botón WhatsApp y más
echo "Aplicando estilo futurista al sitio..."

cat > estilo_futurista.css << 'EOF'
body {
  margin: 0;
  background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
  font-family: 'Segoe UI', sans-serif;
  color: #ffffff;
  scroll-behavior: smooth;
}

header {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(10px);
  padding: 20px;
  text-align: center;
  border-bottom: 1px solid #00ffe5;
  box-shadow: 0 0 10px #00ffe5;
}

h1, h2 {
  text-shadow: 0 0 5px #00fff0;
}

nav {
  display: flex;
  justify-content: center;
  gap: 20px;
  background: rgba(0,0,0,0.2);
  padding: 10px;
  position: sticky;
  top: 0;
  z-index: 999;
}

nav a {
  color: #00ffe5;
  text-decoration: none;
  font-weight: bold;
  transition: 0.3s;
}

nav a:hover {
  color: #ffffff;
  text-shadow: 0 0 10px #00ffe5;
}

.galeria {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: center;
  padding: 20px;
}

.galeria img {
  max-width: 200px;
  border-radius: 10px;
  transition: transform 0.3s, box-shadow 0.3s;
}

.galeria img:hover {
  transform: scale(1.05);
  box-shadow: 0 0 10px #00fff0;
}

section {
  padding: 40px 20px;
  border-bottom: 1px solid #00ffe5;
}

#whatsapp-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background-color: #00e676;
  color: white;
  padding: 15px;
  border-radius: 50%;
  font-size: 24px;
  box-shadow: 0 0 20px #00ffcc;
  z-index: 1000;
  animation: bounce 2s infinite;
  transition: 0.3s;
}

#whatsapp-button:hover::after {
  content: "¿Necesitas ayuda?";
  position: absolute;
  right: 60px;
  background: #00ffe5;
  color: #000;
  padding: 5px 10px;
  border-radius: 8px;
  font-size: 14px;
}

@keyframes bounce {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-5px); }
}
EOF

# Insertamos el link a la hoja de estilo
sed -i '/<head>/a <link rel="stylesheet" href="estilo_futurista.css">' index.html

# Botón de WhatsApp flotante
sed -i '/<\/body>/i \
<a id="whatsapp-button" href="https://wa.me/51910763905" target="_blank">W</a>' index.html

echo "Estilo futurista aplicado correctamente."

# Git commit y push
echo "Subiendo cambios a GitHub..."
git add index.html estilo_futurista.css
git commit -m "Actualización futurista: estilo visual + corrección de rutas"
git push origin master

echo "¡Sitio DELTHA-TECH futurizado con éxito!"
echo "Verifica en: https://deltha-tech.github.io/"
