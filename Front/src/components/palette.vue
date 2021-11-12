<template>
  <div class="Palette">
    <p>
      <label><b>Select Week</b> </label> &nbsp;
      <b-form-datepicker id="start-datepicker" size="sm" v-model="start" class="mb-2" @input="updateWeek()"></b-form-datepicker>
    </p>
    <apexcharts
      width="100%"
      height="350"
      type="bar"
      :options="chartOptions"
      :series="this.workinghours"
    >
    </apexcharts>
    </div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";
import moment from 'moment';

export default {
  name: "palette",
  components: {
    apexcharts: VueApexCharts
  },
  data: function() {
    return {
      start: moment().isoWeekday(1).format('YYYY-MM-DD'),
      workingtimes: [],
      workinghours: [
        {
          data: [0, 0, 0, 0, 0]
        }
      ],
      chartOptions: {
        chart: {
          id: "basic-bar",
          animations: {
            speed: 200
          }
        },
        dataLabels: {
          enabled: false
        },
        plotOptions: {
          bar: {
            distributed: true
          }
        },
        xaxis: {
          categories: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        }
      },
      series: [
        {
          data: [30, 40, 45, 30, 49]
        }
      ]
    };
  },
  mounted: function() {
    this.getWorkingTimes();
  },
  methods: {
    updateWeek: function() {
      this.start = moment(this.start).isoWeekday(1).format("YYYY-MM-DD");
      this.getWorkingTimes();
    },
    getWorkingTimes: function() {
      this.workingtimes = [];
        var start = this.start;
        var end = moment(start).add(5, "days").format('YYYY-MM-DD');
        fetch(`http://localhost:4000/api/workingtimes/${localStorage.id}?start=${start} 00:00:00&end=${end} 00:00:00`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(response => response.json())
      .then(data => this.workingtimes = data.data)
      .then(this.computeWorkingHours)
      .catch((error) => { 
        console.log('Error', error.message);
        });
    },
    computeWorkingHours: function() {
      var newData = [0,0,0,0,0];
      this.workingtimes.forEach(e => {
        var start = moment(e.start);
        var end = moment(e.end);
        var duration = moment.duration(end.diff(start));
        var hours = Math.round(duration.asHours());
        
        if (moment(e.start).format("YYYY-MM-DD") == moment(e.start).isoWeekday(1).format("YYYY-MM-DD")) {
          newData[0] += hours;
        }
        if (moment(e.start).format("YYYY-MM-DD") == moment(e.start).isoWeekday(2).format("YYYY-MM-DD")) {
          newData[1] += hours;
        }
        if (moment(e.start).format("YYYY-MM-DD") == moment(e.start).isoWeekday(3).format("YYYY-MM-DD")) {
          newData[2] += hours;
        }
        if (moment(e.start).format("YYYY-MM-DD") == moment(e.start).isoWeekday(4).format("YYYY-MM-DD")) {
          newData[3] += hours;
        }
        if (moment(e.start).format("YYYY-MM-DD") == moment(e.start).isoWeekday(5).format("YYYY-MM-DD")) {
          newData[4] += hours;
        }
      })
      this.workinghours = [{
        data: newData
      }]
    }
    
  }
};
</script>


