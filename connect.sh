#!/bin/ash
echo 'running tailscale'
tailscaled &
sleep 3

echo 'enabling exit node'
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

tailscale up --advertise-exit-node --authkey=${TAILSCALE_AUTH_KEY}

tailscale status
sleep infinity