import React from 'react';

import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Link from '@material-ui/core/Link';
import Typography from '@material-ui/core/Typography';
import { ArrowLeftOutlined } from '@ant-design/icons';



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

export default function SignUp() {
    const classes = useStyles();
    return (
        <div >
            <div className='back'>
                <ArrowLeftOutlined />
                Back
            </div>
            <div className='signup'>
                <Typography component="h1" variant="h5">
                    Sign up
                </Typography>
            </div>
            <div className='formItems'>
                <form className={classes.form} noValidate >
                    <TextField className='Items'
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        id="full_name"
                        label="Full Name"
                        name="full_name"
                        autoComplete="full_name"
                        autoFocus
                    />
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
                    <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        name="confrim_password"
                        label="Confrim Password"
                        type="confrim_password"
                        id="confrim_password"
                        autoComplete="current-password"
                    />
                    <FormControlLabel
                        control={<Checkbox value="remember" color="primary" />}
                        label="Accept the terms and conditions"
                    />
                    <Button
                        type="submit"
                        fullWidth
                        variant="contained"
                        color="primary"
                        className={classes.submit}
                    >
                        Sign Up
                    </Button>
                    <Grid container>
                        <Grid item>
                            <Typography className={classes.root}>
                                {/* <Link to='/auth'>Already have an account? Sign in</Link> */}
                                <Link href="/auth" >
                                    Already have an account? Sign in
                            </Link>
                            </Typography>
                        </Grid>
                    </Grid>
                </form>
            </div>
        </div>
    );
}