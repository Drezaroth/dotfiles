#!/bin/bash

function usage {
  echo "Usage: $0 [-i] inputfile"
  exit 1
}

# output to stdout
function rdl_awk {
  awk '!a[$0]++' $1
}

# edit the file in place
function rdl_perl_ip {
  perl -i -lne 'print unless $a{$_}++' $1
}

# needs 1 or 2 arguments
[ $# -eq 0 ] || [ $# -gt 2 ] && usage

# Parse args
if [ $# -eq 2 ]; then
  if [ "$1" != "-i" ]; then usage; fi
  in_place=1
  inputfile=$2
else
  inputfile=$1
fi

# Do the thing
if [ -v in_place ]; then
 rdl_perl_ip $inputfile
else
 rdl_awk $inputfile
fi
