import axios from 'axios';
import vueaxios from 'vue-axios';
var qs = require('qs');

var postData = {
        /* eslint-disable */
        client_id: '3_uly3ligf6qokss4s4owc4k0sk4ggc8s0ogog0kgs84g0oosk0', //this.OAuthClientSettings.clientId,
        client_secret: 'ya8fekw79xc0kgsg00s0ocs4s4408g4ggkwksks8wwck0sowo', // this.OAuthClientSettings.clientSecret,
        grant_type: 'client_credentials', // GRANT_TYPE,
        // username: identity,
        // password: password
        /* eslint-enable */
};

export default {
  name: 'Get access Token',
  data() {
    return {
      msg: 'Welcome to Impono Vue.js App (Jorge rules!)',
      info: null
    };
  },
  /* eslint-disable */
  created () {
    axios
      .post(
        'https://will-kill-soon-promise.jls-sto2.elastx.net/api/oauth/v2/token.json',
        qs.stringify({
          client_id: '3_uly3ligf6qokss4s4owc4k0sk4ggc8s0ogog0kgs84g0oosk0', //this.OAuthClientSettings.clientId,
          client_secret: 'ya8fekw79xc0kgsg00s0ocs4s4408g4ggkwksks8wwck0sowo', // this.OAuthClientSettings.clientSecret,
          grant_type: 'client_credentials', // GRANT_TYPE,
        }),
      )
      .then(response => (
        this.info = response.data
      ))
      .catch(error => console.log(error))
  }
};
