<template>
  <div class="about">
    <b-card title="Card Title" style="max-width: 40rem;" class="mb-2" >
			<p>Nom / username</p>
      <p>email</p>
      <p>mdp</p>
		</b-card>
  </div>
</template>

<script>

export default {
  name: 'Home',
  components: {
  },
  data() {
    return {
      userId: 0,
      data: null,
    }
  }
}
</script>
