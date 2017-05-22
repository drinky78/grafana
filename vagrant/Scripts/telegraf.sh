wget https://dl.influxdata.com/telegraf/releases/telegraf_1.2.1_amd64.deb
sudo dpkg -i telegraf_1.2.1_amd64.deb

sudo cp /vagrant/telegraf.ini /etc/telegraf/telegraf.conf

sudo service telegraf start