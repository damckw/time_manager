<template>
			<div class="header-center">
				<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
				<div id="countdown" style="font-family: 'Orbitron', sans-serif; margin-top:15px"></div>
			</div>
</template>

<script>
	export default {
		name: 'test',
		data () {
			return {
				activeBtn:''
			}
	}
}
</script>

<script>
  setInterval(myTimer, 1000);

  function myTimer() {
  const d = new Date();
  document.getElementById("countdown").innerHTML = d.toLocaleTimeString();
  }
</script>

<style scoped>
.header-center {
  float: center;
}
</style>