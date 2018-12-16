const mysql = require('mysql');
const mssql = require('mssql');
const conexiones = require('../conexiones');

const controller = {};
const job = {
  enabled: false,
  working: false,
  num: 0,
};

controller.put = (req, res) => {
  if (!job.enabled) {
    job.enabled = true;
    setInterval(() => {
      console.log(`\nJob #${job.num}\nReplicando: ${conexiones.replicando.join(', ')}`);

      // empezar el JOB si no esta trabajando
      if (!job.working) {
        job.working = true;
        const msReq = new mssql.Request(conexiones.mssql);

        msReq.query('select * from dbo.Bitacora', (err, result) => {
          console.log(err, result);
        });

        job.num += 1;
        job.working = false;
      }
    }, 1000);
  }
  res.send({ enabled: true });
};

controller.get = (req, res) => {
  // ver si el job esta activado
  res.json({ enabled: job.enabled });
}

module.exports = controller;
