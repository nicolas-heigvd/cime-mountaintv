#!/bin/bash

source $(pwd)/.env

mode="Escalade"
distmodel="RadialBasic"
cwd=$(pwd)

rm -rf MICMAC/${mode^^}_SUBFRAMES/
mkdir -p MICMAC/${mode^^}_SUBFRAMES/

for i in {1..4};
    do
    cp -p -r INPUT/${mode}/SUBFRAMES/${i} MICMAC/${mode^^}_SUBFRAMES/${i} ;
done

for i in {1..4};
    do
    cd ${cwd}/MICMAC/${mode^^}_SUBFRAMES/${i} ;
    mm3d SetExif "frame_.*.png" F=50mm F35=35mm ;

    mm3d Tapioca MulScale "frame_.*.png" 500 1280 ;
    mm3d Tapioca MulScale "frame_.*.png" 500 1280 ExpTxt=1 ;

    #mm3d Tapioca Line "frame_.*.png" 1280 8 ;
    #mm3d Tapioca Line "frame_.*.png" 1280 8 ExpTxt=1 ;

    mm3d Tapas ${distmodel} "frame_.*.png" ;

done
