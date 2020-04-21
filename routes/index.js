var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('entrar', { title: 'Login' });
});


/* GET index page. */
router.get('/index', function (req, res, next) {
  res.render('index', { title: 'Login' });
});


/* GET cadastro page. */
router.get('/cadastro', function (req, res, next) {
  res.render('cadastro', { title: 'Cadastro' });
});

/* GET home page. */
router.get('/home', function (req, res, next) {
  res.render('home', { title: 'Home' });
});

/* GET perfil usuario id page. */
router.get('/perfil-usuario/:id?', function (req, res, next) {
  res.render('perfil-usuario', { title: 'Usuário' });
});

/* GET perfil page. */
router.get('/perfil', function (req, res, next) {
  res.render('perfil', { title: 'Perfil' });
});

/* GET pesquisas page. */
router.get('/pesquisas', function (req, res, next) {
  res.render('pesquisas', { title: 'Pesquisa' });
});


/* GET ranking alunos page. */
router.get('/ranking-alunos', function (req, res, next) {
  res.render('ranking-alunos', { title: 'Ranking' });
});

/* GET ranking professores page. */
router.get('/ranking-professores', function (req, res, next) {
  res.render('ranking-professores', { title: 'Ranking' });
});

/* GET apoiados/apoiando page. */
router.get('/apoio', function (req, res, next) {
  res.render('apoio', { title: 'Apoio' });
});

router.get('/apoiadores', function (req, res, next) {
  res.render('apoiadores', { title: 'Apoiadores' });
});

/* GET notificacoes page. */
router.get('/notificacoes', function (req, res, next) {
  res.render('notificacoes', { title: 'Últimas notificações' });
});

/* GET mensagens page. */
router.get('/mensagens', function (req, res, next) {
  res.render('mensagens', { title: 'Últimas Mensagens' });
});

module.exports = router;
