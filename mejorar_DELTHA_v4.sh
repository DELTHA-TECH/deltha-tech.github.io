#!/bin/bash
echo "Mejorando DELTHA-TECH al nivel 4... ¡Modo pro activado!"

# Backup previo
cp index.html "index_backup_v3_$(date +%s).html"

# Añadir sección de introducción y contacto + botón de idioma
sed -i '/<\/header>/a \
<section class="intro">\
  <h2>Bienvenidos a DELTHA-TECH</h2>\
  <p>Expertos en celulares Samsung, iPhone, Xiaomi y Honor. Servicios técnicos, análisis forense y recuperación de datos rápidos y seguros.</p>\
</section>' index.html

sed -i '/<\/body>/i \
<section class="contacto">\
  <h2>Contáctanos</h2>\
  <p><strong>WhatsApp:</strong> <a href="https://wa.me/51910763905">910 763 905</a> / <a href="https://wa.me/51987180885">987 180 885</a></p>\
  <p><strong>Email:</strong> contacto@deltha-tech.com</p>\
  <p><strong>Ubicación:</strong> Av. Tecnología 123, Lima, Perú</p>\
  <iframe src="https://maps.google.com/maps?q=lima&t=&z=13&ie=UTF8&iwloc=&output=embed" width="100%" height="200" style="border:0;"></iframe>\
</section>\
<button id="btn-idioma" onclick="cambiarIdioma()">EN / ES</button>' index.html

# Crear CSS extra para introducción y contacto
cat << 'CSS' > mejoras_v4.css
.intro, .contacto {
  padding: 40px 20px;
  text-align: center;
  background: rgba(255,255,255,0.05);
  border-radius: 10px;
  margin: 20px;
  color: #fff;
  backdrop-filter: blur(5px);
}
#btn-idioma {
  position: fixed;
  bottom: 90px;
  right: 20px;
  padding: 10px 15px;
  background: #00f0ff;
  color: #000;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  box-shadow: 0 0 10px #00f0ff;
  z-index: 999;
}
#btn-idioma:hover {
  background: #fff;
  color: #000;
}
CSS

# Incluir mejoras_v4.css en index.html si no está
grep -q 'mejoras_v4.css' index.html || sed -i '/<\/head>/i <link rel="stylesheet" href="mejoras_v4.css">' index.html

# Script de idioma
cat << 'JS' > traducir.js
function cambiarIdioma() {
  const textos = document.querySelectorAll('[data-es], [data-en]');
  textos.forEach(el => {
    if (el.innerText === el.getAttribute("data-es")) {
      el.innerText = el.getAttribute("data-en");
    } else {
      el.innerText = el.getAttribute("data-es");
    }
  });
}
JS

# Insertar atributos data-es/data-en en los textos clave
sed -i 's/Bienvenidos a DELTHA-TECH/<span data-es="Bienvenidos a DELTHA-TECH" data-en="Welcome to DELTHA-TECH">Bienvenidos a DELTHA-TECH<\/span>/' index.html
sed -i 's/Contáctanos/<span data-es="Contáctanos" data-en="Contact us">Contáctanos<\/span>/' index.html
sed -i '/<\/body>/i <script src="traducir.js"><\/script>' index.html

# Confirmar y subir cambios
git add index.html mejoras_v4.css traducir.js
git commit -m "Mejoras v4: introducción, contacto, botón ES/EN, animaciones"
git push origin master

echo "¡Sitio DELTHA-TECH actualizado al nivel 4! Revisa: https://deltha-tech.github.io"
