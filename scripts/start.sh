#!/bin/bash

if [[ -z $STAGE3 ]]
then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

if [[ -z $SCRIPTS ]]
then
  echo "SCRIPTS environment variable must be set to a directory."
fi

for script in $SCRIPTS/prepare/*.sh
do
  echo "running $script"
  $script
done

for script in $SCRIPTS/provision/*.sh
do
  echo "running $script"
  $script
done

echo "running $VM_TYPE.sh"
$SCRIPTS/$VM_TYPE.sh

echo "running cleanup.sh"
$SCRIPTS/cleanup.sh

echo "start.sh on guest complete."
