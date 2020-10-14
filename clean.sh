#!/bin/bash

cat .makeignore | while read line; do mv $line $line.tmp; done

if [ -d build ]
then
	rm -r build
fi

files=$(ls source/*.rst 2> /dev/null | wc -l)
if [ $files != 0 ]
then
	rm source/*.rst
fi

cat .makeignore | while read line; do mv $line.tmp $line; done
