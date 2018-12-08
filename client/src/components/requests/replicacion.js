const requests = {};

requests.get = () => {
  return fetch('/api/conexiones', {
    method: 'get',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  })
    .then(res => res.json());
};

export default requests;
