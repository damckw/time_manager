<template>
  <div>
    <div class="headerstyle">
      <b-button class="buttonstyle">Profil</b-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "header",
  data() {
    return {

    };
  },
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
  border-radius: 5px;
}

.buttonstyle {
  margin-top: 30px;
  width: 100px;
  background-color: #795548 !important;
  font-family: Florance;
}

</style>
