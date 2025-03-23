#!/bin/bash
echo "Agregando introducción futurista animada a DELTHA-TECH..."

# Backup por seguridad
cp index.html index_backup_intro_$(date +%s).html

# Insertar HTML de intro antes del <body>
sed -i '/<body>/a\
<div id="intro-container">\
  <div class="glitch-text">\
    <span class="typed-text">Bienvenido a DELTHA-TECH</span>\
  </div>\
</div>' index.html

# Insertar CSS al final del archivo antes de </head>
sed -i '/<\/head>/i\
<link rel="stylesheet" href="intro_futurista.css">' index.html

# Insertar JS de typing y ocultar intro
sed -i '/<\/body>/i\
<script src="intro_futurista.js"></script>' index.html

# Crear archivo CSS
cat << 'EOCSS' > intro_futurista.css
#intro-container {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: black;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  animation: fadeOut 5s ease-in-out 4s forwards;
}

.glitch-text {
  color: #0ff;
  font-size: 2em;
  font-family: 'Courier New', monospace;
  text-shadow: 0 0 5px #0ff, 0 0 10px #0ff, 0 0 20px #00f;
  animation: glitch 0.5s infinite;
}

@keyframes glitch {
  0% { transform: translate(0); }
  20% { transform: translate(-2px, 1px); }
  40% { transform: translate(2px, -1px); }
  60% { transform: translate(-1px, 2px); }
  80% { transform: translate(1px, -2px); }
  100% { transform: translate(0); }
}

@keyframes fadeOut {
  to { opacity: 0; visibility: hidden; }
}
EOCSS

# Crear archivo JS
cat << 'EOJS' > intro_futurista.js
document.addEventListener("DOMContentLoaded", () => {
  const text = document.querySelector(".typed-text");
  const fullText = text.textContent;
  text.textContent = "";
  let index = 0;
  const typing = setInterval(() => {
    if (index < fullText.length) {
      text.textContent += fullText[index];
      index++;
    } else {
      clearInterval(typing);
    }
  }, 80);
});
EOJS

# Subir todo a GitHub
git add index.html intro_futurista.css intro_futurista.js
git commit -m "Intro futurista animada para DELTHA-TECH"
git push origin master

echo "¡Intro futurista agregada y subida! Ve a: https://deltha-tech.github.io y recarga sin caché."
