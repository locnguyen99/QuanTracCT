import React from 'react';
import { Link } from 'react-router-dom';

export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

export default class CongTrinh extends React.Component {
    render() {
        return (

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
                                <td><Link to={'/cong-trinh/' + ct.MaCT}>Chi tiet</Link></td>
                            </tr>
                        )
                    })
                }

            </table>


        );
    }
}


export const ListCT = [
    { TenCT: 'AAA', MaCT: '3A', DiaChi: 'KG' },
    { TenCT: 'BBB', MaCT: '3b', DiaChi: 'TP' },
    { TenCT: 'CCC', MaCT: '3C', DiaChi: 'TB' }
]