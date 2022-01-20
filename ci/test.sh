#!/bin/sh
set -e

neofetch

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
echo 'gcc -dumpmachine'
gcc -dumpmachine
