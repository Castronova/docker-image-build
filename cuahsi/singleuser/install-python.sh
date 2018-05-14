#!/bin/bash
set -x
set -e


###################################
#   INSTALL PYTHON 3 LIBRARIES    #
###################################

conda config --add channels conda-forge 
conda config --add channels landlab 
conda config --add channels odm2

conda install -y -n root \
  gdal \
  basemap \
  jupyterhub=0.8.1 \
  landlab \
  ulmo \
  celery \
  geopandas \
  graphviz 
conda clean --all -y

/opt/conda/bin/pip install --no-cache-dir \
   hs_restclient \
   wget \
   git+https://github.com/cybergis/jupyterlib.git 


###################################
#   INSTALL PYTHON 2 LIBRARIES    #
###################################

## PYTHON2 LEGACY
#conda create -y --name py2legacy python=2.7
#
#conda install -y -n py2legacy \
#    pandas=0.19 \
#    gdal \
#    basemap \
#    ipykernel \
#    ulmo \
#    geopandas \
#    graphviz \
#    wget \
#    celery \
# && conda clean --all -y
#
#/opt/conda/envs/py2legacy/bin/python \
# && pip install --no-cache-dir \
#    hs_restclient 
#
## register the kernel
#python -m ipykernel install \
#    --user \
#    --name "py2legacy" \
#    --display-name "Python 2.7 - Legacy" 

# PYTHON 2
conda install -y -n python2 \
    pandas=0.21.0 \
    gdal \
    basemap \
    ipykernel \
    ulmo \
    celery \
    geopandas \
    graphviz \
    statsmodels=0.8.0 \
    odm2api=0.6.0.a0 \
    landlab \
    bsddb
conda clean --all -y

/opt/conda/envs/python2/bin/python \
 && pip install --no-cache-dir \
    hs_restclient \
    wget==3.2 \
    sciunit2 \
    git+https://github.com/cybergis/jupyterlib.git 
sciunit post-install 

# register the kernels
python -m ipykernel install \
    --user \
    --name "python2" \
    --display-name "Python 2.7" 

###################################
#      INSTALL NBExtensions       #
###################################

/opt/conda/bin/pip install --no-cache-dir git+https://github.com/Castronova/jupyter_contrib_nbextensions.git
jupyter contrib nbextension install --user 
jupyter nbextension enable recursivedelete/main --user --section=tree 
jupyter nbextensions_configurator disable --user 
chown -R jovyan:users /home/jovyan/.jupyter


####################
#      CLEAN       #
####################

conda clean --all

