#!/bin/bash
# ==============================================================================
#  FILE         : openssl_script.sh
#  COPYRIGHT    : (c) 2016 Axway GMBH
#  REVISION     : $Id: openssl_script.sh,v 1.0.0 2016/03/29
#  Modification History
#  Name         Date            Version         Description
#  Developer   2016-04-03       1.0.0           Created openssl_script.sh
#
# ============================================================================
# Openssl
# call script example: ./openssl_script.sh namePEMcertificate nameInputFile nameOutputfile
# ============================================================================
array=( $@ )
len=${#array[@]}
args=${array[@]:0:$len-1}

echo openssl smime -encrypt -in ${array[$len-2]} -out  ${array[$len-1]}  ${array[$len-3]}
openssl smime -encrypt -in ${array[$len-2]} -out  ${array[$len-1]}  ${array[$len-3]}
