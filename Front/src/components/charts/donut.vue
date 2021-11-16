<template>
	<div class="chart-wrap">
  <b-card title="Daily Objective" style="max-width: 40rem;" class="mb-2" >
    <b-row>
      <b-col>
        <b-form-timepicker v-model="start" size="sm" locale="fr" placeholder="Start" @input="updateGraph"></b-form-timepicker>
      </b-col>
      <b-col>
        <b-form-timepicker v-model="end" size="sm" locale="fr" placeholder="End" @input="updateGraph"></b-form-timepicker>
      </b-col>
    </b-row>
    <div id="chart">
			<apexchart type="donut" width="380" :options="chartOptions" :series="series"></apexchart>
		</div>
  </b-card>

	</div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";
import moment from 'moment';

export default {
  name: "donut",
  components: {
    apexchart: VueApexCharts
  },
  data: function() {
    return {
      start: "9:30",
      end: "17:30",
          series: [70,30],
          chartOptions: {
            chart: {
              width: 380,
              type: 'donut',
            },
            labels: ["Done", "To-do"],
            responsive: [{
              breakpoint: 480,
              options: {
                chart: {
                  width: 200
                },
                legend: {
                  show: false
                }
              }
            }],
            legend: {
              position: 'right',
              offsetY: 0,
              height: 230,
            }
          }
      };
  },
  mounted() {
    this.updateGraph()
    window.setInterval(() => {
    this.updateGraph()
  }, 1000)
  },
  methods:{
    updateGraph: function() {
      var start = moment(moment().format("YYYY-MM-DD ") + this.start);
      var end = moment(moment().format("YYYY-MM-DD ") + this.end);
      var now = moment();
      var hoursToDo = moment.duration(end.diff(now)).asHours();
      var hoursDone = moment.duration(now.diff(start)).asHours();
      var hoursTotal = hoursToDo + hoursDone;
      if (hoursToDo > 0 && hoursDone > 0 && hoursTotal > 0)
        this.series = [(hoursDone/hoursTotal), (hoursToDo/hoursTotal)];
      if ((hoursDone/hoursTotal) > 1 ) {
        this.series = [100, 0];
      }
    }
  }
}
</script>
