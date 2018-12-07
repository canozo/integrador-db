const test = require('../test');

const controller = {};

controller.get = (req, res) => {
  res.send(String(test.variable));
  test.sumar(5);
};

module.exports = controller;
