import React from 'react';
import { Button, CustomInput, Form, FormGroup, Label, Alert } from 'reactstrap';
import requests from './requests/replicacion';

class Replicacion extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;

    this.replicar = this.replicar.bind(this);
    this.noReplicar = this.noReplicar.bind(this);
    this.checkearSinReplicar = this.checkearSinReplicar.bind(this);
    this.checkearReplicando = this.checkearReplicando.bind(this);
    this.guardar = this.guardar.bind(this);
    this.cancelar = this.cancelar.bind(this);

    this.state = {
      trabajando: true,
      error: false,
      mensaje: '',
      mensajeReplicando: 'Status replicando:',
      noReplicadas: [],
      replicadas: [],
      checkedSinReplicar: {},
      checkedReplicando: {},
    };

    requests.get()
      .then((res) => {
        this.setState({
          trabajando: false,
          error: res.error,
          mensaje: res.mensaje,
          noReplicadas: res.tablas,
          replicadas: [],
        });
      });
  }

  checkearSinReplicar(event) {
    const { checkedSinReplicar } = this.state;
    checkedSinReplicar[event.target.id] = event.target.checked;
    this.setState({ checkedSinReplicar });
  }

  checkearReplicando(event) {
    const { checkedReplicando } = this.state;
    checkedReplicando[event.target.id] = event.target.checked;
    this.setState({ checkedReplicando });
  }

  replicar() {
    const { noReplicadas, replicadas, checkedSinReplicar } = this.state;

    let checkedSinReplicarRes = Object.assign({}, checkedSinReplicar);
    let noReplicadasRes = noReplicadas.slice();
    let replicadasRes = replicadas.slice();

    for (const key in checkedSinReplicar) {
      if (checkedSinReplicar[key] === true) {
        noReplicadasRes = noReplicadasRes.filter(e => e !== key);
        replicadasRes.push(key);
        checkedSinReplicarRes[key] = false;
      }
    }

    this.setState({
      noReplicadas: noReplicadasRes,
      replicadas: replicadasRes,
      checkedSinReplicar: checkedSinReplicarRes,
    });
  }

  noReplicar() {
    const { noReplicadas, replicadas, checkedReplicando } = this.state;

    let checkedReplicandoRes = Object.assign({}, checkedReplicando);
    let noReplicadasRes = noReplicadas.slice();
    let replicadasRes = replicadas.slice();

    for (const key in checkedReplicando) {
      if (checkedReplicando[key] === true) {
        replicadasRes = replicadasRes.filter(e => e !== key);
        noReplicadasRes.push(key);
        checkedReplicandoRes[key] = false;
      }
    }

    this.setState({
      noReplicadas: noReplicadasRes,
      replicadas: replicadasRes,
      checkedReplicando: checkedReplicandoRes,
    });
  }

  guardar() {
    const { replicadas } = this.state;
    requests.guardar(replicadas)
      .then((res) => {
        this.setState({ mensajeReplicando: res.mensaje });
      }).catch(() => {});
  }

  cancelar() {
    const { noReplicadas, replicadas } = this.state;

    requests.cancelar()
      .then((res) => {
        this.setState({
          mensajeReplicando: res.mensaje,
          noReplicadas: noReplicadas.concat(replicadas),
          replicadas: [],
          checkedSinReplicar: {},
          checkedReplicando: {},
        });
      }).catch(() => {});
  }

  render() {
    const { trabajando, error, mensaje, mensajeReplicando, replicadas, noReplicadas, checkedReplicando, checkedSinReplicar } = this.state;

    if (trabajando) {
      return (
        <div className="row">
          <div className="col-md-1" />
          <div className="col-md-10">
            <Alert color="primary">Trabajando...</Alert>
          </div>
          <div className="col-md-1" />
        </div>
      );
    }

    if (error) {
      return (
        <div className="row">
          <div className="col-md-1" />
          <div className="col-md-10">
            <Alert color="danger">{mensaje}</Alert>
          </div>
          <div className="col-md-1" />
        </div>
      );
    }

    return (
      <Form>
        <div className="row">
          <div className="col-md-1" />
          <div className="col-md-2">
            <FormGroup>
              <Label for="sinReplicar">Sin Replicar</Label>
              {noReplicadas.map(tabla => (
                <CustomInput
                  type="checkbox"
                  key={tabla}
                  id={tabla}
                  label={tabla}
                  onChange={this.checkearSinReplicar}
                  value={checkedSinReplicar[tabla]}
                />
              ))}
            </FormGroup>
          </div>
          <div className="col-md-2" />
          <div className="col-md-2">
            <h1 style={{ color: '#ffffff' }}>Replicando</h1>
            <FormGroup>
              <Button onClick={this.replicar}>{'>>'}</Button>
            </FormGroup>
            <FormGroup>
              <Button onClick={this.noReplicar}>{'<<'}</Button>
            </FormGroup>
          </div>
          <div className="col-md-2" />
          <div className="col-md-2">
            <FormGroup>
              <Label for="replicando">Replicando</Label>
              {replicadas.map(tabla => (
                <CustomInput
                  type="checkbox"
                  key={tabla}
                  id={tabla}
                  label={tabla}
                  onChange={this.checkearReplicando}
                  value={checkedReplicando[tabla]}
                />
              ))}
            </FormGroup>
          </div>
          <div className="col-md-1" />
        </div>
        <div className="row">
          <div className="col-md-1" />
          <div className="col-md-10">
            <Alert color="primary">{mensajeReplicando}</Alert>
          </div>
          <div className="col-md-1" />
        </div>
        <div className="row">
          <div className="col-md-4" />
          <div className="col-md-1">
            <FormGroup>
              <Button onClick={this.guardar}>Guardar</Button>
            </FormGroup>
          </div>
          <div className="col-md-1" />
          <div className="col-md-1">
            <FormGroup>
              <Button onClick={this.cancelar}>Cancelar</Button>
            </FormGroup>
          </div>
          <div className="col-md-5" />
        </div>
      </Form>
    );
  }
}

export default Replicacion;
