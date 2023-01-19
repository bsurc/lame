# Borah

Set up with borah (aka master.. aka head node) as log host.

The /etc/rsyslog.conf already contains an entry that forwards *all* messages to master. Adding /etc/rsyslog.d/lame_client.conf in this case is not only unnecessary but also causes duplicate entries by causing messages to be forwarded a second time. 

This also means that none of the clients need to be explicitly configured, other than to source the __lame.sh script.  The logs are forwarded automatically. 

TO DO: Show how to source the __lame.sh script at startup for all users. 
