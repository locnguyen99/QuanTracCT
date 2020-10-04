import React from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import ChiTietCongTrinh from './ChiTietCongTrinh';
import CongTrinh from './CongTrinh';

export function Product({ match }: any) {
    return (
        <div>
            <h2>This is a page for product with ID: {match.params.mack} </h2>
            <h2>
                <a href="https://vnexpress.net/the-thao">vn</a>
            </h2>
        </div>
    );
}


function AppRouter() {
    return (
        <Router>
            <div>
                <nav>
                    <ul>
                        <li>
                            <Link to="/">Home</Link>
                        </li>
                        <li>
                            <Link to="/cong-trinh">Danh Sach CT</Link>
                        </li>
                    </ul>
                </nav>

                <Route path="/" exact component={CongTrinh} />
                <Route path="/cong-trinh" exact component={CongTrinh} />
                <Route path="/cong-trinh/:MaCT" component={ChiTietCongTrinh} />

            </div>
        </Router>
    );
}


const List = [
    { ten: "wjfkj", ho: 'wwfw', tuoi: "324" },
    { ten: "wjfkjuj", ho: 'wwfhw', tuoi: "324d" },
    { ten: "wjfkjtr", ho: 'wwfrtw', tuoi: "3234" }
]

const APP_URL = {
    CONG_TRINH_URL: '/cong-trinh',
    CHI_TIET_CONG_TRINH_URL: '/cong-trinh/:MACT',
  }
  
export default AppRouter;