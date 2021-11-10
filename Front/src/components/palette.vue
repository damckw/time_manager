<template>
  <div class="Palette">
    <p>
      <label><b>Select Theme Palette</b> </label> &nbsp;
      <select @change="updateTheme">
        <option value="palette1">palette1</option>
        <option value="palette2">palette2</option>
        <option value="palette3">palette3</option>
        <option value="palette4">palette4</option>
        <option value="palette5">palette5</option>
        <option value="palette6">palette6</option>
        <option value="palette7">palette7</option>
        <option value="palette8">palette8</option>
        <option value="palette9">palette9</option>
        <option value="palette10">palette10</option>
      </select>
    </p>
    <apexcharts
      width="100%"
      height="350"
      type="bar"
      :options="chartOptions"
      :series="this.workinghours"
    >
    </apexcharts>
    {{this.workingtimes}}
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
      workingtimes: [],
      workinghours:[],
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
    updateTheme: function(e) {
      this.chartOptions = {
        theme: {
          palette: e.target.value
        }
      };
    },
    getWorkingTimes: function() {
        var start = moment().isoWeekday(1).format('YYYY-MM-DD');
        var end = moment().isoWeekday(5).format('YYYY-MM-DD');
        fetch(`http://localhost:4000/api/workingtimes/${localStorage.id}?start=${start} 00:00:00&end=${end} 00:00:00`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        }
      })
      .then(response => response.json())
      .then(data => this.workingtimes = data.data)
      // .then(this.computeWorkingHours)
      .catch((error) => { console.log('Error', error.message)});
    },
    // computeWorkingHours: function() {
    //   var date = moment().isoWeekday(1);
    //   var fridayDate = moment().isoWeekday(6);
    //   var hours = 0;
    //   var count = 0;
    
    //   while (!date.isSame(fridayDate, 'day')) {
    //     if (moment(this.workingtimes[count].start).isSame(date))
    //     {
    //       // var now = moment(new Date()); //todays date
    //       // var end = moment("2015-12-1"); // another date
    //       // var duration = moment.duration(now.diff(end));
    //       // var days = duration.asDays();
    //       console.log(this.workingtimes[count][start]);
    //       var start = moment(this.workingtimes[count].start, moment.ISO_8601);
    //       var end = moment(this.workingtimes[count].end, moment.ISO_8601);
    //       var duration = moment.duration(start.diff(end));
    //       hours += duration.asHours();
    //     } else {
    //       debugger
    //       this.workinghours.push(hours);
    //       date = date.add(1, 'days');
    //       hours = 0;
    //       if (count <= this.workingtimes.length) {
    //         count += 1;
    //       }
    //     }
    //     debugger
    //   }
      
    // }
  }
};
</script>


