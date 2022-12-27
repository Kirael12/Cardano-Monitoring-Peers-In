# Monitoring Peers In Connections 

These scripts allow to monitor Peers In Connections on Cardano Relays and Block Producers nodes.

Pre-Requisites :

- Cardano Stakepool (setup with Coincashew Guide : https://www.coincashew.com/coins/overview-ada/guide-how-to-build-a-haskell-stakepool-node)
- A monitoring node setup with Grafana and Prometheus
- Prometheus Node Exporter installed on Relay and Block Producer nodes

For a clean installation of Grafana, Promeheus and Prometheus Node Exporter, follow this guide on the Cardano Developper Portal :

https://developers.cardano.org/docs/stake-pool-course/handbook/grafana-dashboard-tutorial

Monitoring Peers OUT Connections is a metric available out of the box, when you setup Grafana, Prometheus and Prometheus Node Exporter on your Cardano Stake Pool. It allows you to check on your Grafana Dashboard, how many connections are initiated by your nodes. But Peers IN connections is not available by default. It’s a shame because it’s a useful metric, especially on your Relay Node. A relay that has many IN connections from different other relays is a healthy Relay.

# Create script directories

```shell
mkdir $HOME/custom-metrics/peersin
mkdir $HOME/custom-metrics/tmp
sudo mkdir /root/scripts
```



