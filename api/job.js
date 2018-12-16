const express = require('express');
const router = express.Router();
const controller = require('../controllers/job');

router.put('/', controller.put);
router.get('/', controller.get);

module.exports = router;
