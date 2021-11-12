import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home'
import Profile from '../views/Profile'
import Login from '../components/Login.vue'
// import User from '../components/User.vue'
// import DeleteUser from '../components/DeleteUser'
// import UpdateUser from '../components/UpdateUser'
// import GetUser from '../components/GetUser'
// import WorkingTimes from '../components/WorkingTimes'
// import WorkingTime from '../components/WorkingTime'
// import ClockManager from '../components/ClockManager'
// import ChartManager from '../components/ChartManager'


Vue.use(VueRouter)

const routes = [
  {
    path: '/Profile',
    name: 'Profile',
    component: Profile,
    beforeEnter: (to, from, next) => {
      if (localStorage.token) {
        next();
      } else {
        next({ path: '/Login' });
      }
    }
  },
  {
    path: '/',
    name: 'Home',
    component: Home,
    beforeEnter: (to, from, next) => {
      if (localStorage.token) {
        next();
      } else {
        next({ path: '/Login' });
      }
    }
  },
  {
    path: '/Login',
    name: 'Login',
    component: Login
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
