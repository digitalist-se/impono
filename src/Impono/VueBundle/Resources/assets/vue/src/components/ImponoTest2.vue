<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <pre>
    {{ info }}
    </pre>
  </div>
</template>

<script>
import axios from 'axios';
import vueaxios from 'vue-axios';
export default {
  name: 'HelloWorld',
  // props: ['info'],
  data() {
    return {
      msg: 'Welcome to Impono Vue.js App (Jorge rules!)',
      info: null
    };
  },
  created () {
    axios
      // .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .get(
        'https://will-kill-soon-promise.jls-sto2.elastx.net/api/containers.json',
        {
        // baseURL: 'https://will-kill-soon-promise.jls-sto2.elastx.net/api/containers.json',
        headers: {
          'Authorization': 'Bearer OGI3NGUxOThmYWJhY2MxYjUyOTEzM2M0YTUwNmUzNDBiYjQ4NDg1YTAwOTE0OTk0MTE2NWUwZmYxNjZlMTczNg'
        }
      })
      .then(response => (this.info = response))
      .catch(error => console.log(error))
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
pre{
  text-align: left;
  border: 2px ridge grey;
  overflow: scroll;
}
</style>
