<template>
    <div id="user">
        <p>Create User</p>
        <div>
            <label>Username </label>
            <input v-model="username" type="text" name="username">
        </div>
        <div>
            <label>Email </label>
            <input v-model="email" type="email" name="email">
        </div>
        <div>
            <button type="submit" v-on:click="create">Submit</button>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'CreateUser',
    data () {
        return {
            username: '',
            email: '',
            info: null,
        }
    },
    methods: {
        create: function() {
            axios
            .post(`http://localhost:4000/api/users`, {
                username: this.username,
                email: this.email,
            })
            .then(Response => {this.info = Response.data})   
            .catch((error) => {console.log('Error', error.message); this.info = null;
            });
        }
    }
}
</script>

<style>

</style>