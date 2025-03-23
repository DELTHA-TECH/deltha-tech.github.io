#!/bin/bash
echo "Agregando intro futurista con fondo animado y sonido..."

# Backup de seguridad
cp index.html index_backup_intro_$(date +%s).html

# Insertar contenedor animado al inicio del <body>
sed -i '/<body>/a\
<div id="intro-container">\
  <canvas id="particles"></canvas>\
  <audio id="intro-sound" autoplay>\
    <source src="intro_sound.mp3" type="audio/mpeg">\
  </audio>\
  <div class="glitch-text">\
    <span class="typed-text">Bienvenido a DELTHA-TECH</span>\
  </div>\
</div>' index.html

# Vincular CSS y JS
sed -i '/<\/head>/i\
<link rel="stylesheet" href="intro_futurista.css">' index.html

sed -i '/<\/body>/i\
<script src="intro_futurista.js"></script>' index.html

# CSS estilo galaxia con partículas y texto glitch
cat << 'EOCSS' > intro_futurista.css
#intro-container {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: black;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  animation: fadeOut 6s ease-in-out 4.5s forwards;
}

#particles {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 1;
}

.glitch-text {
  z-index: 2;
  color: #00ffff;
  font-size: 2em;
  font-family: 'Courier New', monospace;
  text-shadow: 0 0 5px #0ff, 0 0 15px #0ff, 0 0 30px #00f;
  animation: glitch 0.6s infinite;
}

@keyframes glitch {
  0% { transform: translate(0); }
  25% { transform: translate(-2px, 2px); }
  50% { transform: translate(2px, -2px); }
  75% { transform: translate(-1px, 1px); }
  100% { transform: translate(0); }
}

@keyframes fadeOut {
  to { opacity: 0; visibility: hidden; }
}
EOCSS

# JS para partículas y texto animado
cat << 'EOJS' > intro_futurista.js
document.addEventListener("DOMContentLoaded", () => {
  const canvas = document.getElementById("particles");
  const ctx = canvas.getContext("2d");
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  let particlesArray = [];

  class Particle {
    constructor() {
      this.x = Math.random() * canvas.width;
      this.y = Math.random() * canvas.height;
      this.size = Math.random() * 2 + 0.5;
      this.speedX = Math.random() * 0.5 - 0.25;
      this.speedY = Math.random() * 0.5 - 0.25;
    }
    update() {
      this.x += this.speedX;
      this.y += this.speedY;
      if (this.x < 0 || this.x > canvas.width) this.speedX *= -1;
      if (this.y < 0 || this.y > canvas.height) this.speedY *= -1;
    }
    draw() {
      ctx.fillStyle = '#0ff';
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
      ctx.fill();
    }
  }

  function initParticles() {
    particlesArray = [];
    for (let i = 0; i < 150; i++) {
      particlesArray.push(new Particle());
    }
  }

  function animateParticles() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    particlesArray.forEach(p => {
      p.update();
      p.draw();
    });
    requestAnimationFrame(animateParticles);
  }

  initParticles();
  animateParticles();

  // Texto tipo máquina
  const text = document.querySelector(".typed-text");
  const fullText = text.textContent;
  text.textContent = "";
  const audio = document.getElementById("intro-sound");
  audio.volume = 0.4;
  audio.play();
  let i = 0;
  const typing = setInterval(() => {
    if (i < fullText.length) {
      text.textContent += fullText[i];
      i++;
    } else {
      clearInterval(typing);
    }
  }, 80);
});
EOJS

# Descargar sonido futurista corto
curl -o intro_sound.mp3 https://cdn.pixabay.com/download/audio/2022/10/26/audio_0d1c3c4175.mp3?filename=beep-112295.mp3

# Subir archivos
git add index.html intro_futurista.css intro_futurista.js intro_sound.mp3
git commit -m "Intro futurista 2.0 con fondo animado y sonido galáctico"
git push origin master

echo "¡Intro galáctica activada! Visita: https://deltha-tech.github.io"
