FROM jupyterhub/jupyterhub:latest
MAINTAINER Tony Castronova <acastronova@cuahsi.org>

RUN mkdir /app
WORKDIR /app

ADD cull_idle_servers.py /app/cull_idle_servers.py

ADD install-deps.sh /app/install-deps.sh
RUN sh /app/install-deps.sh

ENTRYPOINT python3 /app/cull_idle_servers.py