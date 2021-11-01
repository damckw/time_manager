<template>
    <div>
        <p>Update User</p>
        <div>
            <label>Username </label>
            <input v-model="username" type="text" name="username">
        </div>
        <div>
            <label>Email </label>
            <input v-model="email" type="email" name="email">
        </div>
        <div>
            <label>User ID </label>
            <input v-model="userId" type="text" name="username">
        </div>
        <div>
            <button type="submit" v-on:click="update">Update</button>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'UpdateUser',
    data () {
        return {
            email: this.email,
            username: this.username,
            userId: this.userId,
            info: null
        }
    },
    methods: {
        update() {
            axios
            .patch(`http://localhost:4000/api/users/${this.userId}`,{
                username: this.username,
                email: this.email
            })
            .then(Response => (this.info = Response.data)) 
            .catch((error) => { console.log('Error', error.message); this.info = null;
            });
        }
    }
}
</script>

<style>

</style>