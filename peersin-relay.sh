#!/bin/bash
peers_in=$(ss -tnp state established 2>/dev/null | egrep "cardano-node" | egrep "<PUBLIC IP RELAY NODE>:|<PRIVATE IP RELAY NODE>:6000" | grep -v "<PRIVATE IP BLOCK PRODUCER NODE>:6000" | awk '{print $3; }' | sort)
peers_in_count=$(echo "$peers_in" | wc -l)

printf '{\n"peers_in_count":%s}' $peers_in_count > <full path to your $HOME directory>/custom-metrics/peersin/peers_in.json
