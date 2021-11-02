<template>
<div class="container">
  <p id="countdown"></p>
</div>

</template>

<script>
setInterval(myTimer, 1000);

function myTimer() {
  const d = new Date();
  document.getElementById("countdown").innerHTML = d.toLocaleTimeString();
}
</script>