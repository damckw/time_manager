<template>
    <div>
        <b-container fluid>
            <b-form-group label-cols="6" label-cols-lg="4" label="Username" label-for="input-default">
                <b-form-input v-model="username" type="text"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Email" label-for="input-default">
                <b-form-input v-model="email" type="text"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Current Password" label-for="input-default">
                <b-form-input v-model="current_password" type="password"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="New Password" label-for="input-default">
                <b-form-input v-model="new_password" type="password"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Role" label-for="input-default">
                <b-form-input v-model="role" type="text"/>
            </b-form-group>
            <b-button class="buttonstyle" v-on:click="update">Update</b-button>
        </b-container>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'UpdateUser',
    data () {
        return {
            email: localStorage.email,
            username: localStorage.username,
            userId: localStorage.id,
            role: localStorage.role,
            current_password: "",
            new_password: "",
            info: null
        }
    },
    methods: {
        update() {
            var data = {
                    "email": this.email,
                    "username": this.username,
                    "current_password": this.current_password,
                    "new_pasword": this.new_password,
                    "role": this.role
                }
            fetch(`http://localhost:4000/api/users/${this.userId}`, {
                method: 'PUT',
                mode: 'cors',
                headers: {
                    'Authorization': `Bearer ${localStorage.token}`,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then((data) => {
                console.log(data);
                if (data.data) {
                    localStorage.role = data.data.role;
                    localStorage.id = data.data.id;
                    localStorage.username = data.data.username;
                    localStorage.email = data.data.email;
                } else if (data.errors) {
                    alert(JSON.stringify(data.errors));
                }
            });
            // axios
            // .patch(`http://localhost:4000/api/users/${this.userId}`,{
            //     username: this.username,
            //     email: this.email,
            // })
            // .then(Response => (this.info = Response.data)) 
            // .catch((error) => { console.log('Error', error.message); this.info = null;
            // });
        }
    }
}
</script>

<style>
.buttonstyle {
  margin-top: 30px;
  width: 100%;
  background-color: #795548 !important;
  font-family: Florance;
}
</style>