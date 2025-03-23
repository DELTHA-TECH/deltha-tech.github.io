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
