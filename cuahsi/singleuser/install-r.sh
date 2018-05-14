#!/bin/bash
set -x
set -e

####################################
#          INSTALL R KERNEL        #
####################################

mkdir /home/jovyan/.userRLib

conda install -n R -c r \
    r-base=3.4.3 \
    r-essentials=3.4.3 \
    r-devtools=1.13.4 \
    r-xml=3.98_1.9 \
    r-rjsonio=1.3_0 \
    && conda clean --all -y

echo "options(repos=structure(c(CRAN=\"http://archive.linux.duke.edu/cran\")))" >> /home/jovyan/.Rprofile
#Rscript -e "install.packages('devtools', repos='http://archive.linux.duke.edu/cran')" 
Rscript -e "IRkernel::installspec(name = 'ir34', displayname = 'R 3.4')" 
Rscript -e "install.packages('WaterML')" 

conda clean --all -y
