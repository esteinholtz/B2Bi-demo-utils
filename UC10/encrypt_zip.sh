#!/bin/bash
# ==============================================================================
#  FILE         : encrypt_zip.sh
#  COPYRIGHT    : (c) 2016 Axway GMBH
#  REVISION     : $Id: encrypt_zip.sh,v 1.0.0 2016/05/13
#  Modification History
#  Name         Date            Version         Description
#  Developer   2016-05-13       1.0.0           Created encrypt_zip.sh
#
# ============================================================================
# Encrypt and Zip
# call script example: ./encrypt_zip.sh nameInputFile nameOutputfile
# ============================================================================
array=( $@ )
len=${#array[@]}
args=${array[@]:0:$len-1}

source /home/axway/Demos/UC10/env.cfg
PWD_DEC64=$(echo $PASSWORD | openssl enc -d -base64)

cp ${array[$len-2]} ${array[$len-3]}

echo 7za a -tzip -p"$PWD_DEC64" -mem=AES256 ${array[$len-1]} ${array[$len-2]}
7za a -tzip -p"$PWD_DEC64" -mem=AES256 ${array[$len-1]} ${array[$len-2]}
mv ${array[$len-1]}.zip ${array[$len-1]}

