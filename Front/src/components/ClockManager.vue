<template>
  <div>

    <div class="btn-group">
        <button v-on:click="refresh">refresh</button>
        <button v-on:click="clock">clock</button>
    </div>
    <!-- <p>{{ play }}</p>
    <p>{{ clockIn }}</p>
    <p>{{ startDateTime }}</p>
    <p>{{ date }}</p> -->
    <p id="ClockManager">{{currentDateTime()}}</p>
  </div>
</template>

<script>
</script>

<script>
export default {
  name: "ClockManager",
  data() {
      return {
            date: "init",
            play : false,
            clockIn : false,
            startDateTime : null,
            componentKey: 0,
        };
  },
  methods: {
    forceRerender() {
      this.componentKey += 1;
    },
    refresh() {
        this.play = false;
        this.clockIn = false;
        this.startDateTime = null;
    },
    clock() {
        if (!this.play) {
            this.clockIn = true;
            this.startDateTime = this.currentDateTime();
        }
        this.play = !this.play;
    },
    currentDateTime() {
      const current = new Date();
      const date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
      const time = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
      const dateTime = date +' '+ time;
      return dateTime;
    },
  }
};
</script>

<style>
#countDown {
  font-size: 50px;
  width: auto;
  margin: auto;
  text-align: center;
  border: 2px solid black;
  border-radius: 20px;
}

.btn-group button {
  background-color: #04AA6D; /* Green background */
  border: 1px solid green; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
  width: 50%;
  
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: #3e8e41;
}

</style>