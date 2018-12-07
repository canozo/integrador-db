const mysql = require('mysql');
const mssql = require('mssql');

const conexiones = {
  mysql: undefined,
  mssql: undefined,
};

conexiones.connectMysql = (instancia, db, puerto, usuario, password) => {
  const config = {
    host: instancia,
    port: puerto,
    database: db,
    user: usuario,
    password: password
  };

  const conexion = mysql.createConnection(config);

  conexion.connect(err => {
    if (err) {
      console.log('Error conectado a mysql', err);
      return;
    }

    console.log('Conexion establecida con mysql');
    conexiones.mysql = conexion;
  });
};

conexiones.connectMssql = (instancia, db, puerto, usuario, password) => {
  const config = {
    server: instancia,
    port: puerto,
    database: db,
    user: usuario,
    password: password,
  };

  // const conexion = mssql.connect(config);
  const conexion = mssql.connect(config);
};

module.exports = conexiones;
