# Teste de Verbos HTTP

## 1. POST (Criar um novo recurso)
O `POST` é usado para enviar dados ao servidor.
```Bash

curl -X POST -H "Content-Type: application/json" \
     -d '{"title": "Teste Rodrigo", "body": "Conteúdo de teste", "userId": 1}' \
     https://jsonplaceholder.typicode.com/posts
```

```Bash
curl -X POST -H "Content-Type: application/json" -d '{"title": "Teste Rodrigo", "body": "Conteúdo de teste", "userId": 1}' https://jsonplaceholder.typicode.com/posts
```
## Resultado:
{
  "title": "Teste Rodrigo",
  "body": "Conteúdo de teste",
  "userId": 1,
  "id": 101
}

"Aqui...Eu utilizo o método POST, definindo o header Content-Type: application/json e enviando o objeto no corpo da requisição (payload). Valido a criação conferindo se o servidor retorna o status 201 Created e o identificador do novo recurso."
