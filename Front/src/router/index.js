import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home'
import Profile from '../views/Profile'
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
    component: Profile
  },
  {
    path: '/',
    name: 'Home',
    component: Home
  }
  // {
  //   path: '/user',
  //   name: 'User',
  //   component: User
  // },
  // {
  //   path: '/DeleteUser',
  //   name: 'DeleteUser',
  //   component: DeleteUser
  // },
  // {
  //   path: '/GetUser',
  //   name: 'GetUser',
  //   component: GetUser
  // },
  // {
  //   path: '/UpdateUser',
  //   name: 'UpdateUser',
  //   component: UpdateUser
  // },
  // {
  //   path: '/WorkingTimes',
  //   name: 'WorkingTimes',
  //   component: WorkingTimes

  // },
  // {
  //   path: '/WorkingTime',
  //   name: 'WorkingTime',
  //   component: WorkingTime

  // },
  // {
  //   path: '/ClockManager',
  //   name: 'ClockManager',
  //   component: ClockManager

  // },
  // {
  //   path: '/ChartManager',
  //   name: 'ChartManager',
  //   component: ChartManager

  // },

  /*{
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about"  '../views/About.vue')
  }*/
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
