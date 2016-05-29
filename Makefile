ping: ssh-config
	ansible -i hosts.ini -m ping all

playbook: roles/consul roles/vault
	ansible-playbook -i hosts.ini playbook.yml

roles/consul roles/vault:
	ansible-galaxy install -r requirements.yml

ssh-config:
	vagrant ssh-config > ssh-config


.PHONEY: consul-start consul-join consul-clear \
	 vault-init

#consul-join:
#	ansible -i hosts.ini -m shell all -l node1,node2
#	  -a "/usr/local/sbin/consul join 192.168.50.200"

vault-init:
	ansible -m shell -i hosts.ini all -l node0 \
	  -a "VAULT_ADDR=http://127.0.0.1:8200 /usr/local/sbin/vault init"

vault-stop:
	ansible -m shell -i hosts.ini all \
	  -a "sudo systemctl stop vault"

consul-reset:
	ansible -m shell -i hosts.ini all \
	  -a "sudo rm -rf /var/lib/consul/*; sudo systemctl restart consul"

vault-start:
	ansible -m shell -i hosts.ini all \
	  -a "sudo systemctl start vault"
