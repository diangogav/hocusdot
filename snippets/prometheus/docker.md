/etc/docker/daemon.json
```
{
  "metrics-addr": "127.0.0.1:9323",
  "experimental": true
}
```

`sudo systemctl restart docker`

`curl localhost:9323/metrics`

enable cAdvisor

```yml
version: '3.4'
services:
  cadvisor:
    image: gcr.io/cadvisor/cadvisor
    container_name: cadvisor
    privileged: true
    devices:
      - "/dev/kmsg:/dev/kmsg"
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker.ro
      - /dev/disk/:/dev/disk:ro
    ports:
      - 8080:8080
```