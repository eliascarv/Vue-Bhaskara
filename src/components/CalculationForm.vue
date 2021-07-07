<template>
  <div>
    <form @submit="calculteBhaskara($event)">
      <p>Raízes (x1 e x2) da equação: ax² + bx + c</p>
      <p>Insira o valor de a (a ≠ 0):</p>
      <input type="number" v-model="a" /><br />
      <p>Insira o valor de b:</p>
      <input type="number" v-model="b" /><br />
      <p>Insira o valor de c:</p>
      <input type="number" v-model="c" /><br />
      <button type="submit">Calcular</button>
      <p>Equação: {{ equation }} </p>
      <p>Raízes:</p>
      <p>x1 = {{ x1 }}</p>
      <p>x2 = {{ x2 }}</p>
    </form>
  </div>
</template>

<script>
import MathAPI from '../services/MathAPI.js'

export default {
  name: 'CalculationForm',
  data() {
    return {
      a: '',
      b: '',
      c: '',
      x1: '',
      x2: '',
      equation: ''
    }
  },
  methods: {
    async calculteBhaskara(event) {
      event.preventDefault();

      const a = parseInt(this.a);
      const b = parseInt(this.b);
      const c = parseInt(this.c);

      this.x1 = "Calculando...";
      this.x2 = "Calculando...";
      
      const data = {
        a: a,
        b: b,
        c: c
      }

      this.equation = this.showEquation(a, b, c)

      const roots = await MathAPI.bhaskara(data);

      this.x1 = roots.x1;
      this.x2 = roots.x2;

      this.a = '';
      this.b = '';
      this.c = '';
    },

    showEquation(a, b, c) {
      if (a == 1) {
        a = ''
      }

      if (b < 0) {
        b = "- " + Math.abs(b)
      } else {
        b = "+ " + b
      }

      if (c < 0) {
        c = "- " + Math.abs(c) 
      } else {
        c = "+ " + c
      }

      return a + "x² " + b + "x " + c
    }
  }
}
</script>

<style scoped>
div {
  display: flex;
  justify-content: center;
}

form {
  padding: 30px;
  margin: 30px;
  border: solid rgba(0, 0, 0, 0.12) 2px;
  border-radius: 5px;
  width: 500px;
  display: flex;
  flex-direction: column;
}

input {
  padding-left: 12px;
  height: 30px;
  margin-top: 5px;
  margin-bottom: 5px;
  border: solid rgba(0, 0, 0, 0.12) 2px;
  border-radius: 5px;
}

input:focus {
  outline-color: rgba(0, 0, 0, 0.30);
}

button {
  margin-top: 10px;
  border: solid rgba(0, 0, 0, 0.12) 2px;
  background-color: white;
  height: 36px;
  min-width: 64px;
  max-width: 100px;
  border-radius: 5px;
  padding-left: 16px;
  padding-right: 16px;
  align-self: flex-end;
}

button:hover {
  background-color: rgba(0, 0, 0, 0.05);
}

button:active {
  background-color: rgba(0, 0, 0, 0.15);
}

p {
  margin-bottom: 5px;
}
</style>
