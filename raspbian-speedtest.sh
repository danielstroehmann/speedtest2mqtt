#!/bin/bash
# --------------------------------------------------------------------
# IMPORTANT: DO NOT REMOVE VARIABLES IF N/A BUT SET THEM TO EMPTY ("")
#
# ALSO NOTE THAT THE MOSQUITTO PARAMETER ARE INCLUDED IN THE VARIABLE!
# --------------------------------------------------------------------
#
# IP address or FQDN
# Hint: set to "" if localhost
MYBROKER="-h 192.168.0.1"
# Either 8883 for SSL or 1883 for non encrypted transport depending on the configuration of your broker
# Hint: set to "" if 1883 (default, non-encrypted)
MYBROKERPORT="-p 8883"
# SECURITY CONFIGURATION
# Certification Authority certificate to validate broker certificate
# Hint: set to "" if no encryption needed
MYCAFILE="--cafile /etc/mosquitto/ca.crt"
# Client certificate for authentification
# Hint: set to "" if no encryption needed
MYCERT="--cert /etc/mosquitto/client.crt"
# Client private key for authentification
# Hint: set to "" if no encryption needed
MYKEY="--key /etc/mosquitto/client.key"
# Topics for MQTT
MYTOPICUPLOAD="-t /home/unitymedia/performance/upload"
MYTOPICDOWNLOAD="-t /home/unitymedia/performance/download"
# Perform speedtest and store output in variable
MYRESULT=$(speedtest --json)
# Grab upload and download values from speedtest result
MYUPLOADVALUE=$(echo $MYRESULT | jq '.upload')
MYDOWNLOADVALUE=$(echo $MYRESULT | jq '.download')
# Send upload speed to broker
mosquitto_pub -h $MYBROKER $MYBROKERPORT $MYTOPICUPLOAD -m $MYUPLOAD $MYCAFILE $MYCERT $MYKEY
# Send download speed to broker
mosquitto_pub -h $MYBROKER $MYBROKERPORT $MYTOPICDOWNLOAD -m $MYDOWNLOAD $MYCAFILE $MYCERT $MYKEY
