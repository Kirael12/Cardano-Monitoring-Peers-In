#!/bin/bash
peers_in=$(ss -tnp state established 2>/dev/null | egrep "cardano-node" | egrep "<YOUR BP IP>:<YOUR BP PORT>|<YOUR OTHER BP IP IF ANY>:<YOUR BP PORT> | awk '{print $4}' | grep -v "<YOUR BP IP>" | sort)
peers_in_count=$(echo "$peers_in" | wc -l)

printf '{\n"peers_in_count":%s}' $peers_in_count > <full path to your $HOME directory>/custom-metrics/peersin/peers_in.json
