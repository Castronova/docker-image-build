#!/bin/bash
set -x
set -e

# change to gnu 5
echo 1 | update-alternatives --config gcc
echo 1 | update-alternatives --config g++

# compile MODFLOW 2005
cd /tmp
wget https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip
unzip -x MF2005.1_12u.zip
cd MF2005.1_12u/make
sed -i '/F90FLAGS*/F90FLAGS = -fno-second-underscore/'
sed -i '/CC =*/CC = gcc/'
make
cp mf2005 /usr/local/bin/mf2005

rm -rf /tmp/*
