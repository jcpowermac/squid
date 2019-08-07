FROM registry.fedoraproject.org/fedora:30

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=squid

RUN dnf install squid openssl which -y && \
    dnf clean all

COPY root/ /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 3128 3129 3130
