const BOTOES = document.querySelectorAll('input[type=button], button');
const AUDIO = document.querySelector('#audio-click');

const tocarAudio = () => {
  AUDIO.play();
};

for (let btn of BOTOES) {
  btn.addEventListener('click', tocarAudio);
}