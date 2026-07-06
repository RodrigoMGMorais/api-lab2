#!/bin/bash

# Script de Health Check - Desenvolvido para Diagnóstico Rápido
# Objetivo: Coletar status geral de CPU, RAM, Disco e Serviços em segundos.

echo "=========================================="
echo "      CHECK-UP DE SISTEMA: $(date)"
echo "=========================================="

# 1. Load Average (CPU)
echo -e "\n[CPU - Carga do Sistema]"
uptime

# 2. Memória RAM
echo -e "\n[Memória RAM]"
free -m | grep Mem | awk '{print "Total: "$2"MB | Usado: "$3"MB | Livre: "$4"MB"}'

# 3. Espaço em Disco (Partições principais)
echo -e "\n[Uso de Disco]"
df -h | grep '^/'

# 4. Processos que mais consomem CPU
echo -e "\n[Top 3 Processos (CPU)]"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 4

# 5. Portas abertas (Serviços rodando)
echo -e "\n[Serviços em execução (Portas)]"
ss -tulpn | grep LISTEN

echo -e "\n=========================================="
echo "           FIM DO CHECK-UP"
echo "=========================================="
