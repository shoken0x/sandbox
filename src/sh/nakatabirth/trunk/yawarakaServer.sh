#!/bin/sh

#移動
cd /project/nakatabirth/trunk

. header

#日付
DATE=`date '+%Y%m%d%H%M%S'`

#作業用
i=1

################################
#処理開始

if [ ! $# -eq 1 ]
then
  echo "[ERROR]引数不正：第一引数はプレイヤー人数"
  exit 1
fi

#前回のゴミを削除
./clean.sh

#プレイヤーの人数取得
P_NO=$1

#人数ファイル作成
echo ${P_NO} > ${P_NO_FILE}

#問題作成
./makeQuestion.sh

#サーバ起動
echo "yawarakaServer start"
echo "人数=${P_NO}  問題数=${Q_NO}"


#メンバのログイン待ち
while [ ! `ls ${LOGIN} | wc -l` -eq ${P_NO} ]
do
  echo "[DEBUG] member NOT all login"
  sleep 1
done
echo "[DEBUG] member all login"

#問題配置まで３秒待つ。
sleep 3

#問題が無くなるまでループ
while [ ${i} -le ${Q_NO} ] 
do
  echo "Question No. ${QN}"
  #問題をコピー
  cp ${MASTER}/${i}.q ${QUESTION}/${i}.q
  echo "[DEBUG] cp question file"

  #メンバーが全員答えるまで待つ
  while [ ! `ls ${ANSWER} | wc -l` -eq ${P_NO} ]
  do
    echo "[DEBUG] menber NOT all answer"
    sleep 1
  done
  echo "[DEBUG] menber all answer"

  #clientが全員答えたことを確認するまで待つ
  sleep 5 

  #メンバーファイルの削除
  rm -f ./answer/*
  echo "[DEBUG] remove member file"
  echo "[DEBUG] question finish"

  #問題番号をインクリメンタル
  ((i++))
  echo "[DEBUG] inclement i (i=${i})"

done


#集計処理
touch ${RESULT}
echo "[DEBUG] touch ${RESULT}"

for user in `ls ${SCORE}`
do
  SUM=`cat ${SCORE}/${user}`
  echo "${user}:${SUM}" >> ${RESULT}
  echo "[DEBUG] ${user}:${SUM} >> ${RESULT}" 
done

