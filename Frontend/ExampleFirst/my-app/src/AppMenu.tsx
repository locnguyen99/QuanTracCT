import React from 'react'

import { Layout, Menu } from 'antd'
import { Link } from 'react-router-dom'
import { Button } from 'antd';
import DoneOutlineIcon from '@material-ui/icons/DoneOutline';
import DataUsageIcon from '@material-ui/icons/DataUsage';
import PrintIcon from '@material-ui/icons/Print';
import SettingsIcon from '@material-ui/icons/Settings';
import HelpOutlineIcon from '@material-ui/icons/HelpOutline';
import AddCircleIcon from '@material-ui/icons/AddCircle';

const { Sider } = Layout
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
            <div className='allmenu'>
                <div className='topmenu'>
                    <Menu >
                        <Menu.Item >
                            <div className='aaaa'>
                                <DataUsageIcon />
                            </div>
                            <div className='aaa'>
                                <p className='a'>Công trình</p>
                                <p className='aa'>Công trình & chu kỳ</p>
                            </div>
                            <Link to='/' />
                        </Menu.Item>
                        <Menu.Item >
                            <div className='aaaa'>
                                <DoneOutlineIcon />
                            </div>
                            <div className='aaa'>
                                <p className='a'>Kết quả quan trắc</p>
                                <p className='aa'>Kết quả mốc theo từng chu kỳ</p>
                            </div>
                            <Link to='/cong-trinh' />
                        </Menu.Item>
                        <Menu.Item >
                            <div className='aaaa'>
                                <PrintIcon />
                            </div>
                            <div className='aaa'>
                                <p className='a'>Báo cáo</p>
                                <p className='aa'>Get insights into the big data</p>
                            </div>
                            <Link to='/cong-trinh-chi-tiet' />
                        </Menu.Item>
                    </Menu>
                </div>
                
                <div className='undermenu'>
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
                </div>
            </div>
        )
    }
}
