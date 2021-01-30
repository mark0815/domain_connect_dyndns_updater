# Domain-Connect Update Client

Run [Domain Connect DDNS Python](https://github.com/Domain-Connect/DomainConnectDDNS-Python) every minute (via cron).

```
docker run \
    -v {PWD}/config:/config \
    mark0815/domain_connect_dyndns_updater:latest
```