<template>
  <div class="headerstyle">
    <b-row>
      <b-col><b-link class='linkstyle' href="/">TimeManager</b-link></b-col>
      <b-col><Timer></Timer></b-col>
      <b-col><b-button pill class="buttonstyle" v-on:click='ChangeRoute'>{{ str }}</b-button></b-col>
    </b-row>
  </div>
</template>

<script>
import Timer from './Timer.vue'

export default {
  name: "header",
  components: {
    Timer,
  },
  data() {
    return {
      check: false,
      str: 'Profile'

    };
  },
  methods: {
    ChangeRoute: function() {
      if (this.check == false) {
        this.$router.push({ path: '/Profile' });
        this.str = 'Home';
        this.check = true;
      } else {
        this.$router.push({ path: '/' })
        this.str = 'Profile'
        this.check = false;
      }
    },
    HomeRoute: function() {
      this.$router.push({ path: '/' })
    }
  }
};
</script>

<style scoped>

.headerstyle {
  height: 100px;
  width: 100%;
  background-color: #EFEBE9 !important;
  border: rgb(3, 3, 3) !important;
  border-style: solid !important;
  border-width: 2px !important;
  border-radius: 4px;
  box-shadow: 5px 5px 5px #4e342e;
}

.buttonstyle {
  margin-top: 25px;
  width: 30%;
  background-color: #795548 !important;
  font-family: Florance;
  font-size: 20px;
}

.linkstyle {
  font-family: Florance;
  font-size: 25px;
}

</style>
