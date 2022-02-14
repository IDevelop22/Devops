#!/bin/bash

echo "Testing 1"

testing="https://www.free-css.com/assets/files/free-css-templates/download/page274/salient.zip"

IFS='/' 
read -ra testArr <<< $testing 

length=${#testArr[@]}
File=${testArr[$length-1]}
echo $File

IFS='.'
read -ra fileArr <<< $File
FileName=${fileArr[0]}
echo $length
echo $last
echo $FileName
#for i in ${testArr[2]}
#do
#echo $i
#done
