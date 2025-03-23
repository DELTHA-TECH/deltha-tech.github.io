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
