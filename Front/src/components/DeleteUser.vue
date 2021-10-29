<template>
    <div>
        <p>DeleteUser</p>
        <input v-model="userId" type="text" name="username">
        <button type="submit" v-on:click="deleted">Delete</button>
    </div>
</template>

<script>
import axios from 'axios'


export default {
    name: 'User',
    data () {
        return {
            userId: this.userId,
            info: null
        }
    },
    methods: {
        deleted() {
            console.log(this.userId)
            axios
            .delete(`http://localhost:4000/api/users/${this.userId}`, {
                userId: this.userId
            })
            .then(Response => (this.info = Response.data)) 
            .catch((error) => { console.log('Error', error.message);
            });
        }
    }
}
</script>

<style>

</style>