import React from 'react';

import { ThemeProvider, makeStyles } from '@material-ui/core/styles';

const useStyles = makeStyles((theme: typeof themeInstance) => ({
    root: {
        background: theme.background,
        border: 0,
        fontSize: 9,
        letterSpacing: 0.5,
        borderRadius: 3,
        boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
        color: 'black',
        height: 25,
        width: 70,
    },
}));

function DeepChild() {
    const classes = useStyles();

    return (
        <div className='button-footer'>
            <button type="button" className='but1'>
                V0.1
            </button>
            <button type="button" className='but23'>
                ĐIỀU KIỆN
            </button>            
            <button type="button" className='but23'>
                ĐIỀU KHOẢN
            </button>
        </div>
    );
}

const themeInstance = {
    background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
};

export default function Theming() {
    return (
        <ThemeProvider theme={themeInstance}>
            <DeepChild />
        </ThemeProvider>
    );
}