<template>
  <div>
    <b-card class="cardstyle">
      <b-card-text class="titlestyle">
        Clock
      </b-card-text>
      <p class="clock">{{formattedElapsedTime}}</p>
      <b-button v-on:click='onSubmit' class="buttonstyle">{{ this.info.status ? 'Leave' : 'Arrive'}}</b-button>
      <b-button v-if="this.role === 'general_manager'" v-b-modal.modal-employees v-on:click="getUsers" class="buttonstyle">Employees</b-button>

      <b-modal id="modal-employees" title="Employees" size="xl">
        <b-card>
          <b-button class="buttonstyle">Add employee</b-button>
          <b-table id="workingtimes-table" scrollable striped hover :items="this.users" :fields="fields">
            <template #cell(options)="row">
              <b-button size="sm" variant="danger" @click="showWorkingTimes(row.item, row.index, $event.target)" class="mr-1">
                Delete
              </b-button>
              <b-button size="sm" variant="outline-primary" @click="showWorkingTimes(row.item, row.index, $event.target)" class="mr-1">
                Edit
              </b-button>
              <b-button size="sm" @click="row.toggleDetails">
                 {{ row.detailsShowing ? 'Hide' : 'Show' }} Working Times
              </b-button>
            </template>
            <template #row-details="row">
              <b-card>
                <TabsTime v-bind:userID=row.item.id></TabsTime>
              </b-card>
            </template>

          </b-table>
        </b-card>
  </b-modal>
  </b-card>
  </div>
</template>

<script>
import moment from 'moment'
import TabsTime from './TabsTime'

export default {
    name: 'WorkingTime',
    components: {
      TabsTime: TabsTime
    },
    data () {
        return {
          elapsedTime: 0,
          timer: undefined,
          info: '',
          str: 'Arrive',
          workingtime: '',
          hours: '',
          minutes: '',
          users: [],
          role: localStorage.role,
          fields: [
            { key: 'id', label: 'ID' },
            { key: 'username', label: 'Name'},
            { key: 'email', label: 'E-mail' },
            { key: 'options', label: 'Options' }
        ],
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
        if (this.info.status) {
          var start = moment.utc(this.info.time).local();
          this.elapsedTime = moment.duration(moment().diff(start));
          this.timer = setInterval(() => {
            this.elapsedTime += 1000;
          }, 1000);
        }
      })
      // .then(Response => (this.info = Response.data, console.log(localStorage.token)))
      .catch((error) => { console.log('Error', error.message)});
    },
    computed: {
      formattedElapsedTime() {
        const date = new Date(null);
        date.setSeconds(this.elapsedTime / 1000);
        const utc = date.toUTCString();
        return utc.substr(utc.indexOf(":") - 2, 8);
      }
    },
    methods: {
      onSubmit: function() {
        console.log(this.info.status);
        if (this.info.status) {
          clearInterval(this.timer);
          this.info.status = false;
        } else {
          this.elapsedTime = 0;
          this.timer = setInterval(() => {
            this.elapsedTime += 1000;
          }, 1000);
          this.info.status = true;
        }
        fetch(`http://localhost:4000/api/clocks/${localStorage.id}`, {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${localStorage.token}`
          }
        })
        .then(response => response.json())
        .then(data => {
        this.info = data.data;
        })
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
      },
      getUsers: function() {
        fetch(`http://localhost:4000/api/users/`, {
          method: 'GET',
          headers: {
            Authorization: `Bearer ${localStorage.token}`
          }
        })
        .then(response => response.json())
      .then(data => {this.users = data.data; })
      .catch((error) => { console.log('Error', error.message)});
      },
      checkRole: function() {
        return localStorage.role == "manager"
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

.clock {
  color: #795548;
  font-size: 40px;
}
</style>