#!/bin/sh
set -e

echo
echo 'ls'
ls

echo
echo 'ls /usr/local/bin'
ls /usr/local/bin

echo
echo 'gcc -v'
gcc -v

echo
echo 'gfortran -v'
gfortran -v

echo
echo 'gcc -dumpmachine'
gcc -dumpmachine
