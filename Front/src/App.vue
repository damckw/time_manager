<template>
  <div id="app">
    <div id="nav">
      <router-link to="/user">User</router-link>
      <router-link to="/DeleteUser">DeleteUser</router-link>
      <router-link to="/UpdateUser">UpdateUser</router-link>
      <router-link to="/GetUser">GetUser</router-link>
      <router-link to="/WorkingTimes">WorkingTimes</router-link>
      <router-link to="/WorkingTime">WorkingTime</router-link>
      <router-link to="/ClockManager">ClockManager</router-link>
      <router-link to="/ChartManager">ChartManager</router-link>
    </div>
    <router-view/>
    <img src="./assets/logo.png">
    <Boxes msg="test"/>
  </div>
</template>

<script>
import Boxes from './components/Boxes.vue'

export default {
  name: 'App',
  components: {
    Boxes
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
