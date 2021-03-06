#!/bin/bash
#
# Copyright (c) 2016, David Hirvonen
# All rights reserved.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${DIR}/download-assets.sh

TOOLCHAIN=xcode
PATH="${DIR}/../_install/${TOOLCHAIN}/bin:${PATH}"

FACE_IMAGE=${HOME}/Downloads/face.jpg
if [ $# -ge 1 ] && [ -f ${1} ]; then
    FACE_IMAGE=${1}
fi
    
if [ ! -f ${FACE_IMAGE} ]; then
    2>&1 echo "Must specify valid face image"
    exit 1
fi

INDIR=$1

WIDTH=256

i=0

find ${INDIR} -name "*.jpg" | while read NAME;
do

    MASK=${NAME%.*}-mask.png
    [[ -f $NAME ]] && [[ -f $MASK ]] && echo "$NAME $MASK"


    TAG=${NAME##*/}
    TAG=${TAG%.*}
    INDEX=$(printf "%04d_" $i); 
    OUTPUT=/tmp/${INDEX}_${TAG}.png

    i=$((i+1))
    
    echo ${OUTPUT}

    ARGUMENTS=(\
        "--input=${NAME} "
        "--hair-mask=${MASK} "
        "--output=${OUTPUT} "
        "--width=${WIDTH} "
        "--regressor=${ASSETDIR}/dest_tracker_VJ_ibug.bin "
        "--detector=${ASSETDIR}/haarcascade_frontalface_alt.xml "
        "--log=log.txt "
    )    

    eval filter "${ARGUMENTS[*]}"
    
done


