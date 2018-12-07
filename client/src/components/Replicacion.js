import React from 'react';
import { Button, CustomInput, Form, FormGroup, Label } from 'reactstrap';

class Replicacion extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;

    this.replicar = this.replicar.bind(this);
    this.noReplicar = this.noReplicar.bind(this);
    this.checkearSinReplicar = this.checkearSinReplicar.bind(this);
    this.checkearReplicando = this.checkearReplicando.bind(this);

    this.state = {
      noReplicadas: ['tbl_empleados', 'tbl_alumnos', 'tbl_secciones'],
      replicadas: ['tbl_aulas'],
      checkedSinReplicar: {},
      checkedReplicando: {},
    };
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

  render() {
    const { replicadas, noReplicadas, checkedReplicando, checkedSinReplicar } = this.state;

    return (
      <Form>
        {/* <h1 style={{ display: 'flex', justifyContent: 'center' }}>Replicacion</h1> */}
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
          <div className="col-md-4" />
          <div className="col-md-1">
            <FormGroup>
              <Button>Guardar</Button>
            </FormGroup>
          </div>
          <div className="col-md-1" />
          <div className="col-md-1">
            <FormGroup>
              <Button>Cancelar</Button>
            </FormGroup>
          </div>
          <div className="col-md-5" />
        </div>
      </Form>
    );
  }
}

export default Replicacion;