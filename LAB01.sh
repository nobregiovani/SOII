# 1. Criação de grupos

sudo groupadd desenvolvedores
sudo grouppadd testadores

desenvolvedores:x:1001:
testadores:x:1002

#2. Criação de usuários

sudo useradd -m -g desenvolvedores dev_senior
sudo useradd -m -g desenvolvedores dev_junior
sudo useradd -m -g testadores qa_analyst
sudo usermod -aG testadores dev_senior

dev_senior:x:1001:1001::/home/dev_senior:/bin/sh
dev_junior:x:1002:1001::/home/dev_junior:/bin/sh

#3. Definição de senhas

sudo passwd dev_senior
sudo passwd dev_junior
sudo passwd qa_analyst

su - dev_senior

senha: devsenior
$

su - dev_junior

senha: devjunior
$

su - qa_analyst

senha: qaanalyst
$

#4. Estrutura de diretórios

sudo mkdir -p /srv/projetos/backend
sudo mkdir -p /srv/projetos/frontend

dir /srv/projetos

backend frontend

#5. Gerenciamento de permissões

sudo chown -R dev_senior:desenvolvedores /srv/projetos
sudo chmod -R 750 /srv/projetos



#6. Controle de processos

login Robson
sleep 500 &
ps aux | grep sleep

