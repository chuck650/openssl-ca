
.PHONY: clean show all clean_db clean_certs

help:
	@printf "make [TARGET]\n"
	@printf "\nOpenSSL Help\n"
	@openssl help

clean_keys: clean_csr
	@printf "\nRemoving all private keys\n"
	#TODO: use regex pattern to limit to keys directory
	@find . -type f -name "*.key" -delete

clean_csr: clean_certs
	@printf "\nRemoving all certificate signing requests\n"
	#TODO: use regex pattern to limit to db directory
	@find . -type f -name "*.csr" -delete

clean_certs:
	@printf "\nRemoving all certificates\n"
	@find . -type f -regex '.*/certs/.+' -delete

clean_db: clean_certs
	@printf "\nResetting all databases\n"
	#TODO: use regex pattern to limit to db directory
	@find . -type f -name "*.old" -delete
	@find . -type f -name "*.srl" -exec echo 1000 > {} \;
	@find . -type f -name "*.db" -exec cp /dev/null {} \;
	@find . -type f -name "*.db.attr" -exec cp /dev/null {} \;

clean: clean_keys
	@printf "\nRemoving all artifacts\n"

#network:
#	@printf "Provisioning networking infrastructure on localhost\n"
#	@ansible-playbook -v -i $(ROOT_DIR)/$(inventory) $(ROOT_DIR)/playbooks/provision_host.yml

all:
	@printf "\nCreating all configured objects\n"
	@ansible-playbook certauth.yaml
show:
	@printf "\nShow CA hierarchy\n"
	@tree -L 2 .

list_curves:
	@openssl ecparam -list_curves
