#!/bin/bash

echo "Please make sure you have set up your afl-net modified compiler on clang and install go (including correctly configuared the path variable). Please also make sure you have export all the func to C (with //export tage) you can for the greybox-fuzzer to work: [Y/n]"
read start
if [ $start = "Y" ]; 
then 
    echo "OK, let's us continue"
else 
    echo "Please help me set up and configure the above first"
    echo "aborting..."
    exit
fi
echo "What is the targeted path with main.go (or a go file inside main pacakge with func main()) to build with? (please do not provide the file name here)"
read targetPath
echo "targetPath $targetPath"
echo "What is the dir you want the executable be in?"
read binDir
echo "binDir $binDir"
echo "Please specify the executable name"
read exeName
echo "exeName $exeName"

currentDir="$(pwd)"
echo "currentDir $currentDir"
cd $targetPath
echo "pwd $(pwd)"
CC=afl-clang-fast go build -o $exeName ./
cd $currentDir
mkdir $binDir
cp $targetPath/$exeName $binDir/
cd $binDir
echo "Please copy the test case input dir and output dir into the current directory if you need: Done? [Y]"
read doneFlag
if [ $doneFlag = "Y" ] 
then
	echo "OK! Let's continue"
else
	echo "Invalid input, please try again"
	echo "aborting..."
	exit
fi
echo "Please specify the command you want to start the afl-fuzz (You are now inside $(pwd))(please align with the input and output dir provide all the flags needed, you may go through the docs of AFL-fuzz first)"
read cmd
$cmd
