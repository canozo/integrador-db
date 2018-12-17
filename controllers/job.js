const mssql = require('mssql');
const conexiones = require('../conexiones');

const controller = {};
const job = {
  transacciones: [],
  enabled: false,
};

function replicar(id, transaccion) {
  conexiones.mysql.query(transaccion, (err, result) => {
    if (err) {
      job.transacciones = job.transacciones.filter((value) => value !== id);
      console.log('Error replicando, revise que esta replicando las llaves foraneas necesarias', err.code);
    } else {
      eliminarBitacora(id);
    }
  });
}

function eliminarBitacora(id) {
  const msReq = new mssql.Request(conexiones.mssql);
  msReq.query(`delete from bitacora where id_transaccion = ${id}`, (err, result) => {
    if (err) {
      console.log('Error eliminando de bitacora', err);
    }
  });
}

controller.put = (req, res) => {
  if (!job.enabled) {
    job.enabled = true;
    setInterval(() => {
      const msReq = new mssql.Request(conexiones.mssql);
      msReq.query('select * from bitacora order by id_transaccion asc;', (err, result) => {
        if (err) {
          console.log(err);
        } else {
          for (let i = 0; i < result.rowsAffected; i++) {
            let tabla = result.recordset[i].tabla.trim();
            let id = result.recordset[i].id_transaccion;
            let trans = result.recordset[i].transaccion;

            if (conexiones.replicando.includes(tabla) && !job.transacciones.includes(id)) {
              job.transacciones.push(id);
              console.log(`Replicando transaccion #${id} en tabla ${tabla}`);
              replicar(id, trans);
            }
          }
        }
      });
    }, 1000);
  }
  res.send({ enabled: true });
};

controller.get = (req, res) => {
  res.json({ enabled: job.enabled });
}

module.exports = controller;
