# Monitoring Peers In Connections 

These scripts allow to monitor Peers In Connections on Cardano Relays and Block Producers nodes.

Pre-Requisites :

- Cardano Stakepool (setup with Coincashew Guide : https://www.coincashew.com/coins/overview-ada/guide-how-to-build-a-haskell-stakepool-node)
- A monitoring node setup with Grafana and Prometheus
- Prometheus Node Exporter installed on Relay and Block Producer nodes

For a clean installation of Grafana, Promeheus and Prometheus Node Exporter, follow this guide on the Cardano Developper Portal :

https://developers.cardano.org/docs/stake-pool-course/handbook/grafana-dashboard-tutorial

Monitoring Peers OUT Connections is a metric available out of the box, when you setup Grafana, Prometheus and Prometheus Node Exporter on your Cardano Stake Pool. It allows you to check on your Grafana Dashboard, how many connections are initiated by your nodes. But Peers IN connections is not available by default. It’s a shame because it’s a useful metric, especially on your Relay Node. A relay that has many IN connections from different other relays is a healthy Relay.


As the scripts are going to be run by root, which doesn’t have env variables, i’m going to always use full path. I also use a dedicated directory for those scripts.

# Create script directories

On your Relay node and your Block Producer node :

```shell
mkdir $HOME/custom-metrics/peersin
mkdir $HOME/custom-metrics/tmp
sudo mkdir /root/scripts
```
# Copy scripts into directorie and adapt

Relay node :
- peersin-relay.sh -> /root/scripts
- peersin-scrap.sh -> /root/scripts

Block Producer node :
- peersin-bp.sh -> /root/scripts
- peersin-scrap.sh -> /root/scripts

Adapt the scripts with your nodes own IPs

# Make scripts executable

```shell
sudo chmod +x /root/scripts/peersin_Results.sh
sudo chmod +x /root/scripts/peersin.sh
```

# Create Cronjob check

Now we create a root cronjob that will check every 1 minute the IN connections on your Cardano Node, and export it to Prometheus
```shell
sudo crontab -e
```
Add this line on Relay node crontab :

*/1 * * * * /root/scripts/peersin-relay.sh && /root/scripts/peersin-scrap.sh

Add this line on BP node crontab :

*/1 * * * * /root/scripts/peersin-bp.sh && /root/scripts/peersin_scrap.sh

# Grafana

On your Grafana Server, you should now be able to see the custom metric “network_peers_in_count” when exploring your Prometheus Datasource :


![cardano-prometheus-node-exporter](https://user-images.githubusercontent.com/113426048/209671896-9aa2f8cb-38ec-42da-8a84-ba9334f19414.jpg)

And add it to your Dashboard

![grafana-cardano-dashboard-peers-in](https://user-images.githubusercontent.com/113426048/209671941-2e7a4751-7ce5-4c04-ba5b-b70dc808844f.jpg)
