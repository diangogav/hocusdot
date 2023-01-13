sudo cp node_exporter /usr/local/bin

sudo useradd --no-create-home --shell /bin/false node_exporter

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

sudo nano /etc/systemd/system/node_exporter.service

```
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
```

sudo systemctl daemon-reload

sudo systemctl start node_exporter