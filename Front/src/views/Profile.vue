<template>
  <div class="about">
	  <b-container class="align-center">
		  <b-card title="User Profile" style="max-width: 40rem;" class="cardstyle" >
			<UpdateUser></UpdateUser>
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
		  username: localStorage.username,
		  email: localStorage.email,
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
