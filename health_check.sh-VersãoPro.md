## Adicionar um rastreador de erros ao seu script é um salto de nível. 
Vamos incrementar a seção final para que ele procure automaticamente por palavras-chave de "estresse" 
nos logs do sistema e do Nginx.

### health_check.sh (Versão Pro):
```bash
#!/bin/bash

# Script de Health Check - Versão Avançada com Auditoria de Logs

echo "===================================================="
echo "      RELATÓRIO DE SAÚDE DO SISTEMA: $(date)"
echo "===================================================="

# 1. Load Average (CPU)
echo -e "\n[CPU - Carga]"
uptime

# 2. Memória RAM
echo -e "\n[Memória RAM]"
free -m | grep Mem | awk '{print "Total: "$2"MB | Usado: "$3"MB | Livre: "$4"MB"}'

# 3. Disco
echo -e "\n[Uso de Disco]"
df -h | grep '^/'

# 4. Top Processos
echo -e "\n[Top 3 Processos (CPU)]"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 4

# 5. Auditoria de Logs (Novidade)
echo -e "\n[Análise de Logs - Últimos Erros Críticos]"

# Verifica se existe log do sistema e busca por termos de erro
if [ -f /var/log/syslog ]; then
    echo ">> Logs do Sistema (Últimas 5 ocorrências de erro):"
    tail -n 500 /var/log/syslog | grep -Ei "error|critical|fail" | tail -n 5
else
    echo ">> Aviso: Arquivo /var/log/syslog não encontrado."
fi

# Verifica log do Nginx se existir
if [ -f /var/log/nginx/error.log ]; then
    echo -e "\n>> Logs Nginx (Últimas 5 ocorrências de erro):"
    tail -n 50 /var/log/nginx/error.log | tail -n 5
fi

echo -e "\n===================================================="
echo "           FIM DO RELATÓRIO"
echo "===================================================="
```
---

### O que mudou e por que é mais inteligente?
grep -Ei: O -E permite usar expressões regulares estendidas (buscando error OU critical OU fail ao mesmo tempo), 
e o -i torna a busca case-insensitive.

### Verificação de existência (if [ -f ... ]): 
O script agora é "à prova de erros". 
Ele não vai reclamar se o arquivo de log não existir; ele apenas ignora e segue para a próxima verificação.

### Filtragem em duas etapas: 
Ele pega as últimas 500 linhas (tail -n 500) antes de filtrar os erros. 
Isso garante que você não leia um log de meses atrás, focando apenas no que aconteceu recentemente.


* Dica de Especialista: Se você trabalha com diversos clientes ou servidores com nomes de logs diferentes 
(alguns usam /var/log/messages em vez de /var/log/syslog), você pode adicionar um comando ls /var/log/ 
no topo do script para verificar rapidamente quais arquivos de log existem na máquina antes de rodar a auditoria.

### Este script agora não apenas te dá o status "vivo ou morto" do servidor, 
### mas te dá a causa raiz imediata de qualquer interrupção de serviço.

