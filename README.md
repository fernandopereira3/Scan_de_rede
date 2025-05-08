# Scanner de Rede

Este é um script Bash simples para realizar a varredura em uma faixa de IP, identificando hosts ativos na rede e coletando informações sobre o hostname e endereço MAC (com o fabricante). É útil para obter uma visão rápida dos dispositivos conectados à sua rede local.

## Pré-requisitos

Este script depende das seguintes ferramentas:

- `nmap` – Ferramenta de varredura de rede.
- `dig` – Ferramenta para resolver nomes de domínio (DNS reverso).
- `awk`, `grep`, `sed` – Ferramentas para processamento de texto (normalmente já instaladas em distribuições Linux).

## Uso

# Clone o repositório (ou entre no diretório onde está o script)
  ```bash
git clone https://github.com/seu-usuario/scanner-de-rede.git
cd scanner-de-rede

# Torne o script executável
chmod +x scanner.sh

# Execute o script como root
sudo ./scanner.sh
