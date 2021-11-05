<template>
	<div class="chart-wrap">
  <b-card title="Card Title" style="max-width: 40rem;" class="mb-2" >
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
          series: [440, 55, 13, 33],
          chartOptions: {
            chart: {
              width: 380,
              type: 'donut',
            },
            dataLabels: {
              enabled: false
            },
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
