<template>
  <div>
    <b-card class="class1">

      <b-card-text>
        WorkingTime
      </b-card-text>
      <b-button v-on:click='getStart'>{{ str }}</b-button>
      <b-card-text>

      </b-card-text>
  </b-card>
  </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'WorkingTime',
    data () {
        return {
          info: '',
          str: 'Arrive'
        }
    },
    mounted() {
      axios.get(`http://localhost:4000/api/clocks/${localStorage.id}`, {
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(Response => (this.info = Response.data, console.log(localStorage.token)))
      .catch((error) => { console.log('Error', error.message)});
    },
    methods: {
      getStart: function() {
        console.log(localStorage.id)
        console.log(localStorage.token)
        // if (this.info.data.status == true)
        //   this.str = "Departure"
        // else
        //   this.str = "Arrive"
        axios.post(`http://localhost:4000/api/clocks/${localStorage.id}`, {
        headers: {
          Authorization: `Bearer ${localStorage.token.replace(/(\r\n|\n|\r)/gm, "")}`
        }
      })
      .then(Response => (this.info = Response.data))
      .catch((error) => { console.log('Error', error.message)});
      }
    },
}
</script>

<style>
.class1 {
  height: 700px;
  width: 300px;
  margin-top: 40px;
}
</style>