# api-lab2
Repositório de "Laboratório de APIs"

# Lab: Diagnóstico de APIs com cURL

Este repositório contém um laboratório prático de diagnóstico de APIs REST utilizando ferramentas de linha de comando. O foco é entender o comportamento do protocolo HTTP e a análise de respostas (payloads e status codes).

## Objetivo
* Dominar o uso do `cURL` para testes de conectividade.
* Aprender a interpretar Status Codes (2xx, 4xx, 5xx).
* Praticar a documentação técnica de incidentes.

## Tecnologias Utilizadas
* **cURL**: Ferramenta de linha de comando para transferência de dados.
* **JSON**: Formato de troca de dados.
* **Markdown**: Linguagem de marcação para documentação.

## Estrutura do Projeto
* `diagnostico.md`: Relatório técnico com testes de conectividade e análise de logs.

## Como utilizar
Para replicar os testes, utilize o terminal em ambiente Linux/Bash e execute o comando:
```bash
curl -v [https://jsonplaceholder.typicode.com/posts/1](https://jsonplaceholder.typicode.com/posts/1)