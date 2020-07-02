#!/bin/bash

source $(pwd)/.env

mkdir -p INPUT/${mode}/FRAMES/
rm -rf INPUT/${mode}/FRAMES/*

ffmpeg -i INPUT/${mode}/*.mp4 -s 1280x720 -vf fps=1 INPUT/${mode}/FRAMES/"frame_%04d.png"

echo $(($(find FRAMES -maxdepth 1 -type f -printf '+1')))" Frames extracted."
