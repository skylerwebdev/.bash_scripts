#/bin/bash

touch configs/AppRouter.jsx configs/PrivateRoute.jsx pages/user/Home.jsx pages/user/Contact.jsx pages/user/About.jsx pages/user/Tos.jsx pages/user/PrivPol.jsx components/reuse/Navbar.jsx components/pages/Header.jsx components/pages/Footer.jsx
<< EOF > configs/AppRouter.jsx
import React from "react";
import { Switch as S, Route as R } from "react-router-dom";
import Home from "../pages/user/Home";
import About from "../pages/user/About";
import Freelance from "../pages/user/Freelance";
import Tos from "../pages/user/Tos";
import PrivPol from "../pages/user/PrivPol";

import Contact from "../pages/user/Contact";

const AppRouter = () => {
  return (
    <S>
      <R exact path="/" component={Home} />
      <R path="/portfolio" component={About} />
      <R path="/freelance" component={Freelance} />
      <R path='/contact' component={Contact} />
      <R path="/tos" component={Tos} />
      <R path="/privpol" component={PrivPol} />

    </S>
  );
};

export default AppRouter;
EOF
<< EOF > configs/PrivateRoute.jsx

import React from 'react';
import { Route, Redirect } from 'react-router-dom';

const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route
    {...rest}
    render={props =>

      localStorage.getItem("token") ?

      (
        <Component {...props} />

      )
      :
      (
        <Redirect to="/login" />
      )
    }
  />
);

export default PrivateRoute;
EOF
<< EOF > pages/user/Home.jsx
import React from 'react'

const Home = () => {
    return (
        <div>
            <h1>Home Works</h1>
        </div>
    )
}

export default Home
EOF
<< EOF > pages/user/About.jsx
import React from 'react'

const About = () => {
    return (
        <div>
            <h1>About Works</h1>
        </div>
    )
}

export default About
EOF

<< EOF > pages/user/Contact.jsx
import React from 'react'

const Contact = () => {
    return (
        <div>
            <h1>Contact Works</h1>
        </div>
    )
}

export default Contact
EOF

<< EOF > pages/user/Tos.jsx
import React from 'react'

const Tos = () => {
    return (
        <div>
            <h1>Tos Works</h1>
        </div>
    )
}

export default Tos
EOF
<< EOF > pages/user/PrivPol.jsx
import React from 'react'

const PrivPol = () => {
    return (
        <div>
            <h1>PrivPol Works</h1>
        </div>
    )
}

export default PrivPol
EOF



<< EOF > components/reuse/Navbar.jsx
import React, { useState, useEffect } from "react";
import { NavLink as NL } from "react-router-dom";
import "../../styles/Nav.css";
import swd from '../../sources/images/swd.png'
const NavBar = () => {
  const width = window.innerWidth;
  const [open, setOpen] = useState(false)
  const showNav = () => {
    if (open === true) {
      setOpen(false);
    } if (open === false) {
      setOpen(true);
    }
  };

  return (
    <div className={open && width < 768 ? "mnNav full" : "mnNav"}>
      <div className="navLt">
          <span className='open' onClick={showNav}>
            <img src={swd} alt="logo" className="logoImg"/>
          </span>
      </div>
        <div className={!open || width > 768 ? "navCt hidden" : "navCt"}></div>
        <div className={!open ||  width > 768 ? "navRt hidden" : "navRt"}>
      <NL className="link nl" exact to="/">
        Home
      </NL>
      <NL className="link nl" to="/portfolio">
        Portfolio
      </NL>
      <NL className="link nl" to='/freelance'>Freelance</NL>
      <NL className="link nl" to='/contact'>Contact</NL>
      </div>
    </div>
  );
};

export default NavBar;
EOF
<< EOF > components/pages/Header.jsx
import React from 'react'
import NavBar from '../reuseable/NavBar'

const Header = () => {
    return (
        <div>
            <NavBar />
        </div>
    )
}

export default Header
EOF
<< EOF > components/pages/Footer.jsx
import React from 'react'
import { Link as L } from 'react-router-dom'
const Footer = () => {
    return (
        <div className='mnFtr'>
            <p>&copy; 2020 SkylerWebDev |{" "}
            <L to='/tos'>Terms Of Service</L>{" | "}
            <L to='privpol'>Privacy Policy</L> {" | "}
            <L to='/shoutouts'>Sponsors/Credits</L>
            </p>
        </div>
    )
}
export default Footer

EOF

<< EOF > components/pages/App.js

import React from 'react';
import './App.css';
import Header from './components/pages/Header';
import Footer from './components/pages/Footer';
import AppRouter from './configs/AppRouter';

function App() {
  return (
    <div className="App">
      <Header />
      <AppRouter />
      <Footer />

    </div>
  );
}

export default App;

EOF
<< EOF > Index.js

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import { BrowserRouter as BR } from 'react-router-dom'
ReactDOM.render(
<BR><App /></BR>, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

EOF