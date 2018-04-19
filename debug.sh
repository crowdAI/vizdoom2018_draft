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

# Then view logs of the host by :
# kubectl logs vizdoom2018-grading-pod-debug -c host -f
# and of submission-01 container by :
# kubectl logs vizdoom2018-grading-pod-debug -c submission-01 -f
