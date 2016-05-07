.PHONY: devenv update clean

NAME := magento2 shop
VERSION := 0.1
MAINTAINER := Rick van de Loo <rickvandeloo@gmail.com>
DESCRIPTION := My demo Magento 2 shop for testing purposes

devenv:
	scripts/boot_vagrant
	scripts/update_composer
deploy:
	scripts/deploy_shop
clean:
	[ -d hypernode-vagrant ] && (cd hypernode-vagrant && vagrant destroy -f) || /bin/true
	rm -Rf hypernode-vagrant
	git clean -xfd
