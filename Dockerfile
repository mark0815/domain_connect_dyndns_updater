ARG ARCH=
FROM ${ARCH}python:slim

RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir six
RUN pip install --no-cache-dir domain-connect-dyndns

# Default Crontab
RUN echo "*/1 * * * * root /usr/local/bin/domain-connect-dyndns --config /config/settings.txt --all update > /proc/1/fd/1 2>/proc/1/fd/2" > /etc/cron.d/domain_connect

# Default settings
RUN mkdir /config
RUN echo "{}" > /config/settings.txt

ENTRYPOINT [ "cron", "-f" ]