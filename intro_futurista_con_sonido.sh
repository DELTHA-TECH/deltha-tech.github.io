#!/bin/bash
echo "Agregando introducción futurista con sonido a DELTHA-TECH..."

# Backup por seguridad
cp index.html index_backup_intro_$(date +%s).html

# Insertar HTML de intro antes del <body>
sed -i '/<body>/a\
<div id="intro-container">\
  <audio id="intro-sound" autoplay>\
    <source src="intro_sound.mp3" type="audio/mpeg">\
  </audio>\
  <div class="glitch-text">\
    <span class="typed-text">Bienvenido a DELTHA-TECH</span>\
  </div>\
</div>' index.html

# Insertar CSS antes de </head>
sed -i '/<\/head>/i\
<link rel="stylesheet" href="intro_futurista.css">' index.html

# Insertar JS antes de </body>
sed -i '/<\/body>/i\
<script src="intro_futurista.js"></script>' index.html

# Crear CSS de la intro
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

# Crear JS de animación y sonido
cat << 'EOJS' > intro_futurista.js
document.addEventListener("DOMContentLoaded", () => {
  const text = document.querySelector(".typed-text");
  const fullText = text.textContent;
  text.textContent = "";
  const audio = document.getElementById("intro-sound");
  audio.volume = 0.3;
  audio.play();
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

# Descargar beep corto estilo futurista (0.4s)
curl -o intro_sound.mp3 https://cdn.pixabay.com/download/audio/2022/10/26/audio_0d1c3c4175.mp3?filename=beep-112295.mp3

# Subir a GitHub
git add index.html intro_futurista.css intro_futurista.js intro_sound.mp3
git commit -m "Intro futurista animada con sonido"
git push origin master

echo "¡Intro animada con sonido activada! Revisa en https://deltha-tech.github.io"
