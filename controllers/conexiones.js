const mysql = require('mysql');
const mssql = require('mssql');
const conexiones = require('../conexiones');

const controller = {};

controller.putOrigen = (req, res) => {
  const conexion = new mssql.ConnectionPool(req.body.config);
  // const request = new mssql.Request(conexion);

  conexion.connect((err) => {
    if (err) {
      console.log('Error conectado a mssql', err);
      res.json({ error: true, mensaje: err });
      return;
    }

    console.log('Conexion establecida con mssql');
    conexiones.mssql = conexion;
    res.json({ error: false, mensaje: 'Conexion establecida con mssql' });
  });
};

controller.putDestino = (req, res) => {
  const conexion = mysql.createConnection(req.body.config);

  conexion.connect(err => {
    if (err) {
      console.log('Error conectado a mysql', err);
      res.json({ error: true, mensaje: err });
      return;
    }

    console.log('Conexion establecida con mysql');
    conexiones.mysql = conexion;
    res.json({ error: false, mensaje: 'Conexion establecida con mysql' });
  });
};

module.exports = controller;
