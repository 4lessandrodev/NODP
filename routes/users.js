var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

/* Rota para renderizar a pagina inicial do site */
router.get('/home', (req, res, next) => {
  res.render('home');
});

module.exports = router;
