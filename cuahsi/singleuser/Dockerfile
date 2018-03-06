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

ADD install-taudem.sh /home/install-taudem.sh
RUN sh /home/install-taudem.sh

ADD install-irods.sh /home/install-irods.sh
RUN sh /home/install-irods.sh

ADD install-rhessys.sh /home/install-rhessys.sh
RUN sh /home/install-rhessys.sh

ADD install-dakota.sh /home/install-dakota.sh
RUN sh /home/install-dakota.sh

ADD install-dhsvm.sh /home/install-dhsvm.sh
RUN sh /home/install-dhsvm.sh

ADD install-python.sh /home/install-python.sh
RUN sh /home/install-python.sh

ADD install-r.sh /home/install-r.sh
RUN sh /home/install-r.sh

ADD install-perm.sh /home/install-perm.sh
RUN sh /home/install-perm.sh

USER jovyan
CMD ["sh", "/srv/singleuser/singleuser.sh"]
