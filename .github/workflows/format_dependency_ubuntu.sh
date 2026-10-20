#!/usr/bin/env bash

# The package list is designed for Ubuntu 20.04 LTS
add-apt-repository -y ppa:ubuntu-toolchain-r/test
# Install Ubuntu 20.04 packages
if [ "$(lsb_release -rs)" = "20.04" ]; then
	# deliberately not install this to avoid error when install libssl-dev on ubuntun20.04
	# this is recommended by https://github.com/orgs/community/discussions/47863
	apt-mark hold grub-efi-amd64-signed
	apt-get update --fix-missing
# Install Ubuntu 22.04 packages
elif [ "$(lsb_release -rs)" = "22.04" ]; then
	apt-get update
elif [ "$(lsb_release -rs)" = "24.04" ]; then
	apt-get update
fi

apt-get install -y \
    autoconf \
    automake \
    ccache \
    cmake \
    doxygen \
    git \
    make \
    perl \
    pkg-config \
    python3 \
    python3-setuptools \
    python3-lxml \
    python3-pip
 
# Install Ubuntu 20.04 packages
if [ "$(lsb_release -rs)" = "20.04" ]; then
	apt-get install -y \
   	 	clang-format-10
# Install Ubuntu 22.04 packages
elif [ "$(lsb_release -rs)" = "22.04" ]; then
	apt-get install -y \
    	clang-format-12
# Install Ubuntu 24.04 packages
elif [ "$(lsb_release -rs)" = "24.04" ]; then
    apt-get install -y \
        clang-format-18
fi
