<template>
  <div class="headerstyle">
    <b-row align-v="stretch">
      <b-col cols="4">
        <a href="/">
          <img src='../assets/logo.png' class="img-fluid"/>
        </a>
      </b-col>
      <b-col>
        <Timer></Timer>
      </b-col>
      <b-col cols="auto">
        <b-button-group>
          <b-button variant="outline-primary" class="buttonstyle" href="/profile">
            <b-icon icon="person-fill"></b-icon>
          </b-button>
          <b-button variant="outline-primary" class="buttonstyle" v-on:click="signOut">
            <b-icon icon="box-arrow-right"></b-icon>
          </b-button>
        </b-button-group>
        
        <!-- <b-button pill class="buttonstyle" v-on:click="this.$router.push({ path: '/Profile' })"><b-icon icon="person-circle"></b-icon></b-button> -->
      </b-col>
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
    },
    signOut: function() {
      if (localStorage.id && localStorage.token && localStorage.role) {
        localStorage.clear();
        this.$router.push({path: '/login'})
      }
    }
  }
};
</script>

<style scoped>

.headerstyle {
  height: 100% !important;
  width: 100% !important;
  background-color: #EFEBE9 !important;
  border: rgb(3, 3, 3) !important;
  border-style: solid !important;
  border-width: 2px !important;
  border-radius: 4px;
  box-shadow: 5px 5px 5px #4e342e;
}

.buttonstyle {
  /* margin-top: 25px; */
  /* text-align: center; */
  width: 30%;
  color: #795548 !important;
  background-color: transparent !important;
  border-color: transparent !important;
  font-family: Florance;
  font-size: 25px;
}

.linkstyle {
  text-align: center !important;
  font-family: Florance;
  font-size: 25px;
}

</style>
