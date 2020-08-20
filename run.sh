#!/bin/bash

set -e

cd '/usr/local/docpath/licenseserver/licenseserver/Bin'
./startServer.sh

cd /usr/local/docpath/resourcebox/Bin
exec java -jar resourceboxservice.war -logmodeconsole

