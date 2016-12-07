#!/bin/bash -u

# このシェルスクリプトが配置してあるディレクトリ
SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
# モジュール群を読み込み
source ${SCRIPT_DIR}/AOJ_modules.sh

if [[ $# != 1 ]];then
    echo "ディレクトリを指定してください。"
    exit 1
fi
DIR_NAME=${1}
Q_NAME=$(basename $DIR_NAME)
TEST_DATA_DIR=test_data
RESULT_DATA_DIR=result_data

# テストデータ取得
mkdir ${TEST_DATA_DIR} ${RESULT_DATA_DIR} -p
for num in {1..100}
do
    pre_num=$((num - 1))
    if [ ! -e ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=in" -o ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        grep "<html>" ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt
            break
        fi
    fi

    if [ ! -e ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=out" -o ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt >& /dev/null
        grep "<html>" ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt
            break
        fi
    fi

    if [[ ${pre_num} != 0 ]];then
        result=$(diff ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt ${TEST_DATA_DIR}/${Q_NAME}_${pre_num}_in.txt)
        if [ "${result}" = "" ];then
            rm ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt
            rm ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt
            break
        fi
    fi

    # プログラム実行と差分確認
    echo "[START] ${Q_NAME} ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt"
    ${SCRIPT_DIR}/run_AOJ.sh -i ${TEST_DATA_DIR}/${Q_NAME}_${num}_in.txt -o ${RESULT_DATA_DIR}/${Q_NAME}_${num}_out ${DIR_NAME} >& /dev/null
    for result_file in ${RESULT_DATA_DIR}/${Q_NAME}_${num}_out_*.txt
    do
        result=$(diff ${result_file} ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt)
        if [ "${result}" = "" ];then
            echo -n "."
        else
            echo -n "F"
        fi
    done
    echo
    echo "[END]"

    # 差分表示
    for result_file in ${RESULT_DATA_DIR}/${Q_NAME}_${num}_out_*.txt
    do
        result=$(diff ${result_file} ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt)
        if [ "${result}" != "" ];then
            echo "[NG] diff ${result_file} ${TEST_DATA_DIR}/${Q_NAME}_${num}_out.txt"
            echo "${result}"
        fi
    done
done

