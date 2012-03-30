#!/bin/bash -e
#
# Start Tracelytics

# Supervisor, with all services
sudo supervisorctl stop all

# Basic services (battery-eating monsters, though they are)
mysql.server stop
kill `cat /tmp/cassandra.pid`
ps aux |
    grep rabbitmq-server |
    grep -v grep |
    awk '{print $2}' |
    xargs sudo kill # Ugh

# Let me know it's done
growlnotify -m "Tracelytics stopped" --image tlys.png