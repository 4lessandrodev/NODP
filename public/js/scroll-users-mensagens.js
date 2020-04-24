
var ulUsuarios = document.querySelectorAll('.msg-ul-amigos');
var DIREITA = document.querySelectorAll('.anterior');
var ESQUERDA = document.querySelectorAll('.proximo');
var VIEW_USERS = document.querySelectorAll('.msg-ul-amigos');

  //Esta função aplica o efeito no botão clicado pelo usuário para adicionar filtro do usuário
  for (let user of ulUsuarios) {
    user.addEventListener('click', function (e) {
      var clicou = e.target.parentNode.parentNode;
      if (clicou.tagName == 'LI') {
        clicou.classList.toggle('usuario-selecionado');
      }
    });
  }

  for (let btn of ESQUERDA) {
    btn.addEventListener('click', function() {
      if (VIEW_USERS[1] != undefined) {
        VIEW_USERS[1].scrollTo(VIEW_USERS[1].offsetWidth + VIEW_USERS[1].offsetWidth, 0);
      } else {
        VIEW_USERS[0].scrollTo(VIEW_USERS[0].offsetWidth + VIEW_USERS[0].offsetWidth, 0);
      }
    });
  }

  for (let btn of DIREITA) {
    btn.addEventListener('click', function () {
      if (VIEW_USERS[1] != undefined) {
        VIEW_USERS[1].scrollTo(VIEW_USERS[1].offsetWidth - VIEW_USERS[1].offsetWidth, 0);
      } else {
        VIEW_USERS[0].scrollTo(VIEW_USERS[0].offsetWidth - VIEW_USERS[0].offsetWidth, 0);
      }
    });
  }
