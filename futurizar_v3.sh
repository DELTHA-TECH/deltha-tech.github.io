#!/bin/bash

echo "[+] Realizando respaldo del index actual..."
cp index.html index_backup_$(date +%s).html

echo "[+] Generando diseño futurista completo en index.html..."

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELTHA-TECH</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Orbitron', sans-serif;
      color: #00fff7;
      background: linear-gradient(to right, #000000, #0f0f0f);
      background-attachment: fixed;
      overflow-x: hidden;
    }
    header {
      text-align: center;
      padding: 40px 10px 10px;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    header img {
      max-width: 200px;
      animation: pulse 3s infinite;
    }
    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 0.9; }
      50% { transform: scale(1.05); opacity: 1; }
    }
    h1 {
      font-size: 2.2rem;
      margin-top: 10px;
      color: #00fff7;
      text-shadow: 0 0 8px #00fff7;
    }
    nav {
      display: flex;
      justify-content: center;
      gap: 20px;
      background: rgba(255,255,255,0.05);
      padding: 15px;
      margin-bottom: 20px;
    }
    nav a {
      color: #fff;
      text-decoration: none;
      padding: 8px 15px;
      border: 1px solid #00fff7;
      border-radius: 5px;
      transition: all 0.3s ease;
    }
    nav a:hover {
      background-color: #00fff7;
      color: #000;
      box-shadow: 0 0 15px #00fff7;
    }
    section {
      padding: 30px 20px;
    }
    .galeria {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
    }
    .galeria img {
      width: 180px;
      height: auto;
      border: 2px solid #00fff7;
      border-radius: 10px;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
    }
    .galeria img:hover {
      transform: scale(1.05);
      box-shadow: 0 0 15px #00fff7;
    }
    .whatsapp-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #25d366;
      color: white;
      padding: 15px;
      border-radius: 50%;
      font-size: 22px;
      text-align: center;
      box-shadow: 0 0 15px #00ffae;
      animation: bounce 2s infinite;
      z-index: 999;
    }
    .whatsapp-msg {
      display: none;
      position: fixed;
      bottom: 90px;
      right: 20px;
      background: #00fff7;
      color: #000;
      padding: 10px 15px;
      border-radius: 10px;
      font-size: 14px;
      z-index: 998;
    }
    .whatsapp-btn:hover + .whatsapp-msg {
      display: block;
    }
    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-8px); }
    }
  </style>
</head>
<body>

  <header>
    <img src="imagenes/DELTHA-TECH_logo.jpg" alt="DELTHA-TECH">
    <h1>Bienvenido a DELTHA-TECH</h1>
    <p>Expertos en celulares, servicio técnico y análisis forense</p>
  </header>

  <nav>
    <a href="#productos">Productos</a>
    <a href="#servicios">Servicios</a>
    <a href="#forense">Análisis Forense</a>
    <a href="#contacto">Contacto</a>
  </nav>

  <section id="productos">
    <h2>Productos por Marca</h2>
    <div class="galeria">
      $(for dir in imagenes/Samsung imagenes/Xiaomi imagenes/Honor imagenes/iPhone; do
        for img in \$dir/*; do
          echo "<img src=\"\$img\" alt=\"Producto\">"
        done
      done)
    </div>
  </section>

  <section id="servicios">
    <h2>Servicios Técnicos</h2>
    <p>Ofrecemos cambio de pantalla, batería, conector, flex, protector, y reparación de placas.</p>
    <div class="galeria">
      $(for img in imagenes/servicio_tecnico/*; do
        echo "<img src=\"\$img\" alt=\"Servicio Técnico\">"
      done)
    </div>
  </section>

  <section id="forense">
    <h2>Análisis Forense</h2>
    <p>Recuperamos fotos, videos y documentos desde celulares y computadoras dañadas o formateadas.</p>
    <div class="galeria">
      $(for img in imagenes/analisis_forense/*; do
        echo "<img src=\"\$img\" alt=\"Análisis Forense\">"
      done)
    </div>
  </section>

  <section id="contacto">
    <h2>Contacto</h2>
    <p>WhatsApp: 910-763-905 / 987-180-885</p>
    <p>Email: contacto@deltha-tech.com</p>
    <p>Ubicación: Lima, Perú</p>
  </section>

  <a class="whatsapp-btn" href="https://wa.me/51910763905" target="_blank">W</a>
  <div class="whatsapp-msg">¿Necesitas ayuda?</div>

</body>
</html>
EOF

echo "[✓] Página futurista generada correctamente como index.html"
