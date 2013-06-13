#/bin/sh
if [ $# -eq 2 ]
then
	cd nakata/bin
	java yawaraka.main.Control $1 $2 | sed '/^ *$/d' 
else
	echo "使い方 : $ ./run.sh (ブロック数) (段数)"
fi
