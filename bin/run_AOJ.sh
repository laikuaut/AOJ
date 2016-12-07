#!/bin/bash -ue

# このシェルスクリプトが配置してあるディレクトリ
SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
# 実行カレントディレクトリ
CURRENT_DIR=`pwd`
# モジュール群を読み込み
source ${SCRIPT_DIR}/AOJ_modules.sh

# Usage
function Usage() {
    echo $@
    echo
    cat << __END__
Usage:
  `basename $0` [-i input_file] [-o output_prefix] [-h] dir_path [languages ...]

Description:
  dir_path  : 実行ディレクトリパス
  languages : 実行言語名
              対応言語 : ${LANGUAGES[@]}

Options:
  -i input_file    : 入力ファイル
  -o output_prefix : 出力ファイルのprefix指定
  -h ヘルプ表示

__END__

    exit 1
}

# オプション解析
while getopts ":i:o:h" OPT
do
    case "${OPT}" in
        i)  OPT_VALUE_i=${OPTARG} ;;
        o)  OPT_VALUE_o=${OPTARG} ;;
        h)  Usage "[Help]" ;;
        :)  echo "[ERROR] Option argument is undefined." ;;
        \?) echo "[ERROR] Undefined options." ;;
        *)  echo "${name} Didn't match anything" ;;
    esac
done

# getopts分の引数値移動
shift $(($OPTIND - 1))

# 入力ファイル
if [ -v OPT_VALUE_i ];then
    input_file=$(get_abspath_from_current "${OPT_VALUE_i}")
else
    # Ctrl+Dで入力終了
    input_file=${CURRENT_DIR}/result_data/tmp_in
    mkdir $(dirname ${input_file}) -p
    echo "入力待ち(Ctrl+Dで終了)"
    cat /dev/stdin > ${input_file}
fi
# ファイルの存在確認
if [ ! -f ${input_file} ];then
    Usage "入力ファイルがありません。"
fi

# 引数(後でオプション化)
if [[ $# < 1 ]];then
    Usage "引数不足、実行ディレクトリを指定してください。"
fi

# 実行ディレクトリ
dir_name=${1}; shift;

# 出力ファイル
if [ -v OPT_VALUE_o ];then
    output_prefix=$(get_abspath_from_current "${OPT_VALUE_o}")
else
    output_prefix=${CURRENT_DIR}/result_data/$(basename ${dir_name})_out
fi
mkdir $(dirname ${output_prefix}) -p

# 言語取得
if [[ $# > 0 ]];then
    languages=($@)
else
    languages=(${LANGUAGES[@]})
fi

pushd ${dir_name}

# 対応言語確認
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
        Usage "未対応の言語が含まれています。"
    fi
done

# 言語ごとの実行開始
for in_lang in ${languages[@]}
do
    if [ "${in_lang}" = "${LANGUAGE_NAME_C}"      ];then run_C      < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_C}.txt     ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_CPP}"    ];then run_CPP    < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_CPP}.txt   ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_D}"      ];then run_D      < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_D}.txt     ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_Ruby}"   ];then run_Ruby   < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_Ruby}.txt  ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_Perl}"   ];then run_Perl   < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_Perl}.txt  ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_Python}" ];then run_Python < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_Python}.txt; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_Java}"   ];then run_Java   < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_Java}.txt  ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_CS}"     ];then run_CS     < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_CS}.txt    ; fi
    if [ "${in_lang}" = "${LANGUAGE_NAME_JS}"     ];then run_JS     < ${input_file} | tee ${output_prefix}_${LANGUAGE_EX_JS}.txt    ; fi
done

popd

# 後処理
tmp_file=${CURRENT_DIR}/result_data/tmp_in
if [ -f ${tmp_file} ];then rm ${tmp_file}; fi

