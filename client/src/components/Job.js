import React from 'react';
import { Button, Alert } from 'reactstrap';
import reqRepl from './requests/replicacion';
import requests from './requests/job';

class Job extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;

    this.handleJob = this.handleJob.bind(this);

    this.state = {
      trabajando: true,
      error: false,
      mensaje: '',
      tablas: [],
    };

    reqRepl.get()
      .then((res) => {
        this.setState({
          trabajando: false,
          error: res.error,
          mensaje: `${res.mensaje}`,
          tablas: res.replicadas,
        });
      }).catch(() => {});
  }

  handleJob() {
    requests.put()
      .then((res) => {
        console.log(res);
      }).catch(() => {});
  }

  render() {
    const { trabajando, error, mensaje, tablas, } = this.state;

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
      <div>
        <div className="row">
          <div className="col-md-1" />
          <div className="col-md-10">
            <Alert color="primary">
              {`Tablas que se estan replicando: ${tablas.join(', ')}`}
            </Alert>
          </div>
          <div className="col-md-1" />
        </div>
        <div className="text-center">
          <Button onClick={this.handleJob}>Job</Button>
        </div>
      </div>
    );
  }
}

export default Job;
