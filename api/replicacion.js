const express = require('express');
const router = express.Router();
const controller = require('../controllers/replicacion');

router.put('/', controller.put);
router.delete('/', controller.delete);

module.exports = router;
