#!/bin/sh
#ディレクトリ

#共通ヘッダファイル読み込み
. header

#人数
P_NO=`cat ${P_NO_FILE}`

#1のときはデバッグ
DEBUG=0

#作業用変数

#問題番号
i=1

#順位
RANK=0

#獲得点
POINT=0

#合計点
SUM=0


######################
#処理開始

#オープニング
if [ $# -eq 1 ]
then
  clear
  echo "やわらかなかた塾"
  echo ""
  echo "Enterキーを押してね"
  read
else
  clear
  ./logo.sh
fi

clear

#名前入力
echo -n "お名前を教えてね："
read NAME
echo ""
echo "${NAME}ちゃんこんにちは！"
echo ""
echo -n "みんなが来るまでで待っててね"

#ログインチェックファイルを作成
touch ${LOGIN}/${NAME}

[ ${DEBUG} -eq 1 ] && echo "[DEBUG] touch ${LOGIN}/${NAME} file" 

#ログイン待ち
while true
do
    clear
    echo "${P_NO}人お友達がそろうまでちょっと待っててね。"
    echo ""
    echo "--今いるお友達-----------------------"
    
    #ログインメンバの表示
    for fn in `ls ${LOGIN}`
    do
        echo ${fn}ちゃん
    done
    
    echo "-------------------------------------"
    
    LOGIN_NO=`ls ${LOGIN} | wc -l`
    if [  ${LOGIN_NO} -eq ${P_NO} ] 
    then
       break
    fi
    sleep 1
done

echo "みんな揃ったよ！準備はいいかな？"
echo ""
echo "--間もなく問題が始ります--"

#問題ループ
while [ ${i} -le ${Q_NO} ]
do
  if [ -f "${QUESTION}/${i}.q" ]
  then 

    #問題の答え格納
    ANS=`cat ${MASTER}/${i}.a`
    
    clear
    echo "第${i}問"
    sleep 1
    echo "ブロックはなんこあるかな？" 
   
    #問題表示
    [ ${DEBUG} -eq 1 ] && echo "[DEBUG] $i.q exist"
    cat ${QUESTION}/${i}.q
    
   
    #回答入力
    echo -n ">"
    read YOUR_ANS
    echo ""

    [ ${DEBUG} -eq 1 ] && echo "[DEBUG] your answer is ${YOUR_ANS}"
    [ ${DEBUG} -eq 1 ] && echo "[DEBUG] anwer is ${ANS}"

    #正解判定
    if [ ${YOUR_ANS} -eq ${ANS} ] 
    then 
	echo "ピンポン (^o^)v"
        echo ""
        EXT="correct"
        PM=""
        STR="正解した人"
    else
	echo "はっずれ～ (T_T)  正解は${ANS}個だよ"
        echo ""
        EXT="false"
        PM="-"
        STR="はずれた人"
    fi

    #答えた人の中で何番目か
    A_RANK=`ls ${ANSWER} | wc -l`
    A_FILE=${A_RANK}_${NAME}.${EXT}


    #回答チェックファイルを作成
    touch ${ANSWER}/${A_FILE}
    
    #正解、または不正解のうち何番目か
    RANK=`ls ${ANSWER}/*.${EXT} | wc -l`
    
    #一位に特別表示
    if [ ${RANK} -eq 1 ]
      then
      #一位正解
      if [ ${EXT} == "correct" ]
      then
        echo "   (ﾟ∀ﾟ)ｷﾀｺﾚ!!"
        echo ""
      fi
      #逆一位
      if [ ${EXT} == "false" ]
      then
        echo "  (ι´Д｀)っ　だめぽ"
        echo ""
      fi
    fi
    echo "${STR}の中で ${RANK}番目 だよ"
    echo ""
    
    #得点計算
    POINT=${PM}${POINT_LIST[${RANK}]}

    #合計点加算
    SUM=`expr ${SUM} + ${POINT}`

    echo "今回は ${POINT}点 だよ"
    echo ""
    echo "今までのあわせて ${SUM}点 だよ"
    echo ""


    #自分の点数を記入
    touch ${SCORE}/${NAME}
    echo ${SUM} > ${SCORE}/${NAME}

    ((i++))
    
    echo ""
    echo "みんなが終わるまでちょっと待ってね"
    echo ""

    #他の人の進捗を表示する

    #今の回答人数
    NOW_NUM=`ls ${ANSWER}|wc -l`
    #前までの回答人数
    OLD_NUM=$NOW_NUM

    #全員回答するまでループ
    while [ ! ${P_NO} -eq  ${NOW_NUM} ]
    do
      NOW_NUM=`ls ${ANSWER}|wc -l` 
    
      if [ ${OLD_NUM} -lt ${NOW_NUM} ]
      then
         #前よりも回答人数が増えた

         #もっとも最近答えた人を表示 
         TMP=`ls ${ANSWER} | tail -n 1`
         TMP=${TMP#*_}
         echo "${TMP%.*}ちゃんがこたえたよ"

         #前の人数を更新
         OLD_NUM=${NOW_NUM}
      fi
    done
     
    sleep 2
 fi 
done

clear 
echo ""
echo "げーむ終了～"

#集計結果が出るまで待つ
while [ ! -f ${RESULT} ]
do
  sleep 1
done 

#総合順位発表
clear
echo "そうごうじゅんいだよ"
echo ""

awk -F : '{printf "%-10s%5d\n", $1,$2}' ${RESULT} |sort -nr -k 2

[ ${DEBUG} -eq 1 ] && echo "[DEBUG] process done"

