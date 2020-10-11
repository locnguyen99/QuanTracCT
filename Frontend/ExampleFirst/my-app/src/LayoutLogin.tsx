import { Layout } from 'antd';
import React from 'react';
import { Link } from 'react-router-dom';


export class LayoutLogin extends React.Component {
    render() {
        return (
            <Layout>
                {this.props.children}
                <Link to="/Login">login</Link>

                <h1>fjawfhuawfh</h1>

            </Layout>
        );
    }
}