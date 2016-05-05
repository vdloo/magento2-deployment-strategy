magento2-deployment-strategy
============================
Personal proof of concept / testing repository for messing around with some Magento 2 deployment strategies. 

This repository contains some experimental scripts that deploy the magento2 directory into a Vagrant box where the dependencies are resolved by composer and Magento is compiled. The idea is that by doing the computationally expensive steps locally in a Vagrant box which is basically the same environment as the production server, deployments can be done with very little overhead because only the compiled result needs to be uploaded. If the new revision is uploaded to a directory that denotes the release version and the current public directory is also a symlink to a specific revision path, only a symlink needs to be changed to deploy a change.  

Two main learning goals: 

- Finding a way to quickly set up a Magento 2 development environment from scratch without having to install or configure anything on the host machine
- Experimenting with Magento 2 deployment strategies


## Usage

Make sure you have Vagrant installed and either Virtualbox or LXC.  Configure the local.yml accordingly if you use LXC, the default is Virtualbox.
Also required: Make and Ansible

The scripts expect a couple of things in your environment
```
export MAGENTO_MARKETPLACE_PUBLIC_KEY=<YOUR MARKETPLACE ID>
export MAGENTO_MARKETPLACE_PRIVATE_KEY=<YOUR SECRET KEY>
export MAGENTO_ADMIN_PASSWORD=<YOUR MAGENTO ADMIN PASSWORD>  # requires digits so something like admin1234
```

### Deploying the magento2 dir to the Vagrant
Run the following command
```
make devenv
```

Re-deploying after changes are made in the magento2 dir:
```
make update
```

### Cleaning it all up
To destroy the Vagrant box and remove all the generated content:
```
make clean
```
