#/bin/bash

# read -r -p "Are you sure you want to continue? Doing this will Overwrite Files and Could Potentially Destroy Your App(Y/N)" cont
# read -r -p "Are you in the \"src\" directory? (Y/N)" src
echo What would you like to name your app?

read appname

if [ -d "$appname" ]; then
    echo "$appname exists"
else
    npx create-react-app "$appname"
fi

cd "$appname"

npm i react-router react-router-dom

cd src
mkdir -p configs pages/user pages/admin styles components/pages components/reuse sources/images sources/raw_images sources/layouts
touch configs/AppRouter.jsx configs/PrivateRoute.jsx pages/user/Home.jsx pages/user/Contact.jsx pages/user/About.jsx pages/user/Tos.jsx pages/user/PrivPol.jsx components/reuse/NavBar.jsx components/pages/Header.jsx components/pages/Footer.jsx styles/Nav.css styles/Pages.css

echo "
import React from 'react';
import { Switch as S, Route as R } from 'react-router-dom';
import Home from '../pages/user/Home';
import About from '../pages/user/About';
import Tos from '../pages/user/Tos';
import PrivPol from '../pages/user/PrivPol';

import Contact from '../pages/user/Contact';

const AppRouter = () => {
  return (
    <S>
      <R exact path='/' component={Home} />
      <R path='/about' component={About} />
      <R path='/contact' component={Contact} />
      <R path='/tos' component={Tos} />
      <R path='/privpol' component={PrivPol} />
portfolio
    </S>
  );
};
export default AppRouter;
" >  configs/AppRouter.jsx

echo " 
import React from 'react';
import { Route, Redirect } from 'react-router-dom';

const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route
    {...rest}
    render={props =>

      localStorage.getItem('token') ?

      (
        <Component {...props} />

      )
      :
      (
        <Redirect to='/login' />
      )
    }
  />
);

export default PrivateRoute;
" > configs/PrivateRoute.jsx

echo " 
import React from 'react'

const Home = () => {
    return (
        <div>
            <h1>Home Works</h1>
        </div>
    )
}

export default Home
" > pages/user/Home.jsx


echo " 
import React from 'react'

const About = () => {
    return (
        <div>
            <h1>About Works</h1>
        </div>
    )
}

export default About
" > pages/user/About.jsx

echo " 
import React from 'react'

const Contact = () => {
    return (
        <div>
            <h1>Contact Works</h1>
        </div>
    )
}

export default Contact
" > pages/user/Contact.jsx

echo " 
import React from 'react'

const Tos = () => {
    return (
        <div>
            <h1>Tos Works</h1>
        </div>
    )
}

export default Tos
" > pages/user/Tos.jsx
echo "
import React from 'react'

const PrivPol = () => {
    return (
        <div>
            <h1>PrivPol Works</h1>
        </div>
    )
}

export default PrivPol
" > pages/user/PrivPol.jsx 



echo " 
import React, { useState, useEffect } from 'react';
import { NavLink as NL } from 'react-router-dom';
import '../../styles/Nav.css';
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
    <div className={open && width < 768 ? 'mnNav full' : 'mnNav'}>
      <div className='navLt'>
          <span className='open' onClick={showNav}>
          </span>
      </div>
        <div className={!open || width > 768 ? 'navCt hidden' : 'navCt'}></div>
        <div className={!open ||  width > 768 ? 'navRt hidden' : 'navRt'}>
      <NL className='link nl' exact to='/'>
        Home
      </NL>
      <NL className='link nl' to='/about'>
        About
      </NL>
      <NL className='link nl' to='/contact'>Contact</NL>
      </div>
    </div>
  );
};

export default NavBar;
" > components/reuse/NavBar.jsx
echo " 
import React from 'react'
import NavBar from '../reuse/NavBar'

const Header = () => {
    return (
        <div>
            <NavBar />
        </div>
    )
}

export default Header
" > components/pages/Header.jsx
echo " 
import React from 'react'
import { Link as L } from 'react-router-dom'
const Footer = () => {
    return (
        <div className='mnFtr'>
           <p>Created with SkylerWebDev Shell Script.</p>
        </div>
    )
}
export default Footer

" > components/pages/Footer.jsx

echo " 

import React from 'react';
import './App.css';
import Header from './components/pages/Header';
import Footer from './components/pages/Footer';
import AppRouter from './configs/AppRouter';

function App() {
  return (
    <div className='App'>
      <Header />
      <AppRouter />
      <Footer />

    </div>
  );
}

export default App;
" > App.js

echo "
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import { BrowserRouter as BR } from 'react-router-dom'
ReactDOM.render(
<BR>
<App />
</BR>
, document.getElementById('root'));

serviceWorker.unregister();


" > index.js

echo " 
import React from 'react'

const PrivPol = () => {
    return (
        <div>
            <h1>PrivPol Works</h1>
        </div>
    )
}

export default PrivPol
" > pages/user/PrivPol.jsx
cd ../
npm start
