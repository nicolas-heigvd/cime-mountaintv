#!/bin/bash

source $(pwd)/.env

mode="Escalade"
distmodel="RadialBasic"
cwd=$(pwd)

cd MICMAC/${mode^^}_SUBFRAMES/

for i in {1..4};
    do
    cd ${cwd}/MICMAC/${mode^^}_SUBFRAMES/${i} ;

    mkdir -p sparse_clouds/ ;
    mkdir -p dense_clouds/ ;

    mm3d AperiCloud ".*.png" Ori-${distmodel} Out=sparse_clouds/AperiCloud_${distmodel}.ply ;

    read -p "Press [Enter] to start compute dense point cloud..." ;

    mm3d C3DC BigMac ".*.png" Ori-${distmodel} Out=dense_clouds/BigMac_${distmodel}.ply;
done
