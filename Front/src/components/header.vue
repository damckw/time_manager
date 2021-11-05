<template>
	<b-container class="header-style">
		<b-navbar type="dark" variant="dark">
		<b-navbar-nav>
			<b-nav-item href="/">Home</b-nav-item>
			<b-nav-item href="/Profile">Profile</b-nav-item>
		</b-navbar-nav>
		</b-navbar>
	</b-container>
</template>

<script>
	export default {
		name: 'header',
		data () {
			return {
				path: '/Profile',
				check: false
			}
		},
	}
</script>


<style>
	.header-style {
		
		background-color: #EEEEEE;
	}
</style>

