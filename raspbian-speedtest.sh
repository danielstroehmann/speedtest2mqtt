#!/bin/bash
# --------------------------------------------------------------------
# IMPORTANT: DO NOT REMOVE VARIABLES IF N/A BUT SET THEM TO EMPTY ("")
#
# ALSO NOTE THAT THE MOSQUITTO PARAMETER ARE INCLUDED IN THE VARIABLE!
# --------------------------------------------------------------------
#
# IP address or FQDN
# Hint: set to "" if localhost
BROKER_ADDR="-h 192.168.0.1"
# Either 8883 for SSL or 1883 for non encrypted transport depending on the configuration of your broker
# Hint: set to "" if 1883 (default, non-encrypted)
BROKER_PORT="-p 8883"
# SECURITY CONFIGURATION
# Certification Authority certificate to validate broker certificate
# Hint: set to "" if no encryption needed
CAFILE="--cafile /etc/mosquitto/ca.crt"
# Client certificate for authentification
# Hint: set to "" if no encryption needed
CLIENT_CERT="--cert /etc/mosquitto/client.crt"
# Client private key for authentification
# Hint: set to "" if no encryption needed
CLIENT_KEY="--key /etc/mosquitto/client.key"
# Topics for MQTT
UPLOAD_TOPIC="-t home/internetprovider/performance/upload"
DOWNLOAD_TOPIC="-t home/internetprovider/performance/download"
# Perform speedtest and store output in variable
RESULT=$(speedtest --json)
# Grab upload and download values from speedtest result
UPLOAD_VALUE=$(echo $RESULT | jq '.upload')
DOWNLOAD_VALUE=$(echo $RESULT | jq '.download')
# Send upload speed to broker
mosquitto_pub $BROKER_ADDR $BROKER_PORT $UPLOAD_TOPIC -m $UPLOAD_VALUE $CAFILE $CLIENT_CERT $CLIENT_KEY
# Send download speed to broker
mosquitto_pub $BROKER_ADDR $BROKER_PORT $DOWNLOAD_TOPIC -m $DOWNLOAD_VALUE $CAFILE $CLIENT_CERT $CLIENT_KEY
