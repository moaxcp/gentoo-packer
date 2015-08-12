# Gentoo Vagrant Boxesses

This is a fork of [d11wtq/gentoo-packer](https://github.com/d11wtq/gentoo-packer) a project with the goal of creating a minimal stage3 installation.

This is not the most minimal stage3 installation of Gentoo that possible to package into a Vagrant box file. The goal of this project is to be usable. It does not delete the portage tree so users only need to sync what has changed. This project installs acpid so vagrant can properly shutdown the vm. Scripts are provided under /root so users can rebuild gentoo for the system running the vm. This includes bootstrapping the system from stage1 to stage3. It is highly recommended to change march in make.conf and rebuild the system when building the vm. This can be done in vagrant as well.

Currently, only virtualbox is supported as I do not have VMWare tools to build with. If anyone figures out how to install the vmrun command in gentoo let me know!

##Getting Started

Before using this project install VirtualBox, packer, and vagrant and use these commands:

    git clone https://github.com/moaxcp/gentoo-packer.git
    cd gentoo-packer
    packer build gentoo64.json
    vagrant init /tmp/gentoo64-virtualbox.box
    vagrant up
    vagrant ssh
    
##Vagrant rebuild

To rebuild the entire vm

1. run `vagrant ssh`
2. update `/etc/portage/make.conf` following [GCC Optimization](https://wiki.gentoo.org/wiki/GCC_optimization)
3. run `/root/install.sh`

This will rebuild the vm for your specific processor, allowing you to take advantage of an os compiled for your system.

##Improvements
* provision acpid for soft shutdown
* each system is configured correctly (dbus)
* all packages are up to date at time of build
* perform stage1 to stage3 builds
* keeping portage tree instead of removing it
* use multilib stage 3
* scripts provided in /root to rebuild the system in vagrant
* use a decent arch flag in make.conf
* seperate preparing from provisioning
* use file order for most scripts
* use poweroff for shutdown (this is gentoo!)
* update minimal install and stage3 versions used
* move kernel-config to guest properly
* build according to arch (amd64, x86) not virtual machine platform
