const conexiones = require('../conexiones');

const controller = {};

controller.put = (req, res) => {
  conexiones.replicando = req.body.tablas;
  res.send({ error: false, mensaje: `Status replicando: ${conexiones.replicando.join(', ')}` });
};

controller.delete = (req, res) => {
  conexiones.replicando = [];
  res.send({ error: false, mensaje: 'Status replicando:' });
};

module.exports = controller;
