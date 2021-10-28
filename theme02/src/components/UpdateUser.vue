<template>
    <div>
        <p>UpdateUser</p>
    </div>
</template>

<script>
// @ is an alias to /src

export default {
    name: 'User',
    data () {
        return {
            userId: 0,
            info: null
        }
    },
    methods: {
        update() {
            axios
            .update(`http://localhost:4000/api/users/:userID`,{
                
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