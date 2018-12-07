import React from 'react';
import { Button, Form, FormGroup, Label, Input } from 'reactstrap';

class Conexiones extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;

    this.state = {
      nombreInstanciaOrigen: '',
      nombreBaseDatosOrigen: '',
      puertoOrigen: '',
      nombreUsuarioOrigen:'',
      passOrigen:'',
      nombreInstanciaDestino: '',
      nombreBaseDatosDestino: '',
      puertoDestino: '',
      nombreUsuarioDestino:'',
      passDestino:'',
    };
  }

  render() {
    const { nombreInstanciaOrigen, nombreBaseDatosOrigen, puertoOrigen, nombreUsuarioOrigen, passOrigen, nombreInstanciaDestino, nombreBaseDatosDestino, puertoDestino, nombreUsuarioDestino, passDestino } = this.state;

    return (
      <Form>
        <div className="row">
          <div className="col-md-2" />
          <div className="col-md-3">
            <h1>Base de Datos Origen</h1>
            <FormGroup>
              <Label for="nombreInstanciaOrigen">Nombre Instancia</Label>
              <Input
                value={nombreInstanciaOrigen}
                onChange={event => this.setState({ nombreInstanciaOrigen: event.target.value })}
                name="nombre-instanciaOrigen"
                id="nombreInstanciaOrigen"
                // placeholder="Instancia Origen"
              />
              <Label for="nombreBaseDatosOrigen">Nombre Base de Datos</Label>
              <Input
                value={nombreBaseDatosOrigen}
                onChange={event => this.setState({ nombreBaseDatosOrigen: event.target.value })}
                name="nombre-baseOrigen"
                id="nombreBaseDatosOrigen"
                // placeholder="Proyecto 2"
              />
              <Label for="puertoOrigen">Puerto</Label>
              <Input
                value={puertoOrigen}
                onChange={event => this.setState({ puertoOrigen: event.target.value })}
                name="vpuertoOrigen"
                id="puertoOrigen"
                // placeholder="0808"
              />
              <Label for="nombreUsuarioOrigen">Nombre Usuario</Label>
              <Input
                value={nombreUsuarioOrigen}
                onChange={event => this.setState({ nombreUsuarioOrigen: event.target.value })}
                name="nombre-usuarioOrigen"
                id="nombreUsuarioOrigen"
                //  placeholder="Crysapa"
              />
              <Label for="passOrigen">Password</Label>
              <Input
                type="password"
                value={passOrigen}
                onChange={event => this.setState({ passOrigen: event.target.value })}
                name="passwordOrigen"
                id="passOrigen"
                // placeholder="123"
              />
            </FormGroup>
            <Button>Probar</Button>
          </div>
          <div className="col-md-2" />
          <div className="col-md-3">
            <h1>Base de Datos Destino</h1>
              <FormGroup>
                <Label for="nombreInstanciaDestino">Nombre Instancia</Label>
                <Input
                  value={nombreInstanciaDestino}
                  onChange={event => this.setState({ nombreInstanciaDestino: event.target.value })}
                  name="nombre-instanciaDestino"
                  id="nombreInstanciaDestino"
                  // placeholder="Instancia Destino"
                />
                <Label for="nombreBaseDatosDestino">Nombre Base de Datos</Label>
                <Input
                  value={nombreBaseDatosDestino}
                  onChange={event => this.setState({ nombreBaseDatosDestino: event.target.value })}
                  name="nombre-baseDestino"
                  id="nombreBaseDatosDestino"
                  // placeholder="Proyecto 2"
                />
                <Label for="puertoDestino">Puerto</Label>
                <Input
                  value={puertoDestino}
                  onChange={event => this.setState({ puertoDestino: event.target.value })}
                  name="vpuertoDestino"
                  id="puertoDestino"
                  // placeholder="0808"
                />
                <Label for="nombreUsuarioDestino">Nombre Usuario</Label>
                <Input
                  value={nombreUsuarioDestino}
                  onChange={event => this.setState({ nombreUsuarioDestino: event.target.value })}
                  name="nombre-usuarioDestino"
                  id="nombreUsuarioDestino"
                  //  placeholder="Crysapa"
                />
                <Label for="passDestino">Password</Label>
                <Input
                  value={passDestino}
                  onChange={event => this.setState({ passDestino: event.target.value })}
                  type="password"
                  name="passwordDestino"
                  id="passDestino"
                  // placeholder="123"
                />
              </FormGroup>
            <Button>Probar</Button>
          </div>
          <div className="col-md-2" />
        </div>
        <FormGroup style={{ display: 'flex', justifyContent: 'center' }}>
          <Button>Guardar</Button>
        </FormGroup>
      </Form>
    );
  }
}

export default Conexiones;
