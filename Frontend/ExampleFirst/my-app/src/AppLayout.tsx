import React from 'react';
import './App.scss';
import { Layout, Breadcrumb, Button } from 'antd';
import AddCircleIcon from '@material-ui/icons/AddCircle';
import './styles.less';
import { Menu } from 'antd'
import { Link } from 'react-router-dom'
import DoneOutlineIcon from '@material-ui/icons/DoneOutline';
import DataUsageIcon from '@material-ui/icons/DataUsage';
import PrintIcon from '@material-ui/icons/Print';
import SettingsIcon from '@material-ui/icons/Settings';
import HelpOutlineIcon from '@material-ui/icons/HelpOutline';

export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

const { Header, Content, Footer } = Layout;
const { Sider } = Layout
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
                <div className='my-app'>
                    <div className='left-menu'>
                        <div className='top-left-menu'>
                            <div className='top-logo'>
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
                            <div className='top-button'>
                                <div>
                                    <Button className='but'><AddCircleIcon /></Button>
                                </div>
                                <div className='create'>
                                    Tạo mới
                                </div>
                            </div>
                            <div className='menu'>
                                <Menu >
                                    <Menu.Item >
                                        <div className='aaaa'>
                                            <DataUsageIcon />
                                        </div>
                                        <div className='aaa menu-item'>
                                            <p className='a'>Công trình</p>
                                            <p className='aa'>Công trình & chu kỳ</p>
                                        </div>
                                        <Link to='/' />
                                    </Menu.Item>
                                    <Menu.Item >
                                        <div className='aaaa'>
                                            <DoneOutlineIcon />
                                        </div>
                                        <div className='aaa menu-item'>
                                            <p className='a'>Kết quả quan trắc</p>
                                            <p className='aa'>Kết quả mốc theo từng chu kỳ</p>
                                        </div>
                                        <Link to='/cong-trinh' />
                                    </Menu.Item>
                                    <Menu.Item >
                                        <div className='aaaa'>
                                            <PrintIcon />
                                        </div>
                                        <div className='aaa menu-item'>
                                            <p className='a'>Báo cáo</p>
                                            <p className='aa'>Get insights into the big data</p>
                                        </div>
                                        <Link to='/cong-trinh-chi-tiet' />
                                    </Menu.Item>
                                </Menu>
                            </div>
                        </div>
                        <div className='bottom-left-menu'>
                            <Menu >
                                <Menu.Item >
                                    <div className='aaaa'>
                                        <SettingsIcon />
                                    </div>
                                    <div className='aaa'>
                                        <p className='b'>Cài đặt</p>
                                    </div>
                                </Menu.Item>
                                <Menu.Item >
                                    <div className='aaaa'>
                                        <HelpOutlineIcon />
                                    </div>
                                    <div className='aaa'>
                                        <p className='b'>Hổ trợ & tư vấn</p>
                                    </div>
                                </Menu.Item>
                            </Menu>
                            <div className='footer'>
                                footer
                            </div>
                        </div>
                    </div>
                    <div className='main-content'>
                        <Layout>
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

