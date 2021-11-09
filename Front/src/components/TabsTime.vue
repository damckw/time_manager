<template>
  <div id="app">
    <b-card title="Card Title" style="max-width: 50rem;" class="mb-2" >
    <b-row>
      <b-col md="auto">
        <b-calendar v-model="value" @context="onContext" locale="en-US"></b-calendar>
      </b-col>
      <b-col md="auto">
        <b-calendar v-model="value1" @context="onContext" locale="en-US"></b-calendar>
      </b-col>
    </b-row>
          <b-button style="width: 100px; height: 50px" v-on:click="setValue">Validate</b-button>

    <template>
  <div>
    <mdb-tbl>
      <mdb-tbl-body>
        <tr>
          <th>1</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th>2</th>
          <td>Jacob</td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th>3</th>
          <td>Larry</td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>
      </mdb-tbl-body>
    </mdb-tbl>
  </div>
</template>

  </b-card>
  </div>
</template>

<script>
import axios from 'axios'
export default {
    name:"TabsTime",
    data() {
      return {
        value: '',
        context: null,
        value1: '',
        context1: null,

      }
    },
    methods: {
      onContext(ctx) {
        this.context = ctx
      },
      onContext1(ctx) {
        this.context1 = ctx
      },
      setValue: function() {
        axios
        .get(`http://localhost:4000/api/workingtimes/:7`, {
          start: this.value,
          end: this.valu1,
        })
      }
    }
};
</script>

<style>

</style>