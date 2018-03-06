FROM jupyterhub/jupyterhub:latest
MAINTAINER Tony Castronova <acastronova@cuahsi.org>

ADD install-deps.sh /tmp/install-deps.sh
RUN sh /tmp/install-deps.sh

CMD ["jupyterhub", "-f", "/srv/jupyterhub/config/jupyterhub_config.py"]
