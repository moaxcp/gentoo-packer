#!/bin/bash
set -e
echo "progressing from stage 2 to stage 3"
touch /tmp/prebuilt_checkpoint
emerge --verbose --emptytree --with-bdeps=y @world
emerge --depclean
