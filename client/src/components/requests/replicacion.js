const requests = {};

requests.get = async () => fetch('/api/conexiones', {
  method: 'get',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
})
  .then(res => res.json());

requests.getTablas = async () => fetch('/api/replicacion', {
  method: 'get',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
})
  .then(res => res.json());

requests.guardar = async tablas => fetch('/api/replicacion', {
  method: 'put',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({ tablas }),
})
  .then(res => res.json());

requests.cancelar = async () => fetch('/api/replicacion', {
  method: 'delete',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
})
  .then(res => res.json());

export default requests;
