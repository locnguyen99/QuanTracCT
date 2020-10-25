import React from 'react';
import { Layout } from 'antd';
import picture from './picture.jpg';
import './LoginLayout.css'
import { makeStyles, createStyles, Theme } from '@material-ui/core/styles';
import Avatar from '@material-ui/core/Avatar';


export class LoginLayout extends React.Component {
    render() {
        return (
            <div>
                <div className='root' >
                    <div className='form'>
                        <Layout >
                            {this.props.children}
                        </Layout>
                    </div>
                    <div>
                        <img src={picture} className="img" />
                        <p className='char'>Đây là website sử dụng cho việc ghi nhận quan trắc và trắc địa trong nghành quan trắc môi trường</p>
                        <div className='ava'>
                            <ImageAvatars />
                        </div>
                        <div className='phuc'>
                                <p>Phúc gia .Ltd</p>
                                <p>Sử dụng có bản quy</p>    
                        </div>
                    </div>
                </div>
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

export default function ImageAvatars() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Avatar alt="Travis Howard" src="/static/images/avatar/2.jpg" />
    </div>
  );
}