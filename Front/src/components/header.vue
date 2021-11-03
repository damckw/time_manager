<template>
	<div>
		<div class="header">
			<a href="#default" class="logo">TimeManager</a>
			<div class="header-right">
				<form action="/Profile" class="inline">
					<button class="btn submit-button" @click="activeBtn = 'Profile'" :class="{active: activeBtn === 'Profile' }">{{test}}</button>
				</form>
			</div>
			<Test></Test>
		</div>
	</div>
</template>

<script>
	import Test from "../components/test.vue";
	export default {
		name: 'header',
		components: {
			Test,
		},
		props: ['test'],
		data () {
			return {
				activeBtn:''
			}
	}
}
</script>


<style scoped>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
  margin-top: -60px;
}

.header btn {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header btn.logo {
  font-size: 25px;
  font-weight: bold;
}

.header btn:hover {
  background-color: #ddd;
  color: black;
}

.header btn.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

.header-center {
  float: center;
}

@media screen and (max-width: 500px) {
  .header btn {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}

.active{
  background-color:dodgerblue !important;
}

.btn {
	/* box-shadow:inset 0px 1px 0px 0px #ffffff; */
	/* background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%); */
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	margin:6px;
	text-decoration:none;
	/* text-shadow:0px 1px 0px #ffffff; */
}

</style>

