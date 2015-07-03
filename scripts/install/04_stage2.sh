#!/bin/bash
set -e
echo "progressing from stage 1 to stage 2"
/usr/portage/scripts/bootstrap.sh
echo "Now at stage 2. Listing gcc-config"
gcc-config -l
echo "selecting gcc-config 1"
gcc-config 1
