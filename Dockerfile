ARG ARCH=
FROM ${ARCH}python:3

RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install six
RUN pip install domain-connect-dyndns

RUN touch /var/log/domain_connect.log

# Default Crontab
RUN echo "*/1 * * * * root /usr/local/bin/domain-connect-dyndns --config /config/settings.txt --all update  >> /var/log/domain_connect.log 2>&1" > /etc/cron.d/domain_connect

# Default settings
RUN mkdir /config
RUN echo "{}" > /config/settings.txt

CMD cron && tail -f /var/log/domain_connect.log