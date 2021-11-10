<template>
  <div class="test">
    <b-container>
			<b-row >
				<b-col>
          <WorkingTime></WorkingTime>
        </b-col>
				<b-col>
          <Donut></Donut>
        </b-col>
        <b-col>
          <Palette></Palette>
        </b-col>
			</b-row>
		</b-container>
    <b-container>
			<b-row >
        <b-col>
          <GraphLine></GraphLine>
        </b-col>
				<b-col>
        <TabsTime></TabsTime>
        </b-col>
			</b-row>
		</b-container>
    
  </div>
</template>

<script>
import WorkingTime from '../components/WorkingTime.vue'
import Donut from '../components/donut.vue'
import Palette from '../components/palette.vue'
import GraphLine from '../components/GraphLine.vue'
import TabsTime from '../components/TabsTime.vue'

export default {
  name: 'Home',
  components: {
    WorkingTime,
    Donut,
    GraphLine,
    Palette,
    TabsTime,
  },
}
</script>


<style>

</style>

