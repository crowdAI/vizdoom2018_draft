#!/bin/bash

rm -rf host/ViZDoom
cp -r ViZDoom host/
./build.sh random
./build.sh host
# docker tag cig2017_random spmohanty/cig2017_random
# docker tag cig2017_host spmohanty/cig2017_host
# docker push spmohanty/cig2017_random
# docker push spmohanty/cig2017_host
#
docker tag cig2017_random localhost:5000/cig2017_random
docker tag cig2017_host localhost:5000/cig2017_host
docker push localhost:5000/cig2017_random
docker push localhost:5000/cig2017_host
