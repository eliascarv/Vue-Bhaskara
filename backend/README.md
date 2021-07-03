# API Bhaskara
Uma API escrita na linguagem Julia usando os pacotes HTTP.jl e JSON3.jl. A API recebe como parâmetro um JSON no formato: `{"a":val_a,"b":val_b,"c":val_c}`, sendo que `val_a`, `val_b` e `val_c` devem ter tipo numérico, e retorna outro JSON no formato: `{"x1": raiz1, "x2":raiz2}`, sendo que `raiz1` e `raiz2` são strings pois o formato JSON não suporta números complexos.

## Setup do projeto
Caso você já tenha executado o comando `npm run backend-install` na pasta principal do projeto, os passos abaixo podem ser ignorados.
Para rodar o script da API, primeiramente instale as dependencias ativando o env Julia.
Para ativar o ambiente abra o REPL do Julia nessa pasta, entre no modo Pkg com clicando em ],
e digite o comando `activate .` para ativar o ambiente.
Após isso, ainda no modo Pgk instale as dependencias com o comando `instatiate`.
```julia-repl
(@v1.6) pkg> activate .
(backend) pkg> instantiate
```
Após isso, apenas execute o script.