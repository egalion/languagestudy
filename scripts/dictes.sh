#!/bin/bash

# requires sed, ex, tr, wrap, w3m, xidel

echo "Insert word / Напиши дума"
echo "Press Ctrl+C to quit / Натисни Ctrl+C за изход"

while :
do

read WORDD

echo

xidel  https://www.dict.com/Испанско-български/$WORDD? -s -e "(//DIV[@class='mcardlc mcardlcs'])[2]" --output-format=html | ex -s +'%s/<span class.\{-}>//ge' +%p +q! /dev/stdin | ex -s +'%s/<\/span>/\, /ge' +%p +q! /dev/stdin | ex -s +'%s/<img class.\{-}>//ge' +%p +q! /dev/stdin | w3m -T text/html -dump -cols 65



echo

xidel https://www.dict.com/Испанско-български/$WORDD? -s -e "//DIV[@id='mycol-center']" --output-format=html | w3m -T text/html -dump -cols 65

echo


done
