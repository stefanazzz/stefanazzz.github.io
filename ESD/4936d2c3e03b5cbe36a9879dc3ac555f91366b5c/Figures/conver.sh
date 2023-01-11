#!/bin/bash
for i in *.pdf 
do
	bna=`basename $i .pdf`
	bnb=$bna.svg
	if [ -f $bnb ]; then
		:
	else
		echo $i
		pdf2svg $i `basename $i .pdf`.svg
        fi
done
