#!/bin/bash

source $(pwd)/.env

distmodel="RadialBasic"

rm -rf MICMAC/FRAMES
mkdir -p MICMAC/FRAMES/

for i in {0..1};
    do cp -p INPUT/${mode}/FRAMES/frame_01${i}*.png MICMAC/FRAMES/ ;
done

cd MICMAC/FRAMES

mm3d SetExif "frame_.*.png" F=50mm F35=35mm

mm3d Tapioca MulScale "frame_.*.png" 500 1280
mm3d Tapioca MulScale "frame_.*.png" 500 1280 ExpTxt=1

#mm3d Tapioca Line "frame_.*.png" 1280 10
#mm3d Tapioca Line "frame_.*.png" 1280 10 ExpTxt=1

mm3d Tapas ${distmodel} "frame_.*.png"
