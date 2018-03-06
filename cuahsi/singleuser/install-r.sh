#!/bin/bash
set -x
set -e

####################################
#          INSTALL R KERNEL        #
####################################

mkdir /home/jovyan/.userRLib

conda install -y -n R -c r r-essentials r-xml r-rjsonio

echo "options(repos=structure(c(CRAN=\"http://archive.linux.duke.edu/cran\")))" >> /home/jovyan/.Rprofile
Rscript -e "install.packages('devtools', repos='http://archive.linux.duke.edu/cran')" 
Rscript -e "IRkernel::installspec(name = 'ir33', displayname = 'R 3.3')" 
Rscript -e "install.packages('WaterML')" 

conda clean --all -y
