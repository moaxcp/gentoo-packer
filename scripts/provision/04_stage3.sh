#!/bin/bash
echo "progressing from stage 2 to stage 3"
touch /tmp/prebuilt_checkpoint
emerge --ask --verbose --emptytree --with-bdeps=y @world
dispatch-conf
