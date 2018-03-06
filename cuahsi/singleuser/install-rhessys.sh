#!/bin/bash
set -x
set -e


###################################
#       INSTALL ECOHYDROLIB       #
###################################

pip2 install git+https://github.com/leonard-psu/EcohydroLib.git

###################################
#     INSTALL RHESSysWorkflows    #
###################################

pip2 install git+https://github.com/leonard-psu/RHESSysWorkflows.git

# load the rhessys configuration file and modify for the current user
sed -i -e 's|^ETC.*|ETC = /home/jovyan/libs/RHESSysWorkflows/etc|g' /home/jovyan/.ecohydro.cfg 
sed -i -e 's|^MODULE_PATH.*|MODULE_PATH = /home/jovyan/work/notebooks/.grass6/addons|g' /home/jovyan/.ecohydro.cfg
sed -i -e 's|^MODULE_ETC.*|MODULE_ETC = /home/jovyan/libs/RHESSysWorkflows/etc/r.soils.texture|g' /home/jovyan/.ecohydro.cfg


