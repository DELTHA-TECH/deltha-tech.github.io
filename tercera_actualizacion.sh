#!/bin/bash
echo "[+] Iniciando tercera actualización futurista..."

# Crear respaldo del index.html actual
timestamp=$(date +%s)
cp index.html "index_backup_$timestamp.html"
echo "[+] Respaldo creado: index_backup_$timestamp.html"

# Incluir HTML con fondo de logo y efectos scroll
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DELTHA-TECH | Página Futurista</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Orbitron', sans-serif;
      background: url('images/Logos/DELTHA-TECH logo.jpg') no-repeat center center fixed;
      background-size: cover;
      color: white;
      overflow-x: hidden;
    }

    header {
      background: rgba(0, 0, 0, 0.6);
      text-align: center;
      padding: 30px 10px;
      border-bottom: 1px solid #0ff;
    }

    header img {
      width: 160px;
      filter: drop-shadow(0 0 10px #0ff);
    }

    .intro {
      text-align: center;
      margin: 50px auto;
      font-size: 1.4em;
      max-width: 90%;
      background-color: rgba(0, 0, 0, 0.7);
      padding: 30px;
      border-radius: 12px;
    }

    .btn-lang {
      position: fixed;
      top: 20px;
      right: 20px;
      padding: 10px 15px;
      background: #0ff;
      color: #000;
      font-weight: bold;
      border: none;
      cursor: pointer;
      z-index: 999;
      border-radius: 6px;
    }

    section {
      padding: 60px 20px;
      min-height: 100vh;
      background: rgba(0,0,0,0.6);
    }

    .parallax {
      transition: transform 0.3s ease-out;
    }

    h2 {
      font-size: 2em;
      text-align: center;
      color: #0ff;
      text-shadow: 0 0 10px #0ff;
    }

    footer {
      background: rgba(0, 0, 0, 0.7);
      text-align: center;
      padding: 20px;
      border-top: 1px solid #0ff;
    }
  </style>
</head>
<body>

<button class="btn-lang" onclick="toggleLang()">EN</button>

<header>
  <img src="images/Logos/DELTHA-TECH logo.jpg" alt="DELTHA-TECH" />
  <h1 id="titulo">Bienvenido a DELTHA-TECH</h1>
</header>

<div class="intro parallax" id="intro">
  <p id="introTexto">
    Somos DELTHA-TECH, expertos en celulares y tecnología avanzada. Ofrecemos equipos Samsung, Xiaomi, iPhone, Honor y servicios técnicos de alta calidad.
  </p>
</div>

<section class="parallax">
  <h2 id="seccionServicios">Servicios Técnicos</h2>
  <ul>
    <li>Cambio de pantalla</li>
    <li>Reparación de placas</li>
    <li>Cambio de entradas</li>
    <li>Cambio de glas</li>
    <li>Cambio de batería</li>
  </ul>
</section>

<section class="parallax">
  <h2 id="seccionForense">Análisis Forense</h2>
  <p id="textoForense">
    Recuperamos fotos, videos y documentos de dispositivos dañados o borrados.
  </p>
</section>

<footer>
  <p>&copy; 2025 DELTHA-TECH. Todos los derechos reservados.</p>
</footer>

<script>
  // Efecto Parallax al hacer scroll
  document.addEventListener('scroll', () => {
    document.querySelectorAll('.parallax').forEach(el => {
      const offset = window.scrollY;
      el.style.transform = 'translateY(' + offset * 0.1 + 'px)';
    });
  });

  // Cambio de idioma (ES <-> EN)
  let lang = 'es';
  function toggleLang() {
    if (lang === 'es') {
      document.getElementById('titulo').innerText = "Welcome to DELTHA-TECH";
      document.getElementById('introTexto').innerText = "We are DELTHA-TECH, specialists in smartphones and advanced tech. We offer Samsung, Xiaomi, iPhone, Honor devices and top-notch repair services.";
      document.getElementById('seccionServicios').innerText = "Technical Services";
      document.getElementById('textoForense').innerText = "We recover photos, videos and documents from damaged or deleted devices.";
      lang = 'en';
      document.querySelector('.btn-lang').innerText = "ES";
    } else {
      document.getElementById('titulo').innerText = "Bienvenido a DELTHA-TECH";
      document.getElementById('introTexto').innerText = "Somos DELTHA-TECH, expertos en celulares y tecnología avanzada. Ofrecemos equipos Samsung, Xiaomi, iPhone, Honor y servicios técnicos de alta calidad.";
      document.getElementById('seccionServicios').innerText = "Servicios Técnicos";
      document.getElementById('textoForense').innerText = "Recuperamos fotos, videos y documentos de dispositivos dañados o borrados.";
      lang = 'es';
      document.querySelector('.btn-lang').innerText = "EN";
    }
  }
</script>

</body>
</html>
EOF

# Subir cambios a GitHub
echo "[+] Subiendo actualización a GitHub..."
git add index.html
git commit -m "Tercera actualización futurista con fondo de logo y efectos scroll"
git push

echo "[+] ¡Actualización completada! Revisa tu sitio en: https://deltha-tech.github.io/"
