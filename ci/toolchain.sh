#!/bin/sh
set -e

# Set the versions we will be using.
gcc_version="11.2.0"


# The tools will be installed in ~/tools
prefix=~/tools

# First check whether the toolchain was already built on a previous run of this script.
if [ ! -d $prefix ]
then
	mkdir -p /tmp/toolchain
	cd /tmp/toolchain

	# Download gcc sources if they are not yet downloaded.
	if [ ! -f gcc-$gcc_version.tar.bz2 ]
	then
		wget -c -O gcc-$gcc_version.tar.bz2 ftp://ftp.gnu.org/gnu/gcc/gcc-$gcc_version/gcc-$gcc_version.tar.bz2
		tar -xf gcc-$gcc_version.tar.bz2
	fi

	# Create build paths.
	mkdir -p /tmp/toolchain/build-gcc

	# Build gcc and libgcc.
	cd /tmp/toolchain/build-gcc
	/tmp/toolchain/gcc-$gcc_version/configure --prefix=$prefix --disable-nls --enable-libstdcxx --without-headers 2>&1
	make all-gcc 2>&1
	make install-gcc 2>&1
	make all-target-libgcc 2>&1
	make install-target-libgcc 2>&1

	# Make sure that our cross compiler will be found by creating links.
	# Alternative: Add the $prefix/bin directory to your $PATH.
	sudo ln -s -f $prefix/bin/* /usr/local/bin/

	sudo rm -rf *

fi

# Also if the cross compiler has not been freshly build, link it so that it will be found.
sudo ln -s -f $prefix/bin/* /usr/local/bin/e
