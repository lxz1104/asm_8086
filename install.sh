#!/bin/bash
echo 'Installing...'

mkdir -p ~/ms-dos

cp -rf ./ASM ~/ms-dos/
cp -rf ./FILE ~/ms-dos/ 
cp -rf ./MASM ~/ms-dos/ 
cp -rf ./VIM ~/ms-dos/ 

cp -f ~/.dosbox/dosbox-0.74.conf ./config/dosbox.config.bak
cp -f ./config/dosbox.conf ~/.dosbox/dosbox-0.74.conf

echo 'Success!'
