const mysql = require('mysql');
const mssql = require('mssql');
const conexiones = require('../conexiones');

const controller = {};

controller.get = (req, res) => {
  // mira si hay conexion, si la hay devuelve todas las tablas de mssql
  if (conexiones.mssql === undefined && conexiones.mysql === undefined) {
    res.json({ error: true, mensaje: 'No esta conectado a SQL Server y MySQL.' });
    return;
  }

  if (conexiones.mssql === undefined) {
    res.json({ error: true, mensaje: 'No esta conectado a SQL Server.' });
    return;
  }

  if (conexiones.mysql === undefined) {
    res.json({ error: true, mensaje: 'No esta conectado a MySQL.' });
    return;
  }

  const msReq = new mssql.Request(conexiones.mssql);
  msReq.query(
  `select table_name as tabla
  from information_schema.tables
  where table_type='BASE TABLE'`,
  (err, result) => {
    if (err) {
      console.log(err);
      res.json({ error: true, mensaje: 'Error al obtener informacion de SQL Server.' });
    } else {
      const tablas = [];
      for (let i = 0; i < result.rowsAffected; i++) {
        tablas.push(result.recordset[i].tabla);
      }
      res.json({ error: false, mensaje: 'Esta conectado!', tablas });
    }
  });

};

controller.putOrigen = (req, res) => {
  const conexion = new mssql.ConnectionPool(req.body.config);
  // const request = new mssql.Request(conexion);

  conexion.connect((err) => {
    if (err) {
      console.log('Error conectado a mssql', err);
      res.json({ error: true, mensaje: 'Error conectado a mssql' });
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
      res.json({ error: true, mensaje: 'Error conectado a mysql' });
      return;
    }

    console.log('Conexion establecida con mysql');
    conexiones.mysql = conexion;
    res.json({ error: false, mensaje: 'Conexion establecida con mysql' });
  });
};

module.exports = controller;
