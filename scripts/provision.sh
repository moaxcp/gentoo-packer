#!/bin/bash

if [[ -z $STAGE3 ]]
then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

echo "current directory"
pwd
ls -l

echo "scripts set to $SCRIPTS"

chmod -R +x *

echo "directory"
ls -l .

echo "files directory"
ls -l "files"

echo "prepare directory"
ls -l "prepare"

echo "provision directory"
ls -l "provision"

for script in prepare/*.sh
do
  echo "running $script"
  $script
done

for script in provision/*.sh
do
  echo "running $script"
  $script
done

echo "running $VM_TYPE.sh"
$VM_TYPE.sh

echo "running cleanup.sh"
cleanup.sh

echo "provision.sh complete"
