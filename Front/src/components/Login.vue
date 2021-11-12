<template>
    <div>
        <b-card>
            <b-form-input v-model="email" placeholder="Enter your email"></b-form-input>
            <b-form-input v-model="password" type='password' placeholder="Enter your mdp"></b-form-input>
            <b-button v-on:click='onSubmit'>Submit</b-button>
        </b-card>
    </div>
</template>

<script>
import axios from 'axios'
    export default {
        data() {
            return {
                token: '',
                password: '',
                email: '',
            }
        },
    methods: {
        onSubmit() {
            axios.post(`http://localhost:4000/api/auth/login`,{
                email: this.email,
                password: this.password,
            }).then(Response => (this.info = Response.data,
                localStorage.token = this.info.data.token,
                localStorage.role = this.info.data.role,
                localStorage.id = this.info.data.id))
            .then(this.$router.push('/'))
            .catch((error) => { console.log('Error', error.message);
            });
        },
    },
}
</script>