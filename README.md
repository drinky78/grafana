#Monitoring

##Stack

* [CentOS](http://www.centos.org/)
* [Grafana](http://grafana.org/)
* [Influxdb](http://influxdb.com/)
* [Statsd](https://github.com/etsy/statsd/)
* [Nginx](http://nginx.org/)
* [Vagrant](https://www.vagrantup.com/)

##Information

* [Grafana](http://192.168.33.10:3000)
* [Influxdb](http://192.168.33.10:8086)


###Command to send a metric
```sh
echo "local.grafana.devil 666 `date +%s`" | nc 127.0.0.1 2003
```

