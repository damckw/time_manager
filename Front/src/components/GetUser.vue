<template>
    <div>
        <p>GetUser</p>
        <button type="submit" v-on:click="getId">Get</button>
    </div>
</template>

<script>
import axios from 'axios'
// @ is an alias to /src

export default {
    name: 'User',
    data () {
        return {
            username: this.username,
            email: this.email,
            userId: 0,
            info:{}

        }
    },
    methods: {
        get() {
            axios
            .get(`http://localhost:4000/api/users?email=${this.email}&username=${this.username}`)
            .then(response => (this.info = response.data))
            .catch((error) => { console.log('Error', error.message);
            });
            console.log("info: ", this.info.data)
        },
    
        /*getId() {
            axios
            .get(`http://localhost:4000/api/users/:${this.userId}`)
            .then(Response => (this.info = Response.data))
            .catch((error) => { console.log('Error', error.message); this.info = null;
            });
        }*/
    }
}
</script>

<style>

</style>