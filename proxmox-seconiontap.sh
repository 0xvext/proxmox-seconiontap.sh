#!/bin/dash

# proxmox-seconiontap.sh

SECONIONLOG=/root/proxmox-seconiontap.log

date >> $SECONIONLOG

echo "####################" >> $SECONIONLOG

echo "Clearing any existing mirror..." >> $SECONIONLOG

ovs-vsctl clear bridge vmbr4 mirrors

echo "Creating mirror on vmbr4 for Security Onion..." >> $SECONIONLOG

ovs-vsctl -- --id=@p get port tap202i1 \
-- --id=@m create mirror name=span1 select-all=true output-port=@p \
-- set bridge vmbr4 mirrors=@m >> $SECONIONLOG

echo "Showing existing mirrors..." >> $SECONIONLOG

ovs-vsctl list Mirror >> $SECONIONLOG

echo "####################" >> $SECONIONLOG
