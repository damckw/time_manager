<template>
    <div>
        <p>Get User ID</p>
        <div>
            <label>Username </label>
            <input v-model="username" type="text" name="username">
        </div>
        <div>
            <label>Email </label>
            <input v-model="email" type="email" name="email">
        </div>
        <button type="submit" v-on:click="this.get">Get</button>
        <div v-if="this.info != null">User ID : {{this.info.data.id}}</div>
    </div>
</template>

<script>
import axios from 'axios'
// @ is an alias to /src

export default {
    name: 'GetUser',
    props: {
        setUserId: Function
    },
    data () {
        return {
            username: this.username,
            email: this.email,
            info: null
        }
    },
    methods: {
        get() {
            axios
            .get(`http://localhost:4000/api/users?email=${this.email}&username=${this.username}`)
            .then(response => (this.info = response.data, this.setUserId(response.data.data.id)))
            .catch((error) => { console.log('Error', error.message);
            });
            // console.log(this.info);
            // this.setUserId(this.info.data.id);
            // this.userId = this.info.data.id;
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