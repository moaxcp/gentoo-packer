# Gentoo Vagrant Box

This is a fork of [d11wtq/gentoo-packer](https://github.com/d11wtq/gentoo-packer) a project with the goal of creating a minimal stage3 installation.

This is not the most minimal stage3 installation of Gentoo (amd64) that possible to package into a Vagrant box file. 
Currently, only virtualbox is supported as I do not have VMWare tools to test with. 

##Improvements
* provision acpid for soft shutdown
* each system is configured correctly (dbus)
* update all packages before release
* keeping portage tree instead of removing it
* use multilib stage 3
* use a decent arch flag in make.conf
* add cleanup script from [moaxcp/gentoo64](https://atlas.hashicorp.com/moaxcp/boxes/gentoo64)
* seperate preparing from provisioning
* use file order for most scripts
* reusable provision scripts
* use poweroff for shutdown (this is gentoo!)
* update minimal install and stage3 versions used
* move kernel-config to guest properly

Usage
    git clone https://github.com/moaxcp/gentoo64.git
    cd gentoo64
    packer build virtualbox.json
    vagrant init gentoo-amd64-stage3-virtualbox.box
    vagrant up
    vagrant ssh
