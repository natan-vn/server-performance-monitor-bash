# Server Stats

Script em Bash criado como exercício de estudo para consultar informações básicas de desempenho de um servidor Linux.

## Funcionalidades

O script `server-stats.sh` exibe:

- Uso total da CPU e percentual ocioso
- Memória total, usada e livre, com percentuais
- Espaço total, usado e livre da partição  /, com percentuais
- Os cinco processos com maior uso de CPU
- Os cinco processos com maior uso de memória.

Os valores representam uma amostra do estado da máquina no momento da execução. A memória livre segue o valor reportado pelo comando `free`; o uso de disco é consultado somente para a partição raiz.

https://github.com/natan-vn/server-performance-monitor-bash
