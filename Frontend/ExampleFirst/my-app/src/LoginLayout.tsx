import React from 'react';
import { Layout } from 'antd';
import picture from './picture.jpg';
import './LoginLayout.css'


export class LoginLayout extends React.Component {
    render() {
        return (
            <div>
                <div className='root' >
                    <div className='form'>
                        <Layout >
                            {this.props.children}
                        </Layout>
                    </div>
                    <img src={picture} className="img" />
                </div>
            </div>
        );
    }
}