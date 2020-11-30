import React from 'react';
import './App.scss';
import { Layout, Breadcrumb, Button } from 'antd';
import AppMenu from './AppMenu';
import AddCircleIcon from '@material-ui/icons/AddCircle';
import './styles.less';


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
            
                <div className='sider'>
                    <div className='hea'>
                        <div className='butPG'>
                            <Button ></Button>
                        </div>
                        <div className='PG'>
                            <b><i>PG</i></b>
                        </div>
                        <div className='SU'>
                            <b><i>Survey</i></b>
                        </div>
                    </div>
                    <div className='added'>
                        <div>
                            <Button ><AddCircleIcon /></Button>
                        </div>
                        <div className='create'>
                            Tạo mới
                        </div>
                    </div>
                    <div>
                        <AppMenu />
                    </div>
                    <div className='foo'>
                        <footer>wjfkwjfkjwfjwfw</footer>
                    </div>
                </div>
                {/* <div>
                    <div>
                        <h1>header</h1>
                    </div>
                    <div>
                        <Layout>
                            <div className='vuong'>
                            </div>
                            <div>
                                <div>
                                    <Layout>
                                        <Content>
                                            <Breadcrumb>
                                                <Breadcrumb.Item>User</Breadcrumb.Item>
                                                <Breadcrumb.Item>Bill</Breadcrumb.Item>
                                            </Breadcrumb>
                                        </Content>
                                    </Layout>
                                </div>
                                <div className='ND'>
                                    {this.props.children}
                                </div>
                            </div>
                        </Layout>
                    </div>
                    <div>
                        <h2>footer</h2>
                    </div>
                </div> */}
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

