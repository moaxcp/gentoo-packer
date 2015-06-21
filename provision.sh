#!/bin/bash

if [[ -z $STAGE3 ]]
then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

if [[ -z $SCRIPTS ]]
then
  SCRIPTS=.
fi

echo "current directory"
pwd
ls -l

echo "scripts set to $SCRIPTS"

chmod -R +x $SCRIPTS/*

echo "scripts directory"
ls -l $SCRIPTS

echo "files directory"
ls -l "$SCRIPTS/files"

echo "ordered directory"
ls -l "$SCRIPTS/ordered"

for script in $SCRIPTS/ordered/*.sh
do
  echo "running $script"
  $script
done
echo "running $VM_TYPE.sh"
./$VM_TYPE.sh

echo "running cleanup.sh"
echo ./cleanup.sh

echo "All done."
