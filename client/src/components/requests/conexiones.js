const requests = {};

requests.putOrigen = async config => fetch('/api/conexiones/origen', {
  method: 'put',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({ config }),
})
  .then(res => res.json());

requests.putDestino = async config => fetch('/api/conexiones/destino', {
  method: 'put',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({ config }),
})
  .then(res => res.json());

export default requests;
