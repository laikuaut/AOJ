#!/bin/bash -u

# このシェルスクリプトが配置してあるディレクトリ
SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
# モジュール群を読み込み
source ${SCRIPT_DIR}/modules.sh

DIR_NAME=${1}
Q_NAME=$(basename $DIR_NAME)
DATA_DIR=test_data

# テストデータ取得
mkdir ${DATA_DIR} -p
for num in {1..100}
do
    pre_num=$((num - 1))
    if [ ! -e ${DATA_DIR}/${Q_NAME}_${num}_in.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=in" -o ${DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        grep "<html>" ${DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm ${DATA_DIR}/${Q_NAME}_${num}_in.txt
            break
        fi
    fi

    if [ ! -e ${DATA_DIR}/${Q_NAME}_${num}_out.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=out" -o ${DATA_DIR}/${Q_NAME}_${num}_out.txt >& /dev/null
        grep "<html>" ${DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm ${DATA_DIR}/${Q_NAME}_${num}_out.txt
            break
        fi
    fi

    if [[ ${pre_num} != 0 ]];then
        result=$(diff ${DATA_DIR}/${Q_NAME}_${num}_in.txt ${DATA_DIR}/${Q_NAME}_${pre_num}_in.txt)
        if [ "${result}" = "" ];then
            grep "<html>" ${DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
            grep "<html>" ${DATA_DIR}/${Q_NAME}_${num}_out.txt >& /dev/null
            break
        fi
    fi
done

# プログラム実行
${SCRIPT_DIR}/run_AOJ.sh ${DIR_NAME}

# テストデータ削除
#rm data/*
### 以下作成中
