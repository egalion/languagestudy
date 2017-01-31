#!/bin/bash

# requires sed, ex, tr, wrap, w3m, xidel

echo "Insert word / Напиши дума"
echo "Press Ctrl+C to quit / Натисни Ctrl+C за изход"

while :
do

read WORDD

echo

# echo Suggestions / Предложения:
# echo ---
#echo $(xidel http://eurodict.com/$WORDD+search-$WORDD-ed_sp_bg.html -s -e "//TD[@class='found_container']" | sed '/A, B, C.*/Q;s/previous next//g' | tr '\n' ' ')

#echo ---
#echo
#echo Translation / Превод
#echo

xidel http://eurodict.com/$WORDD+search-$WORDD-ed_sp_bg.html -s -e "//TD[@class='meaning_container']" --output-format=html | sed -e '1,/span class=\"wordtitle\"/d;/<script type=\"text\/javascript\">/Q;s/<hr>/<br><br>/g' | sed 's/.*FORM><\/DIV><\/DIV>//;s/<div class.*//' | ex -s +'%s/<h.\{-}<\/h\d>//ge' +%p +q! /dev/stdin | w3m -T text/html -dump -cols 65 | head -n 25


echo

done
