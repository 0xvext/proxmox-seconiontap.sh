# proxmox-seconiontap.sh
A bash script to create a persistent port mirror for an IDS within a Proxmox hypervisor
This bash script is intended to persist an OVS port mirror through a Proxmox reboot.
Replace "tap202i1" with the appropriate interface of the appropriate VM you are trying to mirror to.
Replace "vmbr4" with the OVS bridge your VM is attached to (you also need to configure a physical interface and upstream port mirroring to feed into the bridge).
Replace "span1" with any name you would like the object to have, or leave it as it.

Save this script file in /root/ and then set up a crontab job to run it once 60 seconds after a reboot. Type `crontab -e` and add the following line:

@reboot sleep 60 && /root/proxmox-seconiontap.sh

Log output from the script will be created in /root/proxmox-seconiontap.log
