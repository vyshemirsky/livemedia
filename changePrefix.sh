#!/bin/bash
PREFIX=$1
echo $PREFIX
find -iname Makefile | while read a; do sed -i 's|PREFIX =*|PREFIX = $PREFIX|g' $a; done
