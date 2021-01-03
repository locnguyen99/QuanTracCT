import React from 'react';

import { Link } from 'react-router-dom';
import { Button } from 'antd';
import rapidapi from '../api/rapidapi';


export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

interface IState {
    conngTrinhs?: CongTrinhProps[]   //Interface Conogntinrh cho phep null "?"
}

export default class CongTrinh extends React.Component {

    state: IState = {
        conngTrinhs: []                 //state Conogntinrh
    }

    componentDidMount() {  //đây là vòng đời software, Get data qua method state và đồng bộ "then" của phần content
        // rapidapi.getCongTrinhs().then(abc => {
        //     this.setState({ conngTrinhs: abc })
        // })
    }

    _loadCongTrinh = () => {  //Get data qua method state và đồng bộ "then" của phần button (event)
        rapidapi.getCongTrinhs().then(abc => {
            this.setState({ conngTrinhs: abc })
        })
    }

    render() { // Onclick cũng là 1 fucion xử lý cho nút button(event),dưới đây có 4 'th' tương đương phần this.state có 4 'td' mới đc
        return (
            <div> 
                CONG TRINH
                <button onClick={() => {this._loadCongTrinh()}}>GET CT FROM API</button> /=
                <table>
                    <tr>
                        <th>Ma CT</th>
                        <th>Ten CT</th>
                        <th>Dia Chi</th>  
                        <th></th>
                        <th></th>
                    </tr>
                    {
                        this.state.conngTrinhs?.map((ct: CongTrinhProps) => {// map data Congtrinhs
                            return (
                                <tr>
                                    <td>{ct.MaCT}</td>
                                    <td>{ct.TenCT}</td>
                                    <td>{ct.DiaChi}</td>
                                    <td><button onClick={() => { }}>Click</button></td>
                                    <td><Button type="primary"><Link to={'/cong-trinh/' + ct.MaCT}>Chi tiet</Link></Button></td>
                                </tr>
                            )
                        })
                    } 
                </table>
                <div>
                    <h1>co the them link to EditCT o day nhu phan chitiet</h1></div>
                <h2><Button type="primary"><Link to={'/cong-trinh-chi-tiet'}>EditCT</Link></Button></h2>
            </div>

        );
    }
}

export const ListCT = [
    { TenCT: 'AAA', MaCT: '3A', DiaChi: 'KG' },   // giả lập data get xem test nhưng giờ có APIs free ta có thể khỏi cần nó get thèn kia
    { TenCT: 'BBB', MaCT: '3b', DiaChi: 'TP' },
    { TenCT: 'CCC', MaCT: '3C', DiaChi: 'TB' }
]

