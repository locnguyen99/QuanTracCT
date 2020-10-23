import React from 'react';
import './App.css';

import { Layout, Breadcrumb } from 'antd';
import AppMenu from './AppMenu';

export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

const { Header, Content, Footer } = Layout;

export default class AppLayout extends React.Component {
    state = {
        collapsed: false,
    };
    onCollapse = (collapsed: any) => {
        console.log(collapsed);
        this.setState({ collapsed });
    };
    render() {
        return (
            <div>
                <div>
                </div>
                <div>
                    <Header className="site-layout-background" style={{ padding: 0 }} />
                    <AppMenu />
                </div>
                <div>
                    <Layout style={{ minHeight: '100vh' }}>
                        <Layout className="site-layout">
                            <Content style={{ margin: '0 16px' }}>
                                <Breadcrumb style={{ margin: '16px 0' }}>
                                    <Breadcrumb.Item>User</Breadcrumb.Item>
                                    <Breadcrumb.Item>Bill</Breadcrumb.Item>
                                </Breadcrumb>
                                {this.props.children}
                            </Content>
                            <Footer style={{ textAlign: 'center' }}>Ant Design ©2018 Created by Ant UED</Footer>
                        </Layout>
                    </Layout>
                </div>

            </div>
        );
    }
}

export const ListCT = [
    { TenCT: 'AAA', MaCT: '3A', DiaChi: 'KG' },
    { TenCT: 'BBB', MaCT: '3b', DiaChi: 'TP' },
    { TenCT: 'CCC', MaCT: '3C', DiaChi: 'TB' }
]

const data: any = [];
for (let i = 0; i < 100; i++) {
    data.push({
        key: i,
        name: `Edrward ${i}`,
        age: 32,
        address: `London Park no. ${i}`,
    });
}
