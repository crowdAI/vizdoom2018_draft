#!/bin/bash
#
# cd /home/crowdai/ViZDoom
# rm -rf CMakeCache.txt
# cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_PYTHON3=ON=ON -DBUILD_JAVA=OFF -DBUILD_LUA=OFF
# ./cmake_all.sh
# make -j40
# sudo make install
# sudo python3 setup.py install
# sleep 3600

cd /home/crowdai/ViZDoom
sudo pip3 install -U .
cd /home/crowdai/
echo "Beginning execution of host.py"
sudo /home/crowdai/host.py
