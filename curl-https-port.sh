#!/bin/bash

curl -v  --proxy-cacert ca-chain.cert.pem --proxy-basic --proxy-user 'jcallen:' --proxy "https://squid-default.apps.jcallen-pxydev-1.devcluster.openshift.com:443" https://www.google.com
