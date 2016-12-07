#!/bin/bash -ue

# 対応言語
LANGUAGES=(
C
C++
D
Ruby
Perl
Python
Java
C#
JavaScript
)

function run_C() {
    echo "=== C言語 ==="
    if [ ! -e Main.c ];then echo "ファイルがありません。"; return 0;fi
    gcc Main.c
    ./a.out
    rm a.out
    return 0;
}

function run_CPP() {
    echo "=== C++ ==="
    if [ ! -e Main.cpp ];then echo "ファイルがありません。"; return 0;fi
    g++ Main.cpp
    ./a.out
    rm a.out
    return 0;
}

function run_D() {
    echo "=== D ==="
    if [ ! -e Main.d ];then echo "ファイルがありません。"; return 0;fi
    dmd Main.d
    ./Main
    rm Main Main.o
    return 0;
}

function run_Ruby() {
    echo "=== Ruby ==="
    if [ ! -e Main.rb ];then echo "ファイルがありません。"; return 0;fi
    ruby Main.rb
    return 0;
}

function run_Perl() {
    echo "=== Perl ==="
    if [ ! -e Main.pl ];then echo "ファイルがありません。"; return 0;fi
    perl Main.pl
    return 0;
}

function run_Python() {
    echo "=== Python ==="
    if [ ! -e Main.py ];then echo "ファイルがありません。"; return 0;fi
    python Main.py
    return 0;
}

function run_Java() {
    echo "=== Java ==="
    if [ ! -e Main.java ];then echo "ファイルがありません。"; return 0;fi
    javac Main.java
    java Main
    rm Main.class
    return 0;
}

function run_CS() {
    echo "=== C# ==="
    if [ ! -e Main.cs ];then echo "ファイルがありません。"; return 0;fi
    mcs -sdk:4.5 Main.cs
    mono Main.exe
    rm Main.exe
    return 0;
}

function run_JS() {
    echo "=== JavaScript(node.js) ==="
    if [ ! -e Main.js ];then echo "ファイルがありません。"; return 0;fi
    node Main.js
    return 0;
}

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

