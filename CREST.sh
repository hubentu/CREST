#!/bin/bash

tbam=$1
gbam=$2
ref=$3
ref2=$4
host=${5:-localhost}
port=${6:-2345}
#gfServer start localhost 2345 $ref2 &
#sleep 120

cover=`basename $tbam`.cover
/opt/CREST/extractSClip.pl -i $tbam --ref_genome $ref -o /tmp/
/opt/CREST/CREST.pl -f /tmp/$cover -d $tbam -g $gbam --ref_genome $ref -t $ref2 --blatserver $host --blatport $port
