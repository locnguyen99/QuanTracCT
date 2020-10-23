import React from 'react'

import './App.css';
import { Layout, Menu } from 'antd'
import { Link } from 'react-router-dom'
import {
    DesktopOutlined,
    PieChartOutlined,
    FileOutlined,
    TeamOutlined,
    UserOutlined,
} from '@ant-design/icons'

const { Sider } = Layout
const { SubMenu } = Menu

export default class AppMenu extends React.Component {
    state = {
        collapsed: false,
    }
    onCollapse = (collapsed: any) => {
        console.log(collapsed)
        this.setState({ collapsed })
    }

    render() {
        return (
            <Sider collapsible
                collapsed={this.state.collapsed}
                onCollapse={this.onCollapse}
            >
                <div className='logo' />
                <div className='menu'>
                <Menu theme='dark' defaultSelectedKeys={['1']} mode='inline'>
                    <Menu.Item key='1'
                        icon={<PieChartOutlined />}
                    >
                        Trang chủ
                        <Link to='/' />
                    </Menu.Item>

                    <Menu.Item key='2'
                        icon={<DesktopOutlined />}
                    >
                        Công trình
                        <Link to='/cong-trinh' />
                    </Menu.Item>

                    <Menu.Item key='10'
                        icon={<DesktopOutlined />}
                    >
                        Kết quả quan trắc
                        <Link to='/cong-trinh-chi-tiet' />
                    </Menu.Item>
                    <Menu.Item key='11'
                        icon={<DesktopOutlined />}
                    >
                        Báo cáo
                        <Link to='/cong-trinh-chi-tiet' />
                    </Menu.Item>

                    <Menu.Item key='12'
                        icon={<DesktopOutlined />}
                    >
                        Cài đặt
                    </Menu.Item>

                    <Menu.Item key='13'
                        icon={<DesktopOutlined />}
                    >
                        Hổ trợ & tư vấn 
                    </Menu.Item>

                    {/* <SubMenu key='sub1'
                        icon={<UserOutlined />}
                        title='User'
                    >
                        <Menu.Item key='3'>Tom</Menu.Item>
                        <Menu.Item key='4'>Bill</Menu.Item>
                        <Menu.Item key='5'>Alex</Menu.Item>
                    </SubMenu>
                    <SubMenu key='sub2'
                        icon={<TeamOutlined />}
                        title='Team'
                    >
                        <Menu.Item key='6'>Team 1</Menu.Item>
                        <Menu.Item key='8'>Team 2</Menu.Item>
                    </SubMenu>
                    <Menu.Item key='9' icon={<FileOutlined />} /> */}
                </Menu>
                </div>
                
            </Sider>
        )
    }
}
