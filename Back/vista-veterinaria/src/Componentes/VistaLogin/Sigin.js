import React, { useState } from 'react';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import swal from 'sweetalert';

const useStyles = makeStyles((theme) => ({
  root: {
    height: '100vh',
  },
  image: {
    backgroundImage: 'url(https://media.istockphoto.com/photos/asian-woman-and-cute-dog-having-fun-together-at-home-picture-id1342231672?b=1&k=20&m=1342231672&s=170667a&w=0&h=gg2GJX7FMSo3vHZge9DDdnzDYfx-vxRrQQ6bU5MQUcQ=)',
    backgroundSize: 'cover',
  },
  paper: {
    margin: theme.spacing(8, 4),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%',
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

async function loginUser(credentials) {
  return fetch('http://localhost:18081/user/login', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(credentials)
  })
    .then(data => data.json())
}

export default function Signin() {
  const classes = useStyles();
  const [id, setId] = useState();
  const [email, setEmail] = useState();
  const [password, setPassword] = useState();

  const handleSubmit = async e => {
    try {
      e.preventDefault();
      const response = await loginUser({
        email,
        password
      });
      if ('token' in response) {
        swal("Success",  "success", {
          buttons: false,
          timer: 2000,
        })
        .then((value) => {
          const idDuenio = parseInt(response['id'])+1;
          localStorage.setItem("id", idDuenio);
          localStorage.setItem('accessToken', response['token']);
          localStorage.setItem('user', JSON.stringify(response['user']));
          window.location.href = "/auth/me";
        });
      } else {
        swal("Oops...", "Usuario o Contraseña incorrectos");
      }
    } catch (error) {
      swal("Oops...", "Usuario o Contraseña incorrectos");
    }
    
  }

  return (
    <Grid container className={classes.root}>
      <CssBaseline />
      <Grid item xs={false} md={7} className={classes.image} />
      <Grid item xs={12} md={5} component={Paper} elevation={6} square>
        <div className={classes.paper}>
          <Avatar className={classes.avatar}>
            <LockOutlinedIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            Sign in
          </Typography>
          <form className={classes.form} noValidate onSubmit={handleSubmit}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="email"
              name="email"
              label="Email Address"
              onChange={e => setEmail(e.target.value)}
            />
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="password"
              name="password"
              label="Password"
              type="password"
              onChange={e => setPassword(e.target.value)}
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
          </form>
        </div>
      </Grid>
    </Grid>
  );
}