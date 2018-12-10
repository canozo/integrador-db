const requests = {};

requests.put = async () => fetch('/api/job', {
  method: 'put',
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
})
  .then(res => res.json());

export default requests;
