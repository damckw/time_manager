<template>
    <div>
        <p>UpdateUser</p>
    </div>
</template>

<script>
import axios from 'axios'
// @ is an alias to /src

export default {
    name: 'User',
    data () {
        return {
            info: null
        }
    },
    methods: {
        update() {
            axios
            .put(`http://localhost:4000/api/users/:userID`,{
                
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