import Vue from 'vue';
import Router from 'vue-router';
// import HelloWorld from '@/components/HelloWorld';
import Login from '@/components/Login';
import ImponoTest from '@/components/ImponoTest';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login,
    },
    {
      path: '/impono-test-call',
      name: 'ImponoTestCall',
      component: ImponoTest,
    },
  ],
});
