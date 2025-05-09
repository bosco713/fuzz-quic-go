#!/bin/bash

echo "Please make sure you have set up your afl-net modified compiler on clang and install go (including correctly configuared the path variable): [Y/n]"
read start
if [ $start = "Y" ]; 
then 
    echo "OK, let's us continue"
else 
    echo "Please help me set up and configure the above"
    exit
fi
echo "What is the targeted dir to build with?"
read targetDir
echo "targetDir $targetDir"
echo "What is the dir you want the execubtable be in?"
read binDir
echo "binDir $binDir"
echo "Please specify the executable name"
read $exeName
echo "exeName $exeName"
echo "Please make sure you have prepare your input and output dir inside the dir you want the executable to place in: [Y/n]"
read continue
if [ $continue = "Y" ]; 
then 
    echo "OK, let's us continue"
else 
    echo "Please help me provide the input and output dir then"
    exit
fi


cd $targetDir
CC=afl-clang-fast go build -o $exeName ./
cd ..
mkdir $binDir
cp $targetDir/$exeName $binDir/
cd $binDir
echo "Please specify the command you want to start the afl-fuzz"
read cmd
$cmd
