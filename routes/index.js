var express = require('express');
var router = express.Router();
var shell = require('shelljs');

/* GET home page. */
router.get('/teme', function(req, res, next) {
  	res.render('index', { title: 'Express' });
});
router.post('/res', function(req, res, next) {
  	shell.exec("sh ../start.sh nodejs");
  	res.json({
  		msg: "success"
  	})
});
module.exports = router;
