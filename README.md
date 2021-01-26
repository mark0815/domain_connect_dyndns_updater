# Domain-Connect Update Client

Run domain-connect update client every minute (via cron).

```
docker run \
    -v {PWD}/config:/config \
    mark0815/domain_connect_dyndns_updater:latest
```