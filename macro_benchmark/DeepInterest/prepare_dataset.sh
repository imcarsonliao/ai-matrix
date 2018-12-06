#!/bin/bash

mkdir raw_data
cd utils
./0_download_raw.sh
python3 1_convert_pd.py
python3 2_remap_id.py
cd ../din
python3 build_dataset.py

