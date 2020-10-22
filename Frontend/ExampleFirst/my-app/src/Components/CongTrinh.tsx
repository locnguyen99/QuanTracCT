import React from 'react';

import { Link } from 'react-router-dom';
import { Button } from 'antd';


export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

export default class CongTrinh extends React.Component {
    render() {
        return (
            <div>
                CONG TRINH
                <table>
                    <tr>
                        <th>Ma CT</th>
                        <th>Ten CT</th>
                        <th>Dia Chi</th>
                        <th></th>
                    </tr>
                    {
                        ListCT.map((ct: CongTrinhProps) => {
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
    { TenCT: 'AAA', MaCT: '3A', DiaChi: 'KG' },
    { TenCT: 'BBB', MaCT: '3b', DiaChi: 'TP' },
    { TenCT: 'CCC', MaCT: '3C', DiaChi: 'TB' }
]

