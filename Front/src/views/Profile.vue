<template>
  <div class="about">
	  <b-container class="align-center">
		  <b-card title="User Profile" style="max-width: 40rem;" class="cardstyle" >
			<UpdateUser v-bind:user="this.user"></UpdateUser>
			</b-card>
	  </b-container>
    
	</div>
</template>
<script>
import { defineComponent } from '@vue/composition-api'
import UpdateUser from '../components/UpdateUser'

export default defineComponent({
  name: "Profile",
  components: {
	  UpdateUser: UpdateUser
  },
  data() {
	  return ({
		  user: {
			username: localStorage.username,
		  	email: localStorage.email,
		  	id: localStorage.id,
			role: localStorage.role
		  }
	  })
  }
})
</script>
<style>
.cardstyle {
  background-color: #EFEBE9 !important;
  margin-top: 30px;
  border: rgb(3, 3, 3) !important;
  border-style: solid !important;
  border-width: 2px !important;
}
</style>
