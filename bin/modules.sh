
# 対応言語
LANGUAGE_NAME_C=C
LANGUAGE_NAME_CPP=C++
LANGUAGE_NAME_D=D
LANGUAGE_NAME_Ruby=Ruby
LANGUAGE_NAME_Perl=Perl
LANGUAGE_NAME_Python=Python
LANGUAGE_NAME_Java=Java
LANGUAGE_NAME_CS=C#
LANGUAGE_NAME_JS=JavaScript

# 拡張子
LANGUAGE_EX_C=c
LANGUAGE_EX_CPP=cpp
LANGUAGE_EX_D=d
LANGUAGE_EX_Ruby=rb
LANGUAGE_EX_Perl=pl
LANGUAGE_EX_Python=py
LANGUAGE_EX_Java=java
LANGUAGE_EX_CS=cs
LANGUAGE_EX_JS=js

# 対応言語リスト
LANGUAGES=(
${LANGUAGE_NAME_C}
${LANGUAGE_NAME_CPP}
${LANGUAGE_NAME_D}
${LANGUAGE_NAME_Ruby}
${LANGUAGE_NAME_Perl}
${LANGUAGE_NAME_Python}
${LANGUAGE_NAME_Java}
${LANGUAGE_NAME_CS}
${LANGUAGE_NAME_JS}
)

# C言語の実行
function run_C() {
    echo "=== ${LANGUAGE_NAME_C} ==="
    local src=Main.${LANGUAGE_EX_C}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    gcc ${src}
    ./a.out
    rm a.out
    return 0;
}

# C++の実行
function run_CPP() {
    echo "=== ${LANGUAGE_NAME_CPP} ==="
    local src=Main.${LANGUAGE_EX_CPP}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    g++ ${src}
    ./a.out
    rm a.out
    return 0;
}

# D言語の実行
function run_D() {
    echo "=== ${LANGUAGE_NAME_D} ==="
    local src=Main.${LANGUAGE_EX_D}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    dmd ${src}
    ./Main
    rm Main Main.o
    return 0;
}

# Rubyの実行
function run_Ruby() {
    echo "=== ${LANGUAGE_NAME_Ruby} ==="
    local src=Main.${LANGUAGE_EX_Ruby}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    ruby ${src}
    return 0;
}

# Perlの実行
function run_Perl() {
    echo "=== ${LANGUAGE_NAME_Perl} ==="
    local src=Main.${LANGUAGE_EX_Perl}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    perl ${src}
    return 0;
}

# Pythonの実行
function run_Python() {
    echo "=== ${LANGUAGE_NAME_Python} ==="
    local src=Main.${LANGUAGE_EX_Python}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    python ${src}
    return 0;
}

# Javaの実行
function run_Java() {
    echo "=== ${LANGUAGE_NAME_Java} ==="
    local src=Main.${LANGUAGE_EX_Java}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    javac ${src}
    java Main
    rm Main.class
    return 0;
}

# C#の実行
function run_CS() {
    echo "=== ${LANGUAGE_NAME_CS} ==="
    local src=Main.${LANGUAGE_EX_CS}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    mcs -sdk:4.5 ${src}
    mono Main.exe
    rm Main.exe
    return 0;
}

# JavaScriptの実行
function run_JS() {
    echo "=== ${LANGUAGE_NAME_JS} ==="
    local src=Main.${LANGUAGE_EX_JS}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    node ${src}
    return 0;
}

