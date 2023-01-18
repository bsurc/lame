# LAME: Logging Assistant for Modular Environments

A script to intercept the 'module' command and log each invocation for later auditing.  Source the generated script from your .bashrc (or force it into user environments via system bashrc)

Tested on both TCL module and LMOD environments, and preserves tab completion.

Can be installed one of three ways:

- local: will log locally to a file
- rsyslog: will intergrate with rsyslog system logger (requires admin privileges)
- rsyslog-remote: integrate with rsyslog and write logs to remote logserver

First declare environment vars LAME_LOGFILE, LAME_INSTALL_DIR, and LAME_LOGHOST (if using remote logging). Then one of:

`$ make install-local`

-- or --

`$ make install-rsyslog`

-- or --

`$ make install-rsyslog-remote`

# RSYSLOG integration:

## rsyslog local logging

Edit log file path as desired, then copy generated `etc/rsyslog.d/lame_local.conf` to `/etc/rsyslog.d/lame_local.conf`

## rsyslog remote logging

### server

Edit log file path as desired, then copy generated `etc/rsyslog.d/lame_server.conf` to `/etc/rsyslog.d/lame_server.conf`

### client

Edit logserver name as desired, then copy generated `etc/rsyslog.d/lame_client.conf` to `/etc/rsyslog.d/lame_client.conf`
