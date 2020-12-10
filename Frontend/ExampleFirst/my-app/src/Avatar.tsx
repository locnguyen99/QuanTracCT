import React from 'react'

import { Select } from 'antd';
import { Avatar } from 'antd';
import { Tabs, Radio } from 'antd';
import { UserOutlined } from '@ant-design/icons';
import { makeStyles, createStyles, Theme } from '@material-ui/core/styles';


export default class avatar extends React.Component {
  render() {
    return (
      <div>
        <Avatar icon={<UserOutlined />} />
      </div>
    );
  }
}


const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: 'flex',
      '& > *': {
        margin: theme.spacing(1),
      },
    },
  }),
);

export function ImageAvatars() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Avatar alt="Travis Howard" src="/static/images/avatar/2.jpg" />
    </div>
  );
}


const { TabPane } = Tabs;
const { Option } = Select;
export class Tabbut extends React.Component {
  state = { size: 'small' };
  onChange = (e: { target: { value: any; }; }) => {
    this.setState({ size: e.target.value });
  };
  render() {
    const size: any = this.state;
    return (
      <div>
        <Tabs defaultActiveKey="1" type="card" size={size}>
          <TabPane tab="CÔNG TRÌNH" key="1">
          </TabPane>
          <TabPane tab="CHU KỲ" key="2">
          </TabPane>
        </Tabs>
      </div>
    );
  }
}




