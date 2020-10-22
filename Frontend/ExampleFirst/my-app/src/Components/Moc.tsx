import React from 'react';


export default class Moc extends React.Component<{
    MaMoc:string
    TenMoc:string
    TenCK:string
    ListMoc:any[]
}>{
    render(){
        return(
            <div>
                <div>{this.props.MaMoc}</div>
                <div>{this.props.TenMoc}</div>
                <div>{this.props.TenCK}</div>
                <div>{this.props.ListMoc}</div>
            </div>
        )
    }
}
const ListMoc=[
    
    {MaMoc:"4242",TenMoc:"jkfwaj"},
    {MaMoc:"24242",TenMoc:"fajkfwaj"}
]