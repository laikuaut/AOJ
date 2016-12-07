#!/bin/bash -ue

# このシェルスクリプトが配置してあるディレクトリ
SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
# モジュール群を読み込み
source ${SCRIPT_DIR}/modules.sh

# 引数(後でオプション化)
if [[ $# < 1 ]];then
    echo "引数不足、実行ディレクトリを指定してください。"
    echo "compile_sample.sh dir_name [languages ...]"
    echo "対応言語 : ${LANGUAGES[@]}"
    exit 1
fi

# 実行ディレクトリ
dir_name=${1}; shift;

# 言語取得
if [[ $# > 0 ]];then
    languages=($@)
else
    languages=(${LANGUAGES[@]})
fi

pushd ${dir_name}

for in_lang in ${languages[@]}
do
    ng_lang=true
    for lang in ${LANGUAGES[@]}
    do
        if [ "${in_lang}" = "${lang}" ];then
            ng_lang=false
        fi
    done
    if [ $ng_lang = true ];then
        echo "未対応の言語が含まれています。"
        echo "対応言語 : ${LANGUAGES[@]}"
        exit 1
    fi

    if [ "${in_lang}" = "C"          ];then run_C; fi
    if [ "${in_lang}" = "C++"        ];then run_CPP; fi
    if [ "${in_lang}" = "D"          ];then run_D; fi
    if [ "${in_lang}" = "Ruby"       ];then run_Ruby; fi
    if [ "${in_lang}" = "Perl"       ];then run_Perl; fi
    if [ "${in_lang}" = "Python"     ];then run_Python; fi
    if [ "${in_lang}" = "Java"       ];then run_Java; fi
    if [ "${in_lang}" = "C#"         ];then run_CS; fi
    if [ "${in_lang}" = "JavaScript" ];then run_JS; fi
done

popd

