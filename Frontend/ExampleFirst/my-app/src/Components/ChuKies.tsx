import React from 'react';

export default class ChuKies extends React.Component<{
    TenCK:string
    MaCK:string
    TenCT:string
}>{

    render(){
        return(
            <div>
                <div>{this.props.TenCK}</div>
                <div>{this.props.TenCT}</div>
                <div>{this.props.MaCK}</div>
            </div>
        );
    }
}
const ListCK=[
    {TenCK:"wuif", MaCK:"ef"},
    {TenCK:"wueif", MaCK:"eewf"}
]