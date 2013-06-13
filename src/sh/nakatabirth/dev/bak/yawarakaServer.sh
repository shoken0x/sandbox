#!/bin/sh
#第一引数はプレイヤーの人数
MEMBER=$1
#ディレクトリ
ANSWER=./answer
QUESTION=./question
MASTER=./master
LOG=./log
#日付
DATE=`date '+%Y%m%d%H%M%S'`
#問題数
N=10
#作業用
i=1

#前回のゴミを削除
./clean.sh


#問題作成
./makeQuestion.sh

echo "yawarakaServer start"

#問題が無くなるまでループ
while [ "${i}" -le "${N}" ] 
do
  #メンバーが全員答えたかどうかチェック
  if [ `ls ${ANSWER} | wc -l` -ge ${MEMBER} ]; then
    echo "[DEBUG] menber all answer"
    echo "$i"
    
    #全員分のファイルがそろったら
    #次の問題をコピー
    cp ${MASTER}/${i}.q ${QUESTION}/${i}.q
    echo "[DEBUG] cp"
    #メンバーの点数の集計
    touch ${LOG}/${DATE}_${i}.result
    for file in ${ANSWER}/*
    do
        echo "${file##./*_}:`cat ${file}`" >> ${LOG}/${DATE}_${i}.result
    done
    
    cat ${LOG}/${DATE}_${i}.result
    #メンバーファイルの削除
    rm -f ./answer/*
    #正解順格納ディレクトリを削除
    rm -f ./correct/*
    rm -f ./false/*
    echo "[DEBUG] remove"
    ((i++))
    echo "$i"
  else
    echo "[DEBUG] menber not all answer"
    #ls -l $ANSWER
  fi
  sleep 1
  echo "[DEBUG] sleep"
done

echo "[DEBUG] process done"
echo ""
touch ${LOG}/${DATE}_${i}.result
cp ${LOG}/${DATE}_${i}.result total.result
