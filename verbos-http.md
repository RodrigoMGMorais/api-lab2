# Teste de Verbos HTTP

## 1. POST (Criar um novo recurso)
O `POST` é usado para enviar dados ao servidor.
```bash

curl -X POST -H "Content-Type: application/json" \
     -d '{"title": "Teste Rodrigo", "body": "Conteúdo de teste", "userId": 1}' \
     https://jsonplaceholder.typicode.com/posts
```

## Comando:
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

---
## 2. PUT (Atualizar recurso)
O `PUT` substitui todo o objeto. É ideal para edições completas.

```bash
curl -X PUT -H "Content-Type: application/json" \
     -d '{"id": 1, "title": "Título Alterado", "body": "Conteúdo Atualizado", "userId": 1}' \
     https://jsonplaceholder.typicode.com/posts/1
```     
## Comando:
curl -X PUT -H "Content-Type: application/json" -d '{"id": 1, "title": "Título Alterado", "body": "Conteúdo Atualizado", "userId": 1}' https://jsonplaceholder.typicode.com/posts/1

## RESULTADO:
{
  "id": 1,
  "title": "Título Alterado",
  "body": "Conteúdo Atualizado",
  "userId": 1
}

-H "Content-Type: application/json": É obrigatório. Sem ele, o servidor não sabe que o que você está enviando é um JSON e tenta ler de forma errada, causando o "malformed input".

Aspas Simples vs Duplas: O -d (data) precisa das aspas simples ' por fora para proteger as aspas duplas " que compõem o seu JSON.

---
## 3. DELETE (Remover recurso)
O DELETE remove o recurso do servidor.

## Comando:
curl -X DELETE [https://jsonplaceholder.typicode.com/posts/1](https://jsonplaceholder.typicode.com/posts/1)