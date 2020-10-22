import React from 'react';

import { Link } from 'react-router-dom';
import { Table } from 'antd';



export default class Home extends React.Component {
    render() {
        return (
            <div className='site-layout-background' style={{ padding: 24, minHeight: 360 }}>
                HOME PAGE
                <div>
                    <Table
                        columns={columns}
                        dataSource={data}
                        scroll={{ x: 1500, y: 300 }}
                    />
                </div>
                <div>
                    <Link to='/auth'>Login</Link>
                </div>
            </div>
        )
    }
}

const columns: any = [
    {
        title: 'MaCT',
        width: 100,
        dataIndex: 'name',
        key: 'name',
    },
    {
        title: 'TenCT',
        width: 100,
        dataIndex: 'age',
        key: 'age',
    },
    {
        title: 'DiaChi',
        dataIndex: 'address',
        key: '1',
        width: 150,
    },
    {
        title: 'Action',
        width: 100,
        render: () => <a>action</a>,
    },
];

const data: any = [];
for (let i = 0; i < 100; i++) {
    data.push({
        key: i,
        name: `Edrward ${i}`,
        age: 32,
        address: `London Park no. ${i}`,
    });
}
