import React from 'react';
import { Button, Form, FormGroup, Label, Input, Alert } from 'reactstrap';
import requests from './requests/conexiones';

class Conexiones extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;

    this.pruebaOrigen = this.pruebaOrigen.bind(this);
    this.pruebaDestino = this.pruebaDestino.bind(this);

    this.state = {
      nombreInstanciaOrigen: 'LAPTOP-U87EPQIM',
      nombreBaseDatosOrigen: 'Northwind',
      puertoOrigen: '1433',
      nombreUsuarioOrigen: 'sa',
      passOrigen: 'password',
      alertOrigen: { mostrar: false, error: false, mensaje: '' },
      nombreInstanciaDestino: 'localhost',
      nombreBaseDatosDestino: 'db_northwind',
      puertoDestino: '3306',
      nombreUsuarioDestino: 'root',
      passDestino: 'password',
      alertDestino: { mostrar: false, error: false, mensaje: '' },
    };
  }

  pruebaOrigen() {
    const {
      nombreInstanciaOrigen, puertoOrigen, nombreBaseDatosOrigen, nombreUsuarioOrigen, passOrigen,
    } = this.state;

    const config = {
      server: nombreInstanciaOrigen,
      port: Number(puertoOrigen),
      database: nombreBaseDatosOrigen,
      user: nombreUsuarioOrigen,
      password: passOrigen,
    };

    requests.putOrigen(config)
      .then((res) => {
        const alertOrigen = {
          mostrar: true,
          error: res.error,
          mensaje: res.mensaje,
        };
        this.setState({ alertOrigen });
      }).catch(() => {
      });
  }

  pruebaDestino() {
    const {
      nombreInstanciaDestino, puertoDestino, nombreBaseDatosDestino, nombreUsuarioDestino, passDestino,
    } = this.state;

    const config = {
      host: nombreInstanciaDestino,
      port: puertoDestino,
      database: nombreBaseDatosDestino,
      user: nombreUsuarioDestino,
      password: passDestino,
    };

    requests.putDestino(config)
      .then((res) => {
        const alertDestino = {
          mostrar: true,
          error: res.error,
          mensaje: res.mensaje,
        };
        this.setState({ alertDestino });
      }).catch(() => {
      });
  }

  render() {
    const {
      nombreInstanciaOrigen, nombreBaseDatosOrigen, puertoOrigen, nombreUsuarioOrigen, passOrigen, nombreInstanciaDestino, nombreBaseDatosDestino, puertoDestino, nombreUsuarioDestino, passDestino, alertDestino, alertOrigen,
    } = this.state;

    return (
      <Form>
        <div className="row">
          <div className="col-md-2" />
          <div className="col-md-3">
            <h1>BD Origen</h1>
            <FormGroup>
              <Label for="nombreInstanciaOrigen">Nombre Instancia</Label>
              <Input
                value={nombreInstanciaOrigen}
                onChange={event => this.setState({ nombreInstanciaOrigen: event.target.value })}
                name="nombre-instanciaOrigen"
                id="nombreInstanciaOrigen"
              />
              <Label for="nombreBaseDatosOrigen">Nombre Base de Datos</Label>
              <Input
                value={nombreBaseDatosOrigen}
                onChange={event => this.setState({ nombreBaseDatosOrigen: event.target.value })}
                name="nombre-baseOrigen"
                id="nombreBaseDatosOrigen"
              />
              <Label for="puertoOrigen">Puerto</Label>
              <Input
                value={puertoOrigen}
                onChange={event => this.setState({ puertoOrigen: event.target.value })}
                name="vpuertoOrigen"
                id="puertoOrigen"
              />
              <Label for="nombreUsuarioOrigen">Nombre Usuario</Label>
              <Input
                value={nombreUsuarioOrigen}
                onChange={event => this.setState({ nombreUsuarioOrigen: event.target.value })}
                name="nombre-usuarioOrigen"
                id="nombreUsuarioOrigen"
              />
              <Label for="passOrigen">Password</Label>
              <Input
                type="password"
                value={passOrigen}
                onChange={event => this.setState({ passOrigen: event.target.value })}
                name="passwordOrigen"
                id="passOrigen"
              />
            </FormGroup>
            {!alertOrigen.mostrar ? (<div />) : (
              <Alert color={alertOrigen.error ? 'danger' : 'success'}>
                {alertOrigen.mensaje}
              </Alert>
            )}
            <Button onClick={this.pruebaOrigen}>Probar</Button>
          </div>
          <div className="col-md-2" />
          <div className="col-md-3">
            <h1>BD Destino</h1>
              <FormGroup>
                <Label for="nombreInstanciaDestino">Nombre Instancia</Label>
                <Input
                  value={nombreInstanciaDestino}
                  onChange={event => this.setState({ nombreInstanciaDestino: event.target.value })}
                  name="nombre-instanciaDestino"
                  id="nombreInstanciaDestino"
                />
                <Label for="nombreBaseDatosDestino">Nombre Base de Datos</Label>
                <Input
                  value={nombreBaseDatosDestino}
                  onChange={event => this.setState({ nombreBaseDatosDestino: event.target.value })}
                  name="nombre-baseDestino"
                  id="nombreBaseDatosDestino"
                />
                <Label for="puertoDestino">Puerto</Label>
                <Input
                  value={puertoDestino}
                  onChange={event => this.setState({ puertoDestino: event.target.value })}
                  name="vpuertoDestino"
                  id="puertoDestino"
                />
                <Label for="nombreUsuarioDestino">Nombre Usuario</Label>
                <Input
                  value={nombreUsuarioDestino}
                  onChange={event => this.setState({ nombreUsuarioDestino: event.target.value })}
                  name="nombre-usuarioDestino"
                  id="nombreUsuarioDestino"
                />
                <Label for="passDestino">Password</Label>
                <Input
                  value={passDestino}
                  onChange={event => this.setState({ passDestino: event.target.value })}
                  type="password"
                  name="passwordDestino"
                  id="passDestino"
                />
            </FormGroup>
            {!alertDestino.mostrar ? (<div />) : (
              <Alert color={alertDestino.error ? 'danger' : 'success'}>
                {alertDestino.mensaje}
              </Alert>
            )}
            <Button onClick={this.pruebaDestino}>Probar</Button>
          </div>
          <div className="col-md-2" />
        </div>
      </Form>
    );
  }
}

export default Conexiones;
