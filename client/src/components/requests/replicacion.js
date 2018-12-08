const requests = {};

requests.get = async () => {
  return fetch('/api/conexiones', {
    method: 'get',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  })
    .then(res => res.json());
};

requests.guardar = async (tablas) => {
  return fetch('/api/replicacion', {
    method: 'put',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ tablas }),
  })
    .then(res => res.json());
};

requests.cancelar = async () => {
  return fetch('/api/replicacion', {
    method: 'delete',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  })
    .then(res => res.json());
};

export default requests;
