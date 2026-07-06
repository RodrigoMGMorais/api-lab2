### Este guia contém os comandos mais eficazes para troubleshooting de sistemas, redes e APIs.

## 1. Diagnóstico de Conectividade e APIs (cURL)
Verificação detalhada (O padrão para análise):
curl -v https://api.exemplo.com

## Verificar apenas o Status HTTP (Rápido):
curl -I https://api.exemplo.com

## Teste com Autenticação:
curl -v -H "Authorization: Bearer <SEU_TOKEN>" https://api.exemplo.com/endpoint

## Enviar JSON (Simular POST):
curl -v -X POST -H "Content-Type: application/json" -d '{"data": "teste"}' https://api.exemplo.com/endpoint

---
## 2. Logs e Monitoramento (tail, journalctl)
Seguir logs (Resistente a rotação de arquivo):
tail -F /var/log/app.log

## Monitorar logs filtrando erros em tempo real:
tail -F /var/log/syslog | grep -i "error"

## Ver logs de serviço moderno (systemd):
journalctl -u nginx -f -x

---
## 3. Saúde do Sistema (Recursos)
Visualização de processos e carga (Interativo):
htop (ou top)

## Verificar memória RAM disponível:
free -m

## Verificar espaço em disco:
df -h

## Verificar portas abertas e processos:
ss -tulpn

---
## 4. O "Canivete Suíço" para Logs
Encontrar "agullha no palheiro":
grep -rinC 3 "error" /var/log/
(Busca recursiva, ignora case, exibe nº da linha e 3 linhas de contexto).

## Dica de Ouro para seu Git/Repositório:
Se você usar o VS Code, pode criar um arquivo com esses comandos e usar a extensão "Runner" 
ou simplesmente deixar este arquivo aberto em uma aba para "copiar e colar" durante incidentes. 
Isso reduz o tempo de reação de minutos para segundos.

---
### Esse é o comando correto e mais fundamental para realizar um teste de conectividade com o curl.

Ao executar curl -v https://api.exemplo.com, você está dizendo ao seu sistema:

curl: "Inicie uma requisição HTTP/HTTPS".

-v (Verbose): "Seja detalhista! Me mostre tudo o que está acontecendo por trás dos panos".
https://api.exemplo.com: "Este é o alvo".

## O que você verá na tela (e como interpretar):
Como você usou a flag -v, a resposta do terminal será rica em informações técnicas que são ouro para um analista:

* Trying 192.0.2.1:443...: O curl resolveu o DNS e está tentando conectar no IP do servidor pela porta 443 (HTTPS). 
Se parar aqui, você já sabe que o problema é rede ou DNS.

* Connected to api.exemplo.com (192.0.2.1) port 443: Conexão TCP estabelecida.

* SSL certificate verify ok: O handshake TLS foi bem-sucedido. Se falhar aqui, você encontrou um problema de certificado SSL/TLS.

> GET / HTTP/1.1: O comando enviado para o servidor.

< HTTP/1.1 200 OK: A resposta do servidor. Aqui está a confirmação se a API está funcionando ou não.

## Quando você precisará "incrementar" esse comando?
O exemplo que você escreveu é perfeito para testes de disponibilidade. Mas, no seu dia a dia profissional, 
você provavelmente usará variações mais específicas dependendo da necessidade:

## Se a API exigir autenticação:
curl -v -H "Authorization: Bearer SEU_TOKEN" [https://api.exemplo.com](https://api.exemplo.com)

## Se você precisar enviar dados (JSON) para a API:
curl -v -X POST -H "Content-Type: application/json" -d '{"id": 1}' [https://api.exemplo.com](https://api.exemplo.com)

## Se você quiser apenas o "status" (para economizar tempo/banda):
curl -I [https://api.exemplo.com](https://api.exemplo.com) (O -I mostra apenas os cabeçalhos, sem o corpo da resposta).

## Dica de Especialista: Sempre que estiver investigando uma falha que parece "intermitente" ou que acontece apenas em horários de pico, 
use o -v. Ele te mostrará se o servidor está demorando para responder (latência) 
ou se ele está recusando a conexão ativamente (erro de firewall ou serviço fora).
