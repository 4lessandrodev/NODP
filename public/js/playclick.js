
var buttonsAll = document.querySelectorAll('input[type=button], button');
var AUDIO = document.querySelector('#audio-click');

const tocarAudio = () => {
  AUDIO.play();
};

for (let btn of buttonsAll) {
  btn.addEventListener('click', tocarAudio);
}
