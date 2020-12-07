import React from 'react'
import { Avatar } from 'antd';
import { UserOutlined } from '@ant-design/icons';

export default class avatar extends React.Component {
    render() {
        return (
            <div>
                <Avatar icon={<UserOutlined />} />
            </div>
        );
    }
}