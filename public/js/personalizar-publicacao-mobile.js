const CATEGORIA = document.querySelector('#modalMobile select[name=categoria]');
const DETALHES_ENSINAR = document.querySelector('#detalhesEnsinar');
const URGENTE = document.querySelector('#btn-Urgente');
const TITULO = document.querySelector('#modalMobile input[name=titulo-modal-ensinando');
const QTD_MOEDAS = document.querySelector('#moeda');
const QTD_TEMPO = document.querySelector('#time');

const BTN_MAIS_TEMPO = document.querySelector('#btn-mais-tempo');
const BTN_MENOS_TEMPO = document.querySelector('#btn-menos-tempo');
const BTN_MAIS_MOEDA = document.querySelector('#btn-mais-moeda');
const BTN_MENOS_MOEDA = document.querySelector('#btn-menos-moeda');

const AJUSTAR_LAYOUT_POSTAGEM_MOBILE = () => {
  let categoria = CATEGORIA.value;
  switch (categoria) {
    case '1':
      URGENTE.classList.remove('display-none');
      DETALHES_ENSINAR.classList.add('display-none');
      TITULO.classList.remove('titulo-total');
      break;
    case '2':
      URGENTE.classList.add('display-none');
      DETALHES_ENSINAR.classList.add('display-none');
      TITULO.classList.add('titulo-total');
      break;
    case '3':
      URGENTE.classList.add('display-none');
      DETALHES_ENSINAR.classList.remove('display-none');
      TITULO.classList.add('titulo-total');
      break;
    case '4':
      URGENTE.classList.add('display-none');
      DETALHES_ENSINAR.classList.add('display-none');
      TITULO.classList.add('titulo-total');
      break;
  }
};

const AUMENTAR_TEMPO = () => {
  var tempoAtual = parseInt(QTD_TEMPO.value);
  QTD_TEMPO.value = `${tempoAtual + 15} min`;
};

const DIMINUIR_TEMPO = () => {
  var tempoAtual = parseInt(QTD_TEMPO.value);
  (tempoAtual == 15) ? QTD_TEMPO.value = `${15} min` : QTD_TEMPO.value = `${tempoAtual - 15} min`;
};

const AUMENTAR_MOEDA = () => {
  var moedaAtual = parseInt(QTD_MOEDAS.value);
  (moedaAtual == 0) ? QTD_MOEDAS.value = `${1} moeda` : QTD_MOEDAS.value = `${moedaAtual + 1} moedas`;
};

const DIMINUIR_MOEDA = () => {
  var moedaAtual = parseInt(QTD_MOEDAS.value);
  if (moedaAtual == 2) {
    QTD_MOEDAS.value = `${1} moeda`;
  } else if (moedaAtual < 1) {
    QTD_MOEDAS.value = `${0} moeda`;
  } else {
    QTD_MOEDAS.value = `${moedaAtual - 1} moedas`;
  }
};

const FLEGAR_URGENTE = () => {
  URGENTE.classList.toggle('urgente-selecionado');
};

CATEGORIA.addEventListener('change', AJUSTAR_LAYOUT_POSTAGEM_MOBILE);
BTN_MAIS_TEMPO.addEventListener('click', AUMENTAR_TEMPO);
BTN_MENOS_TEMPO.addEventListener('click', DIMINUIR_TEMPO);
BTN_MAIS_MOEDA.addEventListener('click', AUMENTAR_MOEDA);
BTN_MENOS_MOEDA.addEventListener('click', DIMINUIR_MOEDA);
URGENTE.addEventListener('click', FLEGAR_URGENTE);