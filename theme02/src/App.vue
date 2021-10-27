<template>
  <div id="app">
    <div id="nav">
      <router-link to="/user">User</router-link>
      <router-link to="/WorkingTimes">WorkingTimes</router-link>
      <router-link to="/WorkingTime">WorkingTime</router-link>
      <router-link to="/ClockManager">ClockManager</router-link>
      <router-link to="/ChartManager">ChartManager</router-link>
    </div>
    <router-view/>
  </div>
</template>

<style>
</style>
