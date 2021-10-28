<template>
    <div>
        <p>GetUser</p>
    </div>
</template>

<script>
// @ is an alias to /src

export default {
    name: 'User',
    data () {
        return {
            username: '',
            email: '',
            userId: 0,
            info: null

        }
    },
    methods: {
        get() {
            axios
            .get(`http://localhost:4000/api/users?email=${email}&username=${username}`)
            .then((response) => (this.info = response.data))
            .catch((error) => { console.log('Error', error.message); this.info = null;
            });
        },
        getId() {
            axios
            .get(`http://localhost:4000/api/users/:${userId}`)
            .then(Response => (this.info = Response.data))
            .catch((error) => { console.log('Error', error.message); this.info = null;
            });
        }
    }
}
</script>

<style>

</style>