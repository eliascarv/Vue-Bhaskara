<template>
  <Header />
  <CalculationForm />
</template>

<script>
import Header from './components/Header.vue'
import CalculationForm from './components/CalculationForm.vue'

export default {
  name: 'App',
  components: {
    Header,
    CalculationForm
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