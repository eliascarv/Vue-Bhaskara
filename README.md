# Vue-Bhaskara
Um pequeno web app escrito em VueJS que usa uma API escrita na linguagem Julia para o cálculo das raízes de uma função do segungo grau.
O código da API Julia se encontra na pasta backend.
Cabe salientar que os comandos abaixo devem ser executados na pasta principal do projeto.

## Setup do Frontend
Para instalar as dependências do frontend execute o seguinte comando:
```
npm install
```

### Compilar o Frontend no ambinete de desenvolvimento
Para executar o frontend execute o seguinte comando:
```
npm run serve
```

### Compilar para produção
Para compilar o código do frontend paraum código que seja executável no navegador sem a necessidade do NodeJS execute o seguinte comando:
```
npm run build
```
## Setup do Backend
Primeiro, instale a linguagem de programação Julia no seu PC, após isso, execute o seguinte comando para instalar as dependências da API:
```
npm run backend-install
```
### Executando o Backend
Dentro da pasta principal do projeto, abra o um novo terminal e execute o comando:
```
npm run backend
```