<template>
  <div>
    <form @submit="enviarForm($event)">
      <p>Raízes (x1 e x2) da equação: ax² + bx + c</p>
      <p>Insira o valor de a:</p>
      <input type="number" v-model="a" /><br />
      <p>Insira o valor de b:</p>
      <input type="number" v-model="b" /><br />
      <p>Insira o valor de c:</p>
      <input type="number" v-model="c" /><br />
      <button type="submit">Calcular</button>
      <p>Resultado:</p>
      <p>x1 = {{ x1 }}</p>
      <p>x2 = {{ x2 }}</p>
    </form>
  </div>
</template>

<script>
export default {
  name: 'Formulario',
  data() {
    return {
      a: '',
      b: '',
      c: '',
      x1: '',
      x2: ''
    }
  },
  methods: {
    enviarForm(evento) {
      evento.preventDefault()

      const a = parseInt(this.a)
      const b = parseInt(this.b)
      const c = parseInt(this.c)

      fetch('http://192.168.10.79:8081/bhaskara', {
        method: "POST",
        body: JSON.stringify({a: a, b: b, c: c})
      })
        .then(response => response.json()) 
        .then(json => {
          this.x1 = json.x1 
          this.x2 = json.x2
        })
        .catch(err => console.log(err));
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
  /* width: 490px; */
  margin-top: 5px;
  margin-bottom: 5px;
  border: solid rgba(0, 0, 0, 0.12) 2px;
  border-radius: 5px;
}

input:focus {
  outline-color: rgba(0, 0, 0, 0.30);
}

button {
  /* margin-left: 426px; */
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

/* button:hover {
  background-color: rgba(0, 0, 0, 0.05);
} */

button:active {
  background-color: rgba(0, 0, 0, 0.05);
}

p {
  margin-bottom: 5px;
}
</style>