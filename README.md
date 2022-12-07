# LAME: Logging Assistant for Modular Environments

A script to intercept the 'module' command and log each invocation for later auditing.  Source this script from your .bashrc (or force it into user environments via system bashrc)

Tested successfully on both TCL module and LMOD environments, and doesn't break tab completion.

# RSYSLOGD integration:

## local logging

Edit log file path as desired, then copy `etc/rsyslog.d/lame_local.conf` to `/etc/rsyslog.d/lame_local.conf`

## remote logging

### server

Edit log file path as desired, then copy `etc/rsyslog.d/lame_server.conf` to `/etc/rsyslog.d/lame_server.conf`

### client

Edit logserver name as desired, then copy `etc/rsyslog.d/lame_client.conf` to `/etc/rsyslog.d/lame_client.conf`
