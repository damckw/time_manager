<template>
    <div>
        <b-container fluid>
            <b-form-group label-cols="6" label-cols-lg="4" label="Username" label-for="input-default">
                <b-form-input v-model="username" type="text"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Email" label-for="input-default">
                <b-form-input v-model="email" type="text"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Password" label-for="input-default">
                <b-form-input v-model="password" type="password"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Confirm Password" label-for="input-default">
                <b-form-input v-model="password_confirmation" type="password"/>
            </b-form-group>
            <b-form-group label-cols="6" label-cols-lg="4" label="Role" label-for="input-default">
                <b-form-input v-model="role" type="text"/>
            </b-form-group>
            <b-button class="buttonstyle" v-on:click="onSubmit">Create</b-button>
        </b-container>
    </div>
</template>

<script>
export default {
    name: 'CreateUser',
    data () {
        return {
            email: "",
            username: "",
            role: "",
            password: "",
            password_confirmation: ""
        }
    },
    methods: {
        onSubmit() {
            var data = {
                    email: this.email,
                    username: this.username,
                    password: this.password,
                    password_confirmation: this.password_confirmation,
                    role: this.role
                }
            fetch(`http://localhost:4000/api/users/`, {
                method: 'POST',
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
                if (data.error) {
                    alert(JSON.stringify(data.errors));
                } else {
                    alert("User Succesfully Created!");
                }
            });
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