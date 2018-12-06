#!/bin/bash

cd CNN_Tensorflow
./setup.sh
cd ..

cd DeepInterest
./setup.sh
cd ..

cd Mask_RCNN
./setup.sh
cd ..

python -m pip install request
python -m pip install pandas
python -m pip install future
apt-get install zip
pip3 install xlsxwriter
apt install bc
