# Generate Hash Password
- Install apache2-utils or httpd-tools
`htpasswd -nBC 10 "" | tr -d ':\n'; echo`

edit config.yml in node_exporter and add

```yaml
basic_auth_users:
  prometheus: <password>
```

edit prometheus.yml and add

```yaml
basic_auth:
  username: <username>
  password: <plain password>
```