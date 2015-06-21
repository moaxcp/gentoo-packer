# Gentoo Vagrant Box

This is a fork of [d11wtq/gentoo-packer](https://github.com/d11wtq/gentoo-packer) a project with the goal of creating a 
minimal stage3 installation.

This is not the most minimal stage3 installation of Gentoo (amd64) thatis possible to package into a Vagrant box file. 
Currently, only virtualbox is supported as I do not have VMWare to test with. 

##Goals
* compatible with VirtualBox and eventually VMWare
  * this means being able to perform acpi shutdown
* each system is configured correctly (dbus)
* build a box that is completely up to date
* clean the build as much as possible
* allow 32-bit applications
* optimize build by bootstraping gcc
* use a decent arch flag
* remove extra partition

These are some of the changes I've made so far

* add cleanup script from [moaxcp/gentoo64](https://atlas.hashicorp.com/moaxcp/boxes/gentoo64)
* use file order for most scripts when provisioning
* use poweroff for shutdown (this is gentoo!)
* update minimal install and stage3 versions used
* move kernel.conf to guest properly

Usage
    git clone https://github.com/moaxcp/gentoo64.git
    cd gentoo64
    packer build virtualbox.json
    vagrant init gentoo-amd64-stage3-virtualbox.box
    vagrant up
    vagrant ssh
