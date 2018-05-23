FROM jupyterhub/jupyterhub:latest
MAINTAINER Tony Castronova <acastronova@cuahsi.org>

ADD install-deps.sh /tmp/install-deps.sh
RUN sh /tmp/install-deps.sh

ENV SSL_CERT /srv/jupyterhub/secrets/jupyterhub.crt
ENV SSL_KEY /srv/jupyterhub/secrets/jupyterhub.key
COPY ./secrets/*.crt $SSL_CERT
COPY ./secrets/*.key $SSL_KEY
RUN chmod 700 /srv/jupyterhub/secrets && \
    chmod 600 /srv/jupyterhub/secrets/*

CMD ["jupyterhub", "-f", "/srv/jupyterhub/config/jupyterhub_config.py"]
