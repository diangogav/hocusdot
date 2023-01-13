openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout node_exporter.key -out node_exporter.crt -subj "/C=BE/ST=Antwerp/L=Brasschaat/O=Inuits/CN=localhost" -addext "subjectAltName = DNS:localhost"

```
tls_server_config:
  cert_file: <path to .crt>
  key_file: <path to .key>
```

sudo mkdir /etc/node_exporter
mv node_exporter.* /etc/node_exporter
sudo chown -R node_exporter:node_exporter /etc/node_exporter

#Copy node_exporter.crt to Prometheus server
scp username:password@node:/etc/node_exporter/node_exporter.crt /etc/prometheus

chwon prometheus:prometheus node_exporter.crt

edit /etc/prometheus/prometheus.yml
(Only needed for self signed certs)
``` yaml
scrape_configs:
    scheme: https # Use HTTPS instead of default HTTP
    tls_config:
      ca_file: /etc/prometheus/node_exporter.crt
      insecure_skip_verify: true
```

For verify
curl -u prometheus:secret-password -k https://node01:9100/metrics
