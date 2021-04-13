sources: 
https://linuxcontainers.org/lxc/getting-started/
https://techviewleo.com/run-linux-containers-with-lxc-lxd-on-ubuntu/
https://forum.yunohost.org/t/can-yunohost-just-be-run-in-lxd-containers/14576/3
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-lxd-on-ubuntu-20-04

example container named vas

apt install lxd #select latest
sudo lxd init #all defaults besides size (16GB and accessibility over web: lxd server port 8443

Debian 10 (buster) container:

lxc launch images:debian/buster vas

apt install curl

curl https://install.yunohost.org | bash

lxc config device add vas myport80 proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80

lxc config device add vas myport443 proxy listen=tcp:0.0.0.0:443 connect=tcp:127.0.0.1:443

lxc config set vas boot.autostart true

lxc list --columns ns4

lxc exec vas bash

curl https://install.yunohost.org | bash

Access global ip to proceed with yunohost installation

Restore backup with certificate instead of post install
yunohost backup restore ....tar

talescale vpn install:

curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.gpg | sudo apt-key add -

curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo tailscale up

#or tailscale up --advertise-exit-node # to use as an exit node to internet from other pears of the private network

source: https://tailscale.com/download/linux/debian-bullseye

Check the page https://login.tailscale.com/admin/machines to view your VPN network.

Samba: nextcloud external disk
Show host shares:
smbclient -L 10.209.116.1

In nextcloud settings add smb external storages with proper sharename and samba username/pwd on the host

Optional:

lxc stop vas
lxc delete vas
lxc list --columns ns4 #show internal ip
On HOST machine
mount /dev/sda2 /media/usb1
mount /dev/sdb1 /media/usb2
# not needed, just in case# systemctl restart smbd

lxc launch ubuntu:20.04 vas

lxc config device add vas vartest disk source=/mnt/ path=/mnt #passthrough /mnt from host (source) to container (path)

https://linuxcontainers.org/lxd/getting-started-cli/
https://yunohost.org/en/install/hardware:vps_debian


 admin@r4s.noho.st webmaster@r4s.noho.st postmaster@r4s.noho.st abuse@r4s.noho.st
