#/bin/bash

#共通ヘッダファイル読み込み
. header

P_RAND="java yawaraka.main.Rand"
P_PROC="java yawaraka.main.Control"


D_MASTER="../../../master"

INDEX=0
echo "makeQuestion start"

cd java/nakata/bin

while [ $INDEX -lt ${Q_NO} ]
do
        #ブロック数取得
	B_NO=`$P_RAND ${NO_ARRAY[${INDEX}]}`
     
        #段数取得
        D_NO=${DAN_ARRAY[${INDEX}]}
     
        ((INDEX++))

	#答えファイル作成
        echo $B_NO > $D_MASTER/${INDEX}.a
     
        #問題ファイル作成
	$P_PROC $B_NO $D_NO | sed '/^ *$/d' > $D_MASTER/${INDEX}.q
done
echo "makeQuestion end"
