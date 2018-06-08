<template>
<div class="login-wrapper">
  <img src="../assets/impono.svg" width="500" class="text-center">
  <h2 class="form-signin-heading">Please sign in!</h2>
  <form class="form-signin" @submit.prevent="login">
    <p>{{ msg }}</p>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input v-model="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input v-model="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  </form>
</div>
</template>

<script>
import axios from 'axios';
import Router from 'vue-router';
export default {
  name: 'Login',
  data() {
    return {
      email: '',
      password: '',
      msg: '',
    };
  },
  msg: '',
  created() {
    console.log('Created');
    console.log(OAUTH_CLIENT_ID);
    console.log(OAUTH_CLIENT_SECRET);
  },
  watch:{
    $route (to, from){
        this.show = false;
    }
  },
  methods: {
    login(e) {
      console.log('Button pushed');

      console.log(this.email)
      console.log(this.password)

      console.log(OAUTH_CLIENT_ID);
      console.log(OAUTH_CLIENT_SECRET);

      axios
        // .get('https://api.coindesk.com/v1/bpi/currentprice.json')
        .post('/api/oauth/v2/token.json', {
          client_id: OAUTH_CLIENT_ID, // "1_3m85hjdnbzwg8gss4ow0o84co80wccwso0wgckcooc4sc4kcwc"
          client_secret: OAUTH_CLIENT_SECRET, // "5khp7tfydboco0cww0wwc4k40g8gcw8c0skwwgw88cwcoswckc"
          grant_type: "password",
          password: this.password, // "testing"
          username: this.email // "user1@example.com"
        })
        .then(response => {
          console.log('Success');
          console.log(response);
          if (response.status === 200) {
            localStorage.setItem('userClient', JSON.stringify(response.data));
            // Get userClient
            // JSON.parse(localStorage.getItem('userClient'));
            // this.$route.push('/admin');
            this.$router.push('/admin');
          }
        })
        .catch(error => {
          console.log(error.response)
          if (error.response.status === 400) {
            this.msg = error.response.data.errors.form[0];
          }
        })
      e.preventDefault();
    }
  }
};

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
body {
  background: #605B56;
}

.login-wrapper {
  background: #fff;
  width: 70%;
  margin: 0 auto;
}

.form-signin {
  max-width: 330px;
  padding: 10% 15px;
  margin: 0 auto;
}

.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}

.form-signin .checkbox {
  font-weight: normal;
}

.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}

.form-signin .form-control:focus {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
