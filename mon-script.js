const button = document.querySelector('.drop-button');
const text = document.querySelector('.dropped-content');

button.addEventListener('click', () => {
  text.classList.toggle('.dropped-content');
});