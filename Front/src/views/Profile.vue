<template>
  <div class="about">
	<Header test='Dashboard'></Header>
  </div>
</template>

<script>
import Header from "../components/header.vue";

export default {
  name: 'Home',
  components: {
    Header
  },
  data() {
    return {
      userId: 0,
      data: null,
    }
  }
}
</script>
