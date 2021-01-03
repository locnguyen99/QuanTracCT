import React from 'react';

import './Login.scss'
import { Layout } from 'antd';
import picture from './picture.jpg';
import Grid from '@material-ui/core/Grid';
import Link from '@material-ui/core/Link';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import Checkbox from '@material-ui/core/Checkbox';
import TextField from '@material-ui/core/TextField';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import FormControlLabel from '@material-ui/core/FormControlLabel';


const useStyles = makeStyles((theme) => ({
    avatar: {
        margin: theme.spacing(1),
        backgroundColor: theme.palette.secondary.main,
    },
    form: {
        width: '350px', // Fix IE 11 issue.
        marginTop: theme.spacing(1),

    },
    submit: {
        margin: theme.spacing(3, 0, 2),
    },
    root: {
        '& > * + *': {
            marginLeft: theme.spacing(2),
        },
    },
}));

export class LoginLayout extends React.Component {
    render() {
        return (
            <Layout >
                {this.props.children}
            </Layout>
        );
    }
}

export default function SignIn() {
    const classes = useStyles();
    return (
        <div>
            <div className='page-login'>
                <div className='my-login'>
                    <div className='left-login'>
                        <div className='header-login'>
                            <div className='icon'>
                                <Avatar className={classes.avatar}>
                                    <LockOutlinedIcon />
                                </Avatar>
                            </div>
                            <Typography component="h1" variant="h5">
                                Sign in
                        </Typography>
                        </div>
                        <div className='main-login'>
                            <div className='top-main'>
                                <form className={classes.form} noValidate >
                                    <TextField
                                        variant="outlined"
                                        margin="normal"
                                        required
                                        fullWidth
                                        id="email"
                                        label="Email Address"
                                        name="email"
                                        autoComplete="email"
                                        autoFocus
                                    />
                                    <TextField
                                        variant="outlined"
                                        margin="normal"
                                        required
                                        fullWidth
                                        name="password"
                                        label="Password"
                                        type="password"
                                        id="password"
                                        autoComplete="current-password"
                                    />
                                </form>
                            </div>
                            <div className='bottom-main'>
                                <form className={classes.form} noValidate >
                                    <FormControlLabel
                                        control={<Checkbox value="remember" color="primary" />}
                                        label="Remember me"
                                    />
                                    <Button
                                        type="submit"
                                        fullWidth
                                        variant="contained"
                                        color="primary"
                                        className={classes.submit}
                                    >
                                        Sign In
                                 </Button>
                                    <Grid container>
                                        <Grid item xs>
                                            Forgot password?
                                     </Grid>
                                        <Grid item>
                                            {/* <Link to="/auth/register">Don't have an account? Sign Up</Link> */}
                                            <Typography className={classes.root}>
                                                {/* <Link to='/auth'>Already have an account? Sign in</Link> */}
                                                <Link href="/auth/signup" >
                                                    Don't have an account? Sign Up
                                             </Link>
                                            </Typography>
                                        </Grid>
                                    </Grid>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div className='right-login'>
                        <img src={picture} className="img" />
                        <div className='footer-login'>
                            <div className='char-login'>
                                <p >Đây là website sử dụng cho việc ghi nhận quan trắc và trắc địa trong nghành quan trắc môi trường</p>
                            </div>
                            <div className='right-footer'>
                                <div className='phuc'>
                                    <p className='top'>Phúc gia .Ltd</p>
                                    <p className='bottom'>Sử dụng có bản quy</p>
                                </div>
                                <Avatar />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

