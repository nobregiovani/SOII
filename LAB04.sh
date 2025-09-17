#1. Instalar e Configurar o Servidor Web (Apache)

sudo atp-get update
sudo apt-get install apache2

echo '<h1>Bem-vindo ao Servidor Web da Empresa!</h1>' | sudo tee /var/www/html/index.html
Bem-vindo ao Servidor Web da Empresa!

#noNavegador
http:10.0.2.15

#2. Instalar e Configurar o Servidor DNS (BIND9)

sudo apt-get install bind9

sudo nano /etc/bind/named.conf.local
zone"empresa.local"{
type master;
file "etc/bind/db.empresa.local";
};

sudo nano /etc/bind/db.empresa.local
$TTL 604800
@ IN SOA ns1.empresa.local.root.empresa.local. (
2 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ); Negative Cache TTL
;
@IN NS ns1.empresa.local.
ns1 IN A 10.0.2.15
www IN A 10.0.2.15

#3. Reiniciar, Configurar Cliente e Testar

sudo systemctl restart bind9

sudo nano /etc/resolv.conf:

nameserver 127.0.0.1

dig www.empresa.local

curl http://www.empresa.local
