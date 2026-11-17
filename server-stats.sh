#!/bin/bash

echo "Iniciando script de conferência da máquina..."
sleep 1

# ==== VERIFICAÇÃO DA MEMORIA ====
MEM_TOTAL=$(free -m | awk 'NR==2 {print $2}')
MEM_USADA=$(free -m | awk 'NR==2 {print $3}')
MEM_FREE=$(free -m | awk 'NR==2 {print $4}')
MEM_USADA_PORCENTAGEM=$(awk "BEGIN {printf \"%.2f\", ($MEM_USADA/$MEM_TOTAL)*100}")
MEM_FREE_PORCENTAGEM=$(awk "BEGIN {printf \"%.2f\", ($MEM_FREE/$MEM_TOTAL)*100}" )

echo "=== STATUS MEMORIA ==="
echo "Memoria Total: $MEM_TOTAL MB | Usada: $MEM_USADA MB ($MEM_USADA_PORCENTAGEM%) | Livre: $MEM_FREE MB ($MEM_FREE_PORCENTAGEM%)"

# ==== VERIFICAÇÃO DO DISCO ====
DISCO_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISCO_USADO=$(df -h / | awk 'NR==2 {print $3}')
DISCO_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISCO_USADO_PORCENTAGEM=$(df -h / | awk 'NR==2 {print $5}')
DISCO_FREE_PORCENTAGEM=$(df -h / | awk 'NR==2 {print 100 - $5}')

echo "=== STATUS DISCO ==="
echo "Espaço total: $DISCO_TOTAL| Armazenado: $DISCO_USADO ($DISCO_USADO_PORCENTAGEM%) | Livre: $DISCO_FREE ($DISCO_FREE_PORCENTAGEM%) "

# ==== VERIFICAÇÃO DA CPU: ===
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USADA=$(awk "BEGIN {print 100 - $CPU_IDLE}")

echo "=== STATUS CPU ==="
echo "Uso da CPU: $CPU_USADA% | Livre: $CPU_IDLE%"

# ==== TOP 5 PROCESSOS EM ANDAMENTO: ===
echo "=== TOP 5 PROCESSOS (CPU) ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo "=== TOP 5 PROCESSOS (MEMÓRIA) ==="
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6