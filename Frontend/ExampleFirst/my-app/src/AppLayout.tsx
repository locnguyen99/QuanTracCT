import React from 'react';
import './App.css';
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
                <Layout>
                    <div className='left'>
                        <div className='buttop'>
                            <div>
                                <Button ></Button>
                            </div>
                            <div className='PG'>
                                <b><i>PG</i></b>
                            </div>
                            <div className='SU'>
                                <b><i>Survey</i></b>
                            </div>
                        </div>
                        <div className='tao'>
                            <div>
                                <Button ><AddCircleIcon /></Button>
                            </div>
                            <div className='create'>
                                Tạo mới
                            </div>
                        </div>
                        <div className='sider'>
                            <AppMenu />
                        </div>
                    </div>
                    <div className='hea'>
                        <div>
                            <header>tertettttttttttttt</header>
                        </div>
                    </div>
                    <div className='ND'>
                        <Layout>
                            <Content>
                                <Breadcrumb>
                                    <Breadcrumb.Item>User</Breadcrumb.Item>
                                    <Breadcrumb.Item>Bill</Breadcrumb.Item>
                                </Breadcrumb>
                                {this.props.children}
                            </Content>
                        </Layout>
                    </div>
                    <div  className='foo'>
                        <footer>wjfkwjfkjwfjwfw</footer>
                    </div>
                </Layout>
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

