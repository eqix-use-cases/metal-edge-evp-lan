#!/usr/bin/env bash


tee -a /etc/network/interfaces <<EOF

auto bond0.${vxlan}
  iface bond0.${vxlan} inet static
  pre-up sleep 5
  address ${vxlan_net}
  netmask ${vxlan_mask}
  vlan-raw-device bond0

EOF

systemctl restart networking.service