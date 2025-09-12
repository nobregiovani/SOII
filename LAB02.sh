#1. Instalação do Servidor OpenSSH

sudo apt-get update
sudo apt-get install openssh-server

sudo systemctl status ssh
Active: inactive (dead)

#2. Acesso inicial (Validação)

ssh robson@10.0.2.15

#3. Configuração de segurança

sudo cp /etc/ssh/ssh_config /etc/ssh/sshf_config.bkp

sudo nano /etc/ssh/sshd_config
Port 2244
PermitRootLogin no

#4. Teste e Validação Final

sudo systemctl restart ssh

ssh robson@10.0.2.15 -p 2244
ssh:connect to host 10.0.2.15 port 2244: Connection refused

ssh root@10.0.2.15 -p 2244
ssh:connect to host 10.0.2.15 port 2244: Connection refused
