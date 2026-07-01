Diagnóstico de API - Teste de Conectividade
1. Cenário
Simulação de consulta em API pública de dados (jsonplaceholder.typicode.com) para validação de conectividade e análise de cabeçalhos de resposta HTTP.

2. Comando cURL
Bash
curl -v https://jsonplaceholder.typicode.com/posts/1
3. Resultado Esperado
Status Code: 200 OK (A requisição foi processada com sucesso).

Payload: Retorno do objeto JSON correspondente ao post de ID 1.

4. Diagnóstico de Erros Comuns
404 Not Found: O endpoint solicitado não existe. Verifique se o ID informado na URL está correto.

401/403 Unauthorized/Forbidden: Falha de autenticação. Verifique se o header Authorization está presente e com um token válido.

5xx (Server Error): Instabilidade no serviço da API. A falha ocorre no servidor, não na sua requisição.

---
## Análise de Logs
Aqui colarei o retorno do comando curl -v para referência futura.

```bash

ts/1
* Host jsonplaceholder.typicode.com:443 was resolved.
* IPv6: 2606:4700:3037::ac43:a797, 2606:4700:3033::6815:3b13
* IPv4: 172.67.167.151, 104.21.59.19
*   Trying 172.67.167.151:443...
* Connected to jsonplaceholder.typicode.com (172.67.167.151) port 443
* ALPN: curl offers h2,http/1.1
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384 / X25519 / id-ecPublicKey
* ALPN: server accepted h2
* Server certificate:
*  subject: CN=typicode.com
*  start date: May 31 21:45:38 2026 GMT
*  expire date: Aug 29 22:44:15 2026 GMT
*  subjectAltName: host "jsonplaceholder.typicode.com" matched cert's "*.typicode.com"
*  issuer: C=US; O=Google Trust Services; CN=WE1
*  SSL certificate verify ok.
*   Certificate level 0: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA256
*   Certificate level 1: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA384
*   Certificate level 2: Public key type EC/secp384r1 (384/192 Bits/secBits), signed using ecdsa-with-SHA384
* using HTTP/2
* [HTTP/2] [1] OPENED stream for https://jsonplaceholder.typicode.com/posts/1
* [HTTP/2] [1] [:method: GET]
* [HTTP/2] [1] [:scheme: https]
* [HTTP/2] [1] [:authority: jsonplaceholder.typicode.com]
* [HTTP/2] [1] [:path: /posts/1]
* [HTTP/2] [1] [user-agent: curl/8.5.0]
* [HTTP/2] [1] [accept: */*]
> GET /posts/1 HTTP/2
> Host: jsonplaceholder.typicode.com
> User-Agent: curl/8.5.0
> Accept: */*
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* old SSL session ID is stale, removing
< HTTP/2 200 
< date: Wed, 01 Jul 2026 11:42:35 GMT
< content-type: application/json; charset=utf-8
< content-length: 292
< access-control-allow-credentials: true
< cache-control: max-age=43200
< etag: W/"124-yiKdLzqO5gfBrJFrcdJ8Yq0LGnU"
< expires: -1
< nel: {"report_to":"heroku-nel","response_headers":["Via"],"max_age":3600,"success_fraction":0.01,"failure_fraction":0.1}
< pragma: no-cache
< report-to: {"group":"heroku-nel","endpoints":[{"url":"https://nel.heroku.com/reports?s=T5%2FjfP6vzKyFkSZRvHeYIvi9ARPjygOdHgdruKvIRPk%3D\u0026sid=e11707d5-02a7-43ef-b45e-2cf4d2036f7d\u0026ts=1778158983"}],"max_age":3600}
< reporting-endpoints: heroku-nel="https://nel.heroku.com/reports?s=T5%2FjfP6vzKyFkSZRvHeYIvi9ARPjygOdHgdruKvIRPk%3D&sid=e11707d5-02a7-43ef-b45e-2cf4d2036f7d&ts=1778158983"
< retry-after: 60
< server: cloudflare
< vary: Origin, Accept-Encoding
< via: 2.0 heroku-router
< x-content-type-options: nosniff
< x-powered-by: Express
< x-ratelimit-limit: 1000
< x-ratelimit-remaining: 0
< x-ratelimit-reset: 1778159036
< age: 5392
< accept-ranges: bytes
< cf-cache-status: HIT
< cf-ray: a14525ed9c582201-IAD
< alt-svc: h3=":443"; ma=86400
< 
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
* Connection #0 to host jsonplaceholder.typicode.com left intact
```

## Para ver apenas JSON:
curl -s https://jsonplaceholder.typicode.com/posts/1
(A flag -s significa "silent", ela remove aqueles logs técnicos que começam com *, < e > e te mostra apenas o JSON. Você verá o } perfeitamente).
ou
curl -s https://jsonplaceholder.typicode.com/posts/1 | jq
(O | (pipe) joga a resposta do curl para dentro do jq, que organiza o JSON com indentação automática).

```
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
```
