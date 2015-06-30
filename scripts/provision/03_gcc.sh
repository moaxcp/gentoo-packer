#!/bin/bash
echo "adding unstable keyword to gcc. This fixes a problem with virtualbox-guest-additions.""
echo "sys-devel/gcc ~amd64" >> /etc/portage/package.accept_keywords
