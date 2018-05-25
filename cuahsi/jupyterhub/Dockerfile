FROM jupyterhub/jupyterhub:latest
MAINTAINER Tony Castronova <acastronova@cuahsi.org>

ADD install-deps.sh /tmp/install-deps.sh
RUN sh /tmp/install-deps.sh

ENV SSL_CERT /srv/jupyterhub/secrets/jupyterhub.crt
ENV SSL_KEY /srv/jupyterhub/secrets/jupyterhub.key
ADD cull_idle_servers.py /srv/cull_idle_servers.py
