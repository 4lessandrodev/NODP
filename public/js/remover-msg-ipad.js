
const IPAD_CONTAINER = document.querySelector('#container-aulas-recentes');
const VERIFICAR_TAMANHO_DA_TELA = () => {
  let largura = window.screen.width;
  (largura > 1199 || largura < 599) ? IPAD_CONTAINER.remove() : '';
};
VERIFICAR_TAMANHO_DA_TELA();
