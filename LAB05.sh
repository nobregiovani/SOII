#1. Configurar o Firewall com IPTABLES

nano firewall.sh
# !/bin/bash
iptables -F
iptables -X
ipdatbles -P INPUT DROP
ipdatables -P FORWARD DROP
ipdatables -P OUTPUT ACCEPT
ipdatables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 2244 -j ACCEPT
iptables -A INPUT-p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
echo "Firewall configurado!"
iptables -L -n -v

chmod +x firewall.sh
sudo ./firewall.sh

#2. Instalar e Configurar o Proxy(Squid)

sudo apt-get install squid

sudo nano /etc/squid/sites_bloqueados.txt
.facebook.com
.twitter.com
.instagram.com

sudo nano /etc/squid/squid.conf
acl sites_bloqueados dstdomain "/etc/squid/sites_bloqueados.txt"
http_access deny sites_bloqueados

#3. Reiniciar e testar

sudo systemctl restart squid
