import React from 'react';
import './App.css';
import 'antd/dist/antd.css';

import { BrowserRouter as Router, Route } from "react-router-dom";
import AppLayout from './AppLayout';
import ChiTietCongTrinh from './Components/ChiTietCongTrinh';
import CongTrinh, { EditableCellProps } from './Components/CongTrinh';
import Home from './Components/Home';

function App() {
  return (
    <Router>
      <AppLayout>
        <Route path="/" exact component={Home} />
        <Route path="/cong-trinh" exact component={CongTrinh} />
        <Route path="/cong-trinh/:MaCT" component={ChiTietCongTrinh} />
      </AppLayout>
    </Router>
  );
}
export default App;
//setInterval(App, 1000); goi ham or biểu thức chạy trong số giây quy định, sau đó dừng tiến trình khi hết giờ
