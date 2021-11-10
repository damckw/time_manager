<template>
  <div>
    <b-card class="cardstyle">

      <b-card-text class="titlestyle">
        WorkingTime
      </b-card-text>
      <b-button v-on:click='getStart' class="buttonstyle">{{ str }}</b-button>
      <b-card-text>
        {{ }}
      </b-card-text>
  </b-card>
  </div>
</template>

<script>

export default {
    name: 'WorkingTime',
    data () {
        return {
          info: '',
          str: 'Arrive',
          workingtime: ''
        }
    },
    mounted() {
      fetch(`http://localhost:4000/api/clocks/${localStorage.id}`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(Response => (this.info = Response.data, console.log(localStorage.token)))
      .catch((error) => { console.log('Error', error.message)});
    },
    methods: {
      getStart: function() {
        fetch(`http://localhost:4000/api/clocks/${localStorage.id}`, {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${localStorage.token}`
          }
        })
      .then(Response => (this.info = Response.data))
      .catch((error) => { console.log('Error', error.message)});
      }
    },
}
</script>

<style>
.cardstyle {
  background-color: #EFEBE9 !important;
  height: 700px;
  width: 300px;
  margin-top: 30px;
  border: rgb(3, 3, 3) !important;
  border-style: solid !important;
  border-width: 2px !important;
}

.titlestyle {
  color: #795548;
  font-size: 40px;
  font-family: Florance;
}

.buttonstyle {
  margin-top: 30px;
  width: 200px;
  background-color: #795548 !important;
  font-family: Florance;
}
</style>