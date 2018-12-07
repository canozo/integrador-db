const express = require('express');
const router = express.Router();
const controller = require('../controllers/conexiones');

router.put('/origen', controller.putOrigen);
router.put('/destino', controller.putDestino);

module.exports = router;
