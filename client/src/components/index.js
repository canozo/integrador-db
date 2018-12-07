import React from 'react';
import Home from './Home';
import Conexiones from './Conexiones';
import Replicacion from './Replicacion';
import {
  Navbar,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
} from 'reactstrap';
import {
  Route,
  Link,
  Switch,
} from 'react-router-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <Navbar color="light" light expand="md">
          <Link to="/">
            <NavbarBrand>Proyecto II</NavbarBrand>
          </Link>
          <Nav className="ml-auto" navbar>
            <NavItem>
              <Link to="/conexiones">
                <NavLink>Conexiones</NavLink>
              </Link>
            </NavItem>
            <NavItem>
              <Link to="/replicacion">
                <NavLink>Replicacion</NavLink>
              </Link>
            </NavItem>
          </Nav>
        </Navbar>
        <Switch>
          <Route path="/" exact component={Home} />
          <Route path="/conexiones" exact component={Conexiones} />
          <Route path="/replicacion" exact component={Replicacion} />
          <Route render={() => <h1>Pagina no encontrada!</h1>} />
        </Switch>
      </div>
    );
  }
}

export default App;
