.PHONY: devenv build clean test

NAME := magento2 shop
VERSION := 0.1
MAINTAINER := Rick van de Loo <rickvandeloo@gmail.com>
DESCRIPTION := My demo Magento 2 shop for testing purposes

devenv:
	scripts/boot_vagrant
	scripts/deploy_development
#build:
#	cd magento2 && composer update
#	cd magento2 && bin/magento setup:upgrade
#	cd magento2 && bin/magento setup:di:compile
#	cd magento2 && bin/magento setup:static-content:deploy

#test:
#	./runtests.sh

clean:
	cd hypernode-vagrant && vagrant destroy -f 
	rm -Rf hypernode-vagrant
#	cd magento2; git clean -xfd
