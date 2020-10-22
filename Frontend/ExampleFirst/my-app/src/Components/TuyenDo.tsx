import React from 'react';


export default class TuyenDo extends React.Component<{
    TenTD:string
    MaTD:string
    TenCK:string
    ListTD:any[]
}>{
    render(){
        return(
            <div>
                <div>{this.props.TenTD}</div>
                <div>{this.props.MaTD}</div>
                <div>{this.props.TenCK}</div>
                <div>{this.props.ListTD}</div>
            </div>
        )
    }
}

const ListTD=[
    {TenTD:"jfkajf",MaTD:"2425"},
    {TenTD:"jfkajfff",MaTD:"2f2425"}
]