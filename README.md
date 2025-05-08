# Scanner de Rede

Um script Bash simples que realiza uma varredura em uma faixa de IP, identificando hosts ativos, seus hostnames e endereços MAC com fabricante.

## Pré-requisitos

Este script depende das seguintes ferramentas:

- `nmap`
- `dig` (normalmente parte do pacote `dnsutils`)
- `awk`, `grep`, `sed` (já vêm instalados por padrão em distribuições Linux)

## Uso

```bash
sudo ./scanner.sh
