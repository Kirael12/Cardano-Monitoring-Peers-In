#!/bin/bash
peersin="<full path to your $HOME directory>/custom-metrics/peersin/peers_in.json"

peers_in_count=`jq .peers_in_count $peersin`

cat << EOF > "<full path to your $HOME directory>/custom-metrics/tmp/peerin.prom.$$"
network_peers_in_count ${peers_in_count}
EOF

mv <full path to your $HOME directory>/custom-metrics/tmp/peerin.prom.$$ /var/lib/prometheus/node-exporter/peerin.prom
