# Falcon

## loghost

logger.admin.c3plus3.org is configured as log server. The etc/lame_server.conf is installed to /etc/rsyslog.d. The file /etc/rsyslog.d/35-server-per-host.conf needs to have `:fromhost-ip,!isequal,"127.0.0.1" stop` commented out in order to receive incoming logs.

# clients

Shell startup to source script to incercept module commnand:
```
ln -s /lfs/software/opt/lame/__lame.sh /etc/profile.d/lame.sh
```

rsyslog configuration:
```
cp etc/lame_client.conf /etc/syslog.d/lame_client.conf
```

Logs live in /var/log/modules on logger.admin.c3plus3.org
