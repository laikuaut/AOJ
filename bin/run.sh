#!/bin/bash -ue

# このシェルスクリプトが配置してあるディレクトリ
SCRIPT_DIR=$(cd $(dirname ${0}); pwd)
# モジュール群を読み込み
source ${SCRIPT_DIR}/modules.sh

# Usage
function Usage() {
    echo $@
    cat << __END__
Usage:
  `basename $0` [-i input_file] [-o output_file] [-h] dir_path [languages ...]

Description:
  dir_path  : 実行ディレクトリパス
  languages : 実行言語名
              対応言語 : ${LANGUAGES[@]}

Options:
  -i input_file  : 入力ファイル
  -o output_file : 出力ファイル
  -h ヘルプ表示

__END__
}

# オプション解析
while getopts ":i:o:h" OPT
do
    case "${OPT}" in
        i)  OPT_FLAG_i=1; OPT_VALUE_i=${OPTARG} ;;
        o)  OPT_FLAG_o=1; OPT_VALUE_o=${OPTARG} ;;
        h)  Usage "[Help]" ;;
        :)  echo "[ERROR] Option argument is undefined." ;;
        \?) echo "[ERROR] Undefined options." ;;
        *)
            echo "${name} Didn't match anything" ;;
    esac
done

# getopts分の引数値移動
shift $(($OPTIND - 1))


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
