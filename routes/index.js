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


module.exports = router;
