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
            fetch(`http://localhost:4000/api/auth/login`, {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email: this.email,
                    password: this.password
                })
            })
            .then(response => response.json())
            .then((data) => {
                console.log(data);
                if (data.data) {
                    localStorage.token = data.data.token;
                    localStorage.role = data.data.role;
                    localStorage.id = data.data.id;
                    localStorage.username = data.data.username;
                    localStorage.email = data.data.email;
                    this.$router.push('/');
                } else if (data.error) {
                    alert(data.error.message);
                }
            });
        },
    },
}
</script>