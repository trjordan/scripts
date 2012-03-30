#!/bin/bash -e
#
# Start Tracelytics

# Basic services (battery-eating monsters, though they are)
mysql.server start
cassandra -p /tmp/cassandra.pid > /tmp/cassandra-startup.log
sudo rabbitmq-server &
disown

# Supervisor, with all services
sudo supervisorctl start all

# Let me know it's done
growlnotify -m "Tracelytics started" --image tlys.png