echo 'deb https://packagecloud.io/grafana/stable/debian/ wheezy main' | sudo tee -a /etc/apt/sources.list
curl https://packagecloud.io/gpg.key | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y grafana
sudo cp /vagrant/grafana_config.ini /etc/grafana/grafana.ini


sudo service grafana-server start
curl "admin:admin@192.168.33.10:3000/api/datasources" -X POST  -H 'Content-Type: application/json;charset=UTF-8'  --data-binary "@/vagrant/influx.json"
curl "admin:admin@192.168.33.10:3000/api/dashboards/db" -X POST  -H 'Content-Type: application/json;charset=UTF-8'  --data-binary "@/vagrant/dashboard.json"


sudo grafana-cli plugins install grafana-piechart-panel

sudo service grafana-server restart
