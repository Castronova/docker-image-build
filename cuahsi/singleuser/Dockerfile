FROM jupyter/scipy-notebook
MAINTAINER Tony Castronova <acastronova@cuahsi.org>

EXPOSE 8888

USER jovyan

ADD singleuser.sh /srv/singleuser/singleuser.sh
ADD ecohydro-Linux.cfg /home/jovyan/.ecohydro.cfg
ADD rhessys_wf.py /home/jovyan/libs/rhessys_wf.py
ADD run.py /home/jovyan/libs/run.py
ADD dakota_template.cmake /home/jovyan/libs/dakota-6.5.0.src/build/BuildDakota.cmake
ADD icommands.sh /home/jovyan/libs/icommands.sh 

ENV PATH="/opt/conda/envs/python2/bin:/home/jovyan/libs:/home/jovyan/libs/icommands":$PATH \
    PYTHONPATH="/home/jovyan/work/notebooks:/home/jovyan/libs":$PYTHONPATH \
    DOCUMENTS="/home/jovyan/work/notebooks/documents" \
    DATA="/home/jovyan/work/notebooks/data" \
    HOME="/home/jovyan" \
    ECOHYDROLIB_CFG="/home/jovyan/.ecohydro.cfg" \
    LD_LIBRARY_PATH="/usr/lib/grass64/lib:$LD_LIBRARY_PATH" \
    NOTEBOOK_HOME="/home/jovyan/work/notebooks" \
    R_LIBS_SITE="/home/jovyan/.userRLib" \
    IRODS_PLUGINS_HOME="/home/jovyan/libs/icommands/plugins/" \
    IRODS_ENVIRONMENT_FILE="/home/jovyan/work/notebooks/data/.irods/irods_environment.json" \
    IRODS_AUTHENTICATION_FILE="/home/jovyan/work/notebooks/data/.irods/.irodsA" 

USER root
ADD install-base.sh /home/install-base.sh
RUN sh /home/install-base.sh

ADD install-mpi.sh /home/install-mpi.sh
RUN sh /home/install-mpi.sh

ADD install-gnu.sh /home/install-gnu.sh
RUN sh /home/install-gnu.sh

ADD install-taudem.sh /home/install-taudem.sh
RUN sh /home/install-taudem.sh

USER jovyan
  ADD install-condaenvs.sh /home/install-condaenvs.sh
  RUN sh /home/install-condaenvs.sh
USER root

RUN ln -sf /opt/conda/envs/python2/bin/python2 /usr/bin/python22 &&\
ln -sf /opt/conda/envs/python2/bin/pip /usr/bin/pip2 &&\
ln -s /opt/conda/envs/R/bin/R /usr/bin/R &&\
ln -s /opt/conda/envs/R/bin/Rscript /usr/bin/Rscript

ADD install-irods.sh /home/install-irods.sh
RUN sh /home/install-irods.sh

USER jovyan

  ADD install-python.sh /home/install-python.sh
  RUN sh /home/install-python.sh

  ADD install-r.sh /home/install-r.sh
  RUN sh /home/install-r.sh
  
  ADD install-rhessys.sh /home/install-rhessys.sh
  RUN sh /home/install-rhessys.sh
USER root

ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH" \
    CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.5m"

ADD install-boost.sh /home/install-boost.sh
RUN sh /home/install-boost.sh

ADD install-dakota.sh /home/install-dakota.sh
RUN sh /home/install-dakota.sh

ADD install-dhsvm.sh /home/install-dhsvm.sh
RUN sh /home/install-dhsvm.sh

ADD install-modflow.sh /home/install-modflow.sh
ADD modflow.6.0.2-makefile-ubuntu /tmp/makefile
RUN sh /home/install-modflow.sh

ENV HOME=/home/jovyan/work
WORKDIR $HOME

ADD install-perm.sh /home/install-perm.sh
RUN sh /home/install-perm.sh

ADD install-cleanup.sh /home/install-cleanup.sh
RUN sh /home/install-cleanup.sh

ADD post-build.sh /home/post-build.sh
RUN sh /home/post-build.sh

USER jovyan


CMD ["sh", "/srv/singleuser/singleuser.sh"]
