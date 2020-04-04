# esigate-docker



```
docker run --name esigate -v esigate-logs:/usr/local/esigate/log -v esigate-conf:/usr/local/esigate/etc \
  -v esigate-ext:/usr/local/esigate/extensions --detach --publish 8080:8080 \
  --restart unless-stopped nricheton/esigate
```
