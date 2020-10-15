import React from 'react';
import './App.css';
import 'antd/dist/antd.css';

import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import AppLayout from './AppLayout';
import ChiTietCongTrinh from './Components/ChiTietCongTrinh';
import CongTrinh from './Components/CongTrinh';
import Home from './Components/Home';
import { LayoutLogin } from './LayoutLogin';
import { Login } from './Login';
import { EditableTable } from './Components/EditableTable';

function App() {
  return (
    <Router>
      <Switch>
        <Route exact path="/Login">
          <LayoutLogin>
            <Route component={Login} />
          </LayoutLogin>
        </Route>
        <Route  >
          <AppLayout>
            <Route exact path="/" component={Home} />
            <Route path="/cong-trinh" exact  component={CongTrinh} />
            <Route path="/edit-cong-trinh" exact  component={EditableTable} />
            <Route path="/cong-trinh/:MaCT" exact  component={ChiTietCongTrinh} />
          </AppLayout>
        </Route>
      </Switch>
    </Router>
  );
}
export default App;
//setInterval(App, 1000); goi ham or biểu thức chạy trong số giây quy định, sau đó dừng tiến trình khi hết giờ
