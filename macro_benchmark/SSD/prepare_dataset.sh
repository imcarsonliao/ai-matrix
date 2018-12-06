#!/bin/bash

cd checkpoints
if [ ! -f "ssd_300_vgg.ckpt.data-00000-of-00001" ] || [ ! -f "ssd_300_vgg.ckpt.index" ]; then
    unzip ssd_300_vgg.ckpt.zip
else
    echo "Checkpoint already unzipped"
fi
cd ..

if [ ! -d "VOC2007" ]; then
    mkdir VOC2007
    cd VOC2007
    wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtrainval_06-Nov-2007.tar
    wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar
    tar -xvf VOCtrainval_06-Nov-2007.tar
    mv VOCdevkit/VOC2007 trainval
    tar -xvf VOCtest_06-Nov-2007.tar
    mv VOCdevkit/VOC2007 test
    rm -r VOCdevkit
    mkdir trainval_tf test_tf
    cd ..
    python3 tf_convert_data.py --dataset_name=pascalvoc --dataset_dir=./VOC2007/trainval/ --output_name=voc_2007_train --output_dir=./VOC2007/trainval_tf
    python3 tf_convert_data.py --dataset_name=pascalvoc --dataset_dir=./VOC2007/test/ --output_name=voc_2007_test --output_dir=./VOC2007/test_tf
else
    echo "VOC2007 already exists"
fi

