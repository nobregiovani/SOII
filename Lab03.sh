#1. Instalação do Samba

sudo apt-get update
sudo apt-get install samba

#2. Adicionar usuários ao Samba

sudo smpasswd -a dev_senior
sudo smpasswd -a dev_junior

#3. Criar diretórios para compartilhamento

sudo mkdir -p /srv/samba/publico
sudo chown nobody:nogroup /srv/samba/publico
sudo chmod 777 /srv/samba/publico

#4. Configurar os compartilhamentos

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp

sudo nano /etc/samba/smb.conf
[Publico]
comment = Compartilhamento Publico de Arquivos
path = /srv/samba/publico
browsable = yes
writable = yes
guest ok = yes
read only = no

[Projetos]
comment = Acesso restrito para a Equipe de Desenvolvimento
path = /srv/projetos
valid users = @desenvolvedores
read only = no
browsable = yes
writable = yes

#5. Reiniciar e testar

sudo systemctl restart smbd
#output
enable; preset: enabled
active: active (running) since Mon 2025-09-15 14:36:40 -03; 4min 12s ago

sudo systemctl restart nmbd
#output
enable; preset: enabled
active: active (running) since Mon 2025-09-15 14:37:11 -03; 11min ago


testparm
Load smb config files from /etc/samba/smb.conf
Loaded services files ok.
[publico]
comment = Compartilhamento publico de arquivos
guest ok = yes
path = /srv/samba/publico
read only = no

[projetos]
comment = Acesso restrito para a equipe de desenvolvedores
path = /srv/projetos
read only = no
valid users = @desenvolvedores
