<template>
  <div id="app">

    <div class="btn-group">
      <router-link to="/ClockManager" tag="button">ClockManager</router-link>
      <router-link to="/ChartManager" tag="button">ChartManager</router-link>
    </div>
    <router-view/>

  </div>
</template>

<script>
export default {
  name: "countDown",
};

</script>

