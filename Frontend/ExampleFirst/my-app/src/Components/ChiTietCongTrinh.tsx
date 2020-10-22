import React from 'react';

import { CongTrinhProps, ListCT } from './CongTrinh';



type IState = {
    CongTrinh?: CongTrinhProps,

}
export default class ChiTietCongTrinh extends React.Component<{
    match: any
}>{
    state: IState = {
    }
    componentDidMount() {
        const { MaCT } = this.props.match.params  //select MACT

        const chiTietCT = ListCT.find(c => c.MaCT == MaCT)

        this.setState({ CongTrinh: chiTietCT })
    }
    render() {
        return (
            <div>
                <div>Ma CT: {this.state.CongTrinh?.MaCT}</div>
                <div>Ten CT: {this.state.CongTrinh?.TenCT}</div>
                <div>DC CT: {this.state.CongTrinh?.DiaChi}</div>
            </div>
        );
    }
}