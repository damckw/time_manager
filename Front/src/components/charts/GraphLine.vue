<template>
	<div id="line">
		<b-card class="carde" >
			<apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
		</b-card>
	</div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";

export default {
  name: "Line",
  components: {
    apexchart: VueApexCharts
  },
  data: function() {
    return {
		series: [{
			name: "Desktops",
			data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
		}],
		chartOptions: {
			chart: {
				height: 350,
				type: 'line',
				zoom: {
				enabled: false
				}
			},
			dataLabels: {
				enabled: false
			},
			stroke: {
				curve: 'straight'
			},
			title: {
				text: 'Working Times by Month',
				align: 'left'
			},
			grid: {
				row: {
				colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
				opacity: 0.5
				},
			},
			xaxis: {
				categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
			}
		},
	};
	}
}
</script>

<style>

.carde {
	width: 100%;
	height: 100%;

}

</style>

