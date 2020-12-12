import React from 'react';

import './App.scss';
import { Menu } from 'antd'
import Theming from './footer';
import { Link } from 'react-router-dom'
import HelpIcon from '@material-ui/icons/Help';
import { ImageAvatars, Tabbut } from './Avatar';
import PrintIcon from '@material-ui/icons/Print';
import { Layout, Breadcrumb, Button } from 'antd';
import { AppstoreFilled } from '@ant-design/icons';
import SettingsIcon from '@material-ui/icons/Settings';
import DataUsageIcon from '@material-ui/icons/DataUsage';
import AddCircleIcon from '@material-ui/icons/AddCircle';
import DoneOutlineIcon from '@material-ui/icons/DoneOutline';
import HelpOutlineIcon from '@material-ui/icons/HelpOutline';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import CustomizedSelects, { TablePaginationDemo } from './select';


export interface CongTrinhProps {
    TenCT: string
    MaCT: string
    DiaChi: string
}

const { Content } = Layout;
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
                                        <div className='aaaaa aaaa'>
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
                                <Theming />
                            </div>
                        </div>
                    </div>
                    <div className='main-content'>
                        <div className='top-logo'>
                            <div className='left-button'>
                                <div className='button'>
                                    <div className='home'>
                                        Home
                                        </div>
                                    <div className='windowns'>
                                        <AppstoreFilled />
                                    </div>
                                    <div className='right-icon'>
                                        <ChevronRightIcon />
                                    </div>
                                </div>
                            </div>
                            <div className='right-link'>
                                <div className='link-help'>
                                    <a href='https://vnexpress.net/'>
                                        <div className='help'>
                                            <b>Help</b>
                                        </div>
                                        <div className='help-icon'>
                                            <HelpIcon />
                                        </div>
                                    </a>
                                </div>
                                <div className='avatars'>
                                    <ImageAvatars />
                                </div>
                            </div>
                        </div>
                        <div className='top-button'>
                            <div className='button'>
                                <Tabbut />
                            </div>
                            <div className='select'>
                                <CustomizedSelects />
                            </div>
                        </div>
                        <div className='content'>
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
                                    <div>
                                        {this.props.children}
                                    </div>
                                </div>
                            </Layout>
                        </div>
                        <div className='footer-main'>
                            <TablePaginationDemo/>
                        </div>
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

