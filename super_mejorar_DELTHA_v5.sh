#!/bin/bash
echo "¡Transformando DELTHA-TECH en una obra maestra visual futurista!"

# Backup
cp index.html "index_BACKUP_v5_$(date +%s).html"

# Estilo extra
cat << 'CSS' > efectos_v5.css
/* Encabezado glass */
header {
  backdrop-filter: blur(8px);
  background: rgba(0, 0, 0, 0.6);
  border-bottom: 1px solid #0ff;
  box-shadow: 0 0 15px #0ff;
  position: sticky;
  top: 0;
  z-index: 999;
}

/* Hover 3D productos/servicios */
.galeria img, .servicios img {
  transition: transform 0.4s, box-shadow 0.4s;
}
.galeria img:hover, .servicios img:hover {
  transform: rotateY(5deg) scale(1.03);
  box-shadow: 0 0 15px #0ff;
}

/* Íconos SVG animados */
.servicio-icono {
  width: 60px;
  animation: vibrar 1.5s infinite;
}
@keyframes vibrar {
  0% { transform: rotate(0deg); }
  25% { transform: rotate(2deg); }
  50% { transform: rotate(-2deg); }
  75% { transform: rotate(2deg); }
  100% { transform: rotate(0deg); }
}

/* Logo flotante */
#logo-principal {
  animation: flotar 5s ease-in-out infinite;
}
@keyframes flotar {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

/* Parallax */
.parallax {
  background-attachment: fixed;
  background-size: cover;
  background-position: center;
}

/* Animaciones scroll */
[data-scroll] {
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.8s ease;
}
[data-scroll].visible {
  opacity: 1;
  transform: translateY(0);
}

/* WhatsApp botón mejorado */
#btn-wsp {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #25D366;
  padding: 15px;
  border-radius: 50%;
  box-shadow: 0 0 20px #25D366;
  z-index: 9999;
  animation: rebote 2s infinite, parpadeo 3s infinite;
}
@keyframes rebote {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}
@keyframes parpadeo {
  0%, 100% { box-shadow: 0 0 10px #25D366; }
  50% { box-shadow: 0 0 20px #25D366; }
}
#wsp-msg {
  display: none;
  position: fixed;
  bottom: 85px;
  right: 20px;
  background: #fff;
  color: #000;
  padding: 10px 15px;
  border-radius: 10px;
  box-shadow: 0 0 10px #25D366;
}
CSS

# Insertar estilos si no están
grep -q 'efectos_v5.css' index.html || sed -i '/<\/head>/i <link rel="stylesheet" href="efectos_v5.css">' index.html

# Agregar WhatsApp botón + mensaje
sed -i '/<\/body>/i \
<div id="wsp-msg">¿Necesitas ayuda?</div>\
<a id="btn-wsp" href="https://wa.me/51910763905" onmouseover="document.getElementById(\'wsp-msg\').style.display = \'block\'" onmouseout="document.getElementById(\'wsp-msg\').style.display = \'none\'">\
<svg xmlns="http://www.w3.org/2000/svg" fill="#fff" height="24" width="24" viewBox="0 0 24 24"><path d="M12 .1A11.9 11.9 0 0 0 0 12c0 2 .5 3.9 1.6 5.6L0 24l6.5-1.6A11.8 11.8 0 0 0 12 24a12 12 0 0 0 0-23.9zm0 21.8a9.9 9.9 0 0 1-5.1-1.4l-.4-.2-3.9 1 .9-3.8-.3-.4A9.8 9.8 0 0 1 2 12c0-5.5 4.5-10 10-10s10 4.5 10 10a9.9 9.9 0 0 1-10 10zm5.6-7.3c-.3-.2-1.7-.9-2-1s-.5-.2-.7.2-.8 1-1 1.2-.4.2-.7 0c-.3-.1-1.3-.5-2.5-1.6-.9-.8-1.6-1.8-1.8-2.1-.2-.4 0-.6.2-.8l.5-.6c.2-.2.3-.4.5-.7s.1-.5 0-.7c-.1-.2-.7-1.7-1-2.4s-.5-.6-.7-.6h-.6c-.2 0-.5.1-.7.3s-1 1-1 2.4 1 2.8 1.1 3c.1.2 2.1 3.3 5.1 4.5 1 .4 1.8.6 2.4.8.8.2 1.5.2 2 .1.6-.1 1.7-.7 2-1.3.3-.5.3-1.2.2-1.3z"/></svg>\
</a>' index.html

# Script de scroll reveal
cat << 'JS' > scroll_anim.js
window.addEventListener("scroll", () => {
  document.querySelectorAll("[data-scroll]").forEach(el => {
    const rect = el.getBoundingClientRect();
    if (rect.top < window.innerHeight - 100) {
      el.classList.add("visible");
    }
  });
});
JS

# Insertar script scroll
grep -q 'scroll_anim.js' index.html || sed -i '/<\/body>/i <script src="scroll_anim.js"></script>' index.html

# Agregar data-scroll a secciones clave
sed -i 's/<section /<section data-scroll /g' index.html

# Confirmar y subir
git add index.html efectos_v5.css scroll_anim.js
git commit -m "DELTHA-TECH v5: efectos 3D, glass, WhatsApp animado, parallax, animaciones"
git push origin master

echo "¡DELTHA-TECH V5 desplegado! Revisa: https://deltha-tech.github.io"
