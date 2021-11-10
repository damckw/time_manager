<template>
  <div id="app">
    <b-card title="Working Times" style="max-width: 50rem;" class="mb-2" >
    <b-row>
      <b-col cols="5">
        <label for="start-datepicker">Start</label>
        <b-form-datepicker id="start-datepicker" size="sm" v-model="start" class="mb-2"></b-form-datepicker>
      </b-col>
      <b-col cols="5">
        <label for="end-datepicker">End</label>
        <b-form-datepicker id="end-datepicker" size="sm" v-model="end" class="mb-2"></b-form-datepicker>
      </b-col>
      <b-col cols="2" align-self="center">
        <b-button v-on:click="onSubmit" size= "sm">Submit</b-button>
      </b-col>
    </b-row>
    <b-table id="workingtimes-table" striped hover :items="this.workingtimes" :fields="fields"></b-table>
    </b-card>
  </div>
</template>

  </b-card>
  </div>
</template>

<script>
import moment from 'moment'
export default {
    name:"TabsTime",
    data() {
      return {
        start: '',
        end: '',
        workingtimes: [],
        fields: ["id", "start", "end"],
      }
    },
    methods: {
      onSubmit: function() {
        fetch(`http://localhost:4000/api/workingtimes/${localStorage.id}?start=${this.start} 00:00:00&end=${this.end} 00:00:00`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(response => response.json())
      .then(data => this.workingtimes = data.data)
      .then(this.convertUtcToLocal)
      .catch((error) => { console.log('Error', error.message)});
      },
      convertUtcToLocal: function() {
        this.workingtimes.forEach(element => {
          element.start = moment.utc(element.start).local().format('YYYY-MM-DD HH:mm:ss');
          element.end = moment.utc(element.end).local().format('YYYY-MM-DD HH:mm:ss')
        });
      }
    }
};
</script>

<style>

</style>