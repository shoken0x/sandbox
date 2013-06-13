#!/bin/sh
while true
do
	clear
        echo "ディレクトリの状況"
        echo "[master]"
        ls master
        echo "[login]"
        ls login
	echo "[question]"
	ls  question
	echo "[answer]"
	ls  answer
        echo "[score]"
        ls score
       echo "" 
        
        echo "得点状況"
        for fn in score/*
        do
        	echo $fn
		cat $fn
	done
	sleep 1
done

