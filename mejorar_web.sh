#!/data/data/com.termux/files/usr/bin/bash

# Instalar dependencias
pkg update -y
pkg install -y git imagemagick

# Rutas
REPO_DIR=~/deltha-tech.github.io
IMG_DIR="$REPO_DIR/images"
mkdir -p "$IMG_DIR"

# Optimizar imágenes (máx 300KB)
find "$IMG_DIR" -type f -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' | while read -r img; do
  convert "$img" -strip -quality 85 -define jpeg:extent=300kb "$img"
done

# Crear index.html futurista
cat > "$REPO_DIR/index.html" <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DELTHA-TECH | Celulares y Servicios</title>
  <link rel="icon" type="image/x-icon" href="favicon.ico">
  <style>
    body {
      margin: 0; font-family: 'Orbitron', sans-serif;
      background: linear-gradient(135deg, #0f0f0f, #1f1f1f);
      color: #00ffff; overflow-x: hidden;
    }
    header {
      text-align: center; padding: 30px;
      background: #000; color: #0ff;
      text-shadow: 0 0 10px #0ff;
      font-size: 2em;
    }
    nav {
      display: flex; justify-content: center; gap: 20px; margin: 20px;
    }
    nav button {
      padding: 10px 20px;
      border: none; border-radius: 5px;
      background: #0ff; color: #000;
      font-weight: bold; cursor: pointer;
      box-shadow: 0 0 10px #0ff;
      transition: transform 0.2s;
    }
    nav button:hover { transform: scale(1.1); }

    .galeria, .servicios {
      display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;
      padding: 20px;
    }

    .item {
      background: #111; padding: 10px; border-radius: 10px;
      box-shadow: 0 0 15px #0ff7;
      transition: transform 0.3s;
    }
    .item:hover { transform: scale(1.05); }
    .item img {
      width: 200px; border-radius: 10px;
    }

    /* Botón WhatsApp flotante */
    #whatsapp-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      width: 65px; height: 65px;
      border-radius: 50%;
      background: #25d366;
      box-shadow: 0 0 15px #25d366;
      display: flex; justify-content: center; align-items: center;
      animation: bounce 2s infinite;
      z-index: 1000;
    }
    #whatsapp-btn:hover + #whatsapp-msg,
    #whatsapp-btn:focus + #whatsapp-msg,
    #whatsapp-btn:active + #whatsapp-msg {
      opacity: 1;
      transform: translateY(-10px);
    }

    #whatsapp-msg {
      position: fixed;
      bottom: 90px;
      right: 30px;
      background: #111;
      color: #fff;
      padding: 8px 12px;
      border-radius: 8px;
      box-shadow: 0 0 10px #25d366;
      opacity: 0;
      transition: all 0.3s ease-in-out;
      pointer-events: none;
    }

    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-8px); }
    }

    /* Scroll animado */
    .scroll-anim {
      opacity: 0;
      transform: translateY(20px);
      transition: all 0.8s ease;
    }
    .scroll-anim.visible {
      opacity: 1;
      transform: translateY(0);
    }
  </style>
</head>
<body>

<header>DELTHA-TECH</header>

<nav>
  <button onclick="filtrar('todos')">Todos</button>
  <button onclick="filtrar('Samsung')">Samsung</button>
  <button onclick="filtrar('Xiaomi')">Xiaomi</button>
  <button onclick="filtrar('iPhone')">iPhone</button>
  <button onclick="filtrar('Honor')">Honor</button>
</nav>

<section class="galeria" id="galeria">
  <!-- Aquí se insertarán automáticamente las imágenes -->
EOF

# Insertar imágenes de productos
for marca in Samsung Xiaomi iPhone Honor; do
  find "$IMG_DIR/$marca" -type f -iname '*.jpg' -o -iname '*.png' | while read -r img; do
    nombre=$(basename "$img")
    echo "<div class='item $marca scroll-anim'><img src='images/$marca/$nombre' alt='$marca'></div>" >> "$REPO_DIR/index.html"
  done
done

# Sección de servicios
cat >> "$REPO_DIR/index.html" <<EOF
</section>

<h2 style="text-align:center;margin-top:30px;">Servicios</h2>
<section class="servicios">
  <div class="item scroll-anim"><img src="images/servicio_tecnico.png" alt="Técnico"><p>Servicio técnico</p></div>
  <div class="item scroll-anim"><img src="images/forense.png" alt="Forense"><p>Análisis forense</p></div>
  <div class="item scroll-anim"><img src="images/recuperacion.png" alt="Datos"><p>Recuperación de datos</p></div>
</section>

<!-- WhatsApp flotante -->
<a id="whatsapp-btn" href="https://wa.me/51910763905" target="_blank">
  <img src="https://img.icons8.com/ios-filled/50/ffffff/whatsapp.png" width="35" height="35">
</a>
<div id="whatsapp-msg">¿Necesitas ayuda?</div>

<script>
function filtrar(marca) {
  const items = document.querySelectorAll('.item');
  items.forEach(el => {
    el.style.display = (marca === 'todos' || el.classList.contains(marca)) ? 'block' : 'none';
  });
}

// Scroll animado
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) entry.target.classList.add('visible');
  });
});
document.querySelectorAll('.scroll-anim').forEach(el => observer.observe(el));
</script>

</body>
</html>
EOF

# Subir a GitHub
cd "$REPO_DIR"
git add .
git commit -m "Mejorando sitio web futurista con galería, animaciones y botón de WhatsApp"
git push
