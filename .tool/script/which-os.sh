#!/bin/bash
# simple utility to get the operating system of the user
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  echo -n $ID
else
  exit 1
fi

