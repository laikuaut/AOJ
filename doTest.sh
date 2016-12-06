#!/bin/bash -u

DIR_NAME=${1}
Q_NAME=$(basename $DIR_NAME)

# テストデータ取得
mkdir data -p
for num in {1..100}
do
    pre_num=$((num - 1))
    if [ ! -e data/${Q_NAME}_${num}_in.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=in" -o data/${Q_NAME}_${num}_in.txt >& /dev/null
        grep "<html>" data/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm data/${Q_NAME}_${num}_in.txt
            break
        fi
    fi

    if [ ! -e data/${Q_NAME}_${num}_out.txt ];then
        curl "http://analytic.u-aizu.ac.jp:8080/aoj/testcase.jsp?id=${Q_NAME}&case=${num}&type=out" -o data/${Q_NAME}_${num}_out.txt >& /dev/null
        grep "<html>" data/${Q_NAME}_${num}_in.txt >& /dev/null
        if [[ $? == 0 ]];then
            rm data/${Q_NAME}_${num}_out.txt
            break
        fi
    fi

    if [[ ${pre_num} != 0 ]];then
        result=$(diff data/${Q_NAME}_${num}_in.txt data/${Q_NAME}_${pre_num}_in.txt)
        if [ "${result}" = "" ];then
            grep "<html>" data/${Q_NAME}_${num}_in.txt >& /dev/null
            grep "<html>" data/${Q_NAME}_${num}_out.txt >& /dev/null
            break
        fi
    fi
done

# テストデータ削除
#rm data/*
### 以下作成中
