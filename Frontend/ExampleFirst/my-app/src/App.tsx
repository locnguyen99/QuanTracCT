import React from 'react';
import './App.css';
import 'antd/dist/antd.css';

import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import AppLayout from './AppLayout';
import ChiTietCongTrinh from './Components/ChiTietCongTrinh';
import CongTrinh, { EditableTable } from './Components/CongTrinh';
import Home from './Components/Home';
import { LayoutLogin } from './LayoutLogin';
import { Login } from './Login';

function App() {
  return (
    <Router>
      <Switch>
        <Route>
          <AppLayout>
            <Route path="/" exact component={Home} />
            <Route path="/cong-trinh" exact component={CongTrinh} />
            <Route path="/cong-trinh/:MaCT" component={ChiTietCongTrinh} />
            <Route path="/cong-trinh" exact component={EditableTable} />
          </AppLayout>
          <LayoutLogin>
            <Route path="/Login" exact component={Login} />
          </LayoutLogin>
        </Route>
      </Switch>
    </Router>
  );
}
export default App;
//setInterval(App, 1000); goi ham or biểu thức chạy trong số giây quy định, sau đó dừng tiến trình khi hết giờ
