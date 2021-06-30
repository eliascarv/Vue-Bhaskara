<template>
  <Header />
  <Formulario />
</template>

<script>
import Header from './components/Header.vue'
import Formulario from './components/Formulario.vue'

export default {
  name: 'App',
  components: {
    Header,
    Formulario
  }
}
</script>

<style>
@font-face {
  font-family: Inter;
  src: url('/fonts/Inter-VariableFont.ttf');
}

* {
  font-family: Inter, sans-serif;
}

body {
  margin: 0px;
}
</style>