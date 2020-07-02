#!/bin/bash

source $(pwd)/.env

distmodel="RadialBasic"

cd MICMAC/FRAMES

mkdir -p sparse_clouds/
mkdir -p dense_clouds/

mm3d AperiCloud ".*.png" Ori-${distmodel} Out=sparse_clouds/AperiCloud_${distmodel}.ply

read -p "Press [Enter] to start compute dense point cloud..."

mm3d C3DC BigMac ".*.png" Ori-${distmodel} Out=dense_clouds/BigMac_${distmodel}.ply
