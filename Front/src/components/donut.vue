<template>
	<div class="chart-wrap">
  <b-card title="Daily Objective" style="max-width: 40rem;" class="mb-2" >
    <div id="chart">
			<apexchart type="donut" width="380" :options="chartOptions" :series="series"></apexchart>
		</div>
  </b-card>

	</div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";

export default {
  name: "donut",
  components: {
    apexchart: VueApexCharts
  },
  data: function() {
    return {
          series: [70,30],
          chartOptions: {
            chart: {
              width: 380,
              type: 'donut',
            },
            labels: ["Done", "To-do"],
            // dataLabels: {
            //   enabled: false
            // },
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
  }
  }
</script>
