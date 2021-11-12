<template>
  <div>
    <b-card class="cardstyle">
      <b-card-text class="titlestyle">
        WorkingTime
      </b-card-text>
      <b-button v-on:click='getStart' class="buttonstyle">{{ str }}</b-button>
      <b-card-text>
        {{ hours }} : {{minutes}}
      </b-card-text>
  </b-card>
  </div>
</template>

<script>
import moment from 'moment'
export default {
    name: 'WorkingTime',
    data () {
        return {
          info: '',
          str: 'Arrive',
          workingtime: '',
          hours: '',
          minutes: ''
        }
    },
    mounted() {
      fetch(`http://localhost:4000/api/clocks/${localStorage.id}`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(response => response.json())
      .then(data => {
        this.info = data.data;
      })
      // .then(Response => (this.info = Response.data, console.log(localStorage.token)))
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
        .then(response => response.json())
      .then(data => {this.info = data.data; this.setClock(data.data); })
      .catch((error) => { console.log('Error', error.message)});
      console.log('2', this.info.status)
      },
      setClock: function(clock) {
        console.log(clock.status);
        console.log(moment(clock.time, "DD/MM/YYYY HH:mm:ss"));
        if (this.info.status == false) {
          var minutesDiff = moment().diff(clock.time, "minutes")
          this.hours = Math.trunc(minutesDiff/60)
          this.minutes = minutesDiff%60
          console.log(`you worked ${hours} hour and ${minutes} minutes`)
        }
      }
    },
}
</script>

<style>
.cardstyle {
  background-color: #EFEBE9 !important;
  margin-top: 30px;
  border: rgb(3, 3, 3) !important;
  border-style: solid !important;
  border-width: 2px !important;
  box-shadow: 5px 5px 5px #4e342e;
}

.titlestyle {
  color: #795548;
  font-size: 40px;
  font-family: Florance;
}

.buttonstyle {
  margin-top: 30px;
  width: 100%;
  background-color: #795548 !important;
  font-family: Florance;
}
</style>