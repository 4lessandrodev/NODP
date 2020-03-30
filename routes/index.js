var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('entrar', { title: 'Login' });
});


/* GET home page. */
router.get('/index', function (req, res, next) {
  res.render('index', { title: 'Login' });
});


/* GET home page. */
router.get('/cadastro', function (req, res, next) {
  res.render('cadastro', { title: 'Cadastro' });
});


module.exports = router;
