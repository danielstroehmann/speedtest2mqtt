# speedtest2mqtt
**Summary**

Simple way to post raspbian native speedtest or speedtest by ookla upload and download rate to mqtt broker. 

**Preconditions**

- install mosquitto clients by e.g. `apt install mosquitto-clients`
- install (if not already) [I'm an inline-style link](https://stedolan.github.io/jq/) for json cli parsing
- speedtest and mosquitto clients are in path variable so they can be called by the commands given in the script

**Usage**

As mentioned in the scripts adopt the parameters to your needs:

- `BROKER_ADDR`: set to your IP/FQDN or set to "" in case of localhost
- `BROKER_PORT`: set to 1883 (default) or 8883 (encrypted). Can be set to "" to use 1883 as default.
- `CAFILE`: set to Certification Authoritiy certificate or set to "" to not use SSL
- `CLIENT_CERT` & `CLIENT_KEY`: set to your clients certificate files or to "" to disable TLS
- `UPLOAD_TOPIC` & `DOWNLOAD_TOPIC`: adapt to your needs


