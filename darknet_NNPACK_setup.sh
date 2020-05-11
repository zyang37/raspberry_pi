#!/bin/bash

cd
pwd

sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get install python-pip

sudo pip install --upgrade git+https://github.com/Maratyszcza/PeachPy
sudo pip install --upgrade git+https://github.com/Maratyszcza/confu

git clone https://github.com/ninja-build/ninja.git
cd ninja
git checkout release
./configure.py --bootstrap
export NINJA_PATH=$PWD

cd
git clone https://github.com/digitalbrain79/NNPACK-darknet.git
cd NNPACK-darknet
confu setup
python ./configure.py --backend auto
$NINJA_PATH/ninja
sudo cp -a lib/* /usr/lib/
sudo cp include/nnpack.h /usr/include/
sudo cp deps/pthreadpool/include/pthreadpool.h /usr/include/

cd
git clone https://github.com/digitalbrain79/darknet-nnpack.git
cd darknet-nnpack
make
