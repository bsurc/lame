# R2

Set up with R2 (aka master.. aka head node) as log host.

The /etc/rsyslog.conf already contains an entry that forwards *all* messages to master. Adding /etc/rsyslog.d/lame_client.conf in this case is not only unnecessary but also causes duplicate entries by causing messages to be forwarded a second time. 


