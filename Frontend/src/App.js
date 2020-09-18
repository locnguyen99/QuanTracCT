import React from 'react';
import logo from './logo.svg';
import {Layout, Button} from 'antd';
import './App.css';
const {Header}=Layout;
 

function App() {
  return (
    <div className="container">
      <Layout>
        <Header className='header'>
          <h1>Wellcome Ant!</h1>
          <button type="button" class="btn btn-primary" >Primary</button>
        </Header>
      </Layout>
      <div className="jumbotron">
        <h1>Wellcome Bootstrap
          <p>Chuc ban may man lan sau ...........1 </p>
        </h1>
        <button>Click here</button>
      </div>
    </div>
  );
}


export default App;
