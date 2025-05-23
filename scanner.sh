#!/bin/bash

# Verifica se está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root (use sudo)."
  exit 1
fi

#Verifica se o programa nmap está instalado
if [ -e "/bin/nmap" ] ;then
  # Solicita a faixa de IPs
  read -p "Digite a faixa de IP (ex: 192.168.1.0/24): " REDE
  # Realiza a varredura de descoberta de hosts
  nmap -sn "$REDE" -oG - | awk '/Up$/{print $2}' > ips_ativos.txt
# Desculpe por mas os IFs foram a unica forma que encontrei para instalar o nmap
else
  name=$(cat /etc/os-release | grep -w "NAME" | cut -d '"' -f2)
  if [ "$name" == 'Fedora Linux' ]; then
    dnf install nmap -y
  fi
  if [ "$name" == 'Ubuntu' ]; then
    apt install nmap -y
  fi
  if [ "$name" == 'Linux Mint' ]; then
    apt install nmap -y
  fi
  if [ "$name" == 'Debian GNU/Linux' ]; then
    apt install nmap -y
  fi
  if [ "$name" == 'Pop!_OS' ]; then
    apt install nmap -y
  fi
  if [ "$name" == 'Kali Linux' ]; then
    apt install nmap -y
  fi
  if [ "$name" == '' ]; then
    echo "Não foi possível identificar o sistema operacional. Por favor, instale o nmap manualmente."
    exit 1
  fi
fi

# Exibe cabeçalho
echo ""
echo "IP              | Status   | Hostname               | MAC (Fabricante)"
echo "--------------------------------------------------------------------------"

# Loop pelos IPs ativos
while read ip; do
    # Resolve o nome do host (DNS reverso)
    nome=$(dig +short -x "$ip" | sed 's/\.$//')
    [ -z "$nome" ] && nome=""

    # Captura MAC + Fabricante do Nmap
    mac_info=$(nmap -sn "$ip" | grep "MAC Address" | sed 's/MAC Address: //')
    [ -z "$mac_info" ] && mac_info=""

    # Exibe resultado formatado
    printf "%-15s | %-8s | %-22s | %s\n" "$ip" "ONLINE" "$nome" "$mac_info"
done < ips_ativos.txt

# Remove arquivo temporário
rm -f ips_ativos.txt
