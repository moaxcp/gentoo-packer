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

echo "starting scripts on guest."
$SCRIPTS/start.sh

echo "provision.sh complete"
