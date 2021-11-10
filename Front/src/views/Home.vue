<template>
  <div class="test">
    
    <b-container>
			<b-row >
				<b-col cols="4">
          <WorkingTime></WorkingTime>
        </b-col>
				<b-col cols="8">
          <b-card no-body>
            <b-tabs card>
              <b-tab title="Donut" active>
                <Donut></Donut>
              </b-tab>
              <b-tab title="Palette">
                <Palette></Palette>
              </b-tab>
              <b-tab title="Graph">
                <GraphLine></GraphLine>
              </b-tab>
            </b-tabs>
          </b-card>
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

