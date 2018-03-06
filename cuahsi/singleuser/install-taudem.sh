#!/bin/bash
set -x
set -e



###################################
#          INSTALL TAUDEM         #
###################################

# TAUDEM v5.3.7 - build and install taudem (must happen before rhesyss b/c of gdal conflicts)
git clone --branch v5.3.7 https://github.com/dtarb/TauDEM.git /home/jovyan/libs/TauDEM
cd /home/jovyan/libs/TauDEM/src  && sed -i 's#\.\.#/usr/local/bin#g' makefile && make 
rm -rf /home/jovyan/libs/TauDEM

