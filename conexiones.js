const conexiones = {
  mysql: undefined,
  mssql: undefined,
};

conexiones.connectMysql = (instancia, db, puerto, usuario, password) => {};

conexiones.connectMssql = (instancia, db, puerto, usuario, password) => {};

module.exports = conexiones;
