<template>
  <div id="app">
    <p id="time">{{currentDateTime()}}</p>
  </div>
</template>

<script>
export default {
  name:"Timer",
  methods: {
    currentDateTime() {
      const current = new Date();
      const date = current.getFullYear() + '-' + (current.getMonth()+1) + '-' + current.getDate();
      const time = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
      const dateTime = date +' '+ time;
      
      return dateTime;
    }
  }
};
</script>

<style>
#time {
  font-size: 50px;
  width: auto;
  margin: auto;
  text-align: center;
  border: 2px solid black;
  border-radius: 20px;
}

</style>