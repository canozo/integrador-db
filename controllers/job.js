const conexiones = require('../conexiones');

const controller = {};

controller.put = (req, res) => {
  const msg = `Job, replicas: ${conexiones.replicando.join(', ')}`;
  console.log(msg);
  res.send({ error: false, mensaje: msg });
};

module.exports = controller;
