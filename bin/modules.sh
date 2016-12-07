
# 対応言語
typeset -r LANGUAGE_NAME_C=C
typeset -r LANGUAGE_NAME_CPP=C++
typeset -r LANGUAGE_NAME_D=D
typeset -r LANGUAGE_NAME_Ruby=Ruby
typeset -r LANGUAGE_NAME_Perl=Perl
typeset -r LANGUAGE_NAME_Python=Python
typeset -r LANGUAGE_NAME_Java=Java
typeset -r LANGUAGE_NAME_CS=C#
typeset -r LANGUAGE_NAME_JS=JavaScript

# 拡張子
typeset -r LANGUAGE_EX_C=c
typeset -r LANGUAGE_EX_CPP=cpp
typeset -r LANGUAGE_EX_D=d
typeset -r LANGUAGE_EX_Ruby=rb
typeset -r LANGUAGE_EX_Perl=pl
typeset -r LANGUAGE_EX_Python=py
typeset -r LANGUAGE_EX_Java=java
typeset -r LANGUAGE_EX_CS=cs
typeset -r LANGUAGE_EX_JS=js

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
    echo "=== ${LANGUAGE_NAME_C} ===" >&2
    local src=Main.${LANGUAGE_EX_C}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    gcc ${src}
    ./a.out < /dev/stdin
    rm a.out
    return 0;
}

# C++の実行
function run_CPP() {
    echo "=== ${LANGUAGE_NAME_CPP} ===" >&2
    local src=Main.${LANGUAGE_EX_CPP}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    g++ ${src}
    ./a.out < /dev/stdin
    rm a.out
    return 0;
}

# D言語の実行
function run_D() {
    echo "=== ${LANGUAGE_NAME_D} ===" >&2
    local src=Main.${LANGUAGE_EX_D}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    dmd ${src}
    ./Main < /dev/stdin
    rm Main Main.o
    return 0;
}

# Rubyの実行
function run_Ruby() {
    echo "=== ${LANGUAGE_NAME_Ruby} ===" >&2
    local src=Main.${LANGUAGE_EX_Ruby}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    ruby ${src} < /dev/stdin
    return 0;
}

# Perlの実行
function run_Perl() {
    echo "=== ${LANGUAGE_NAME_Perl} ===" >&2
    local src=Main.${LANGUAGE_EX_Perl}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    perl ${src} < /dev/stdin
    return 0;
}

# Pythonの実行
function run_Python() {
    echo "=== ${LANGUAGE_NAME_Python} ===" >&2
    local src=Main.${LANGUAGE_EX_Python}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    python ${src} < /dev/stdin
    return 0;
}

# Javaの実行
function run_Java() {
    echo "=== ${LANGUAGE_NAME_Java} ===" >&2
    local src=Main.${LANGUAGE_EX_Java}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    javac ${src} < /dev/stdin
    java Main
    rm Main.class
    return 0;
}

# C#の実行
function run_CS() {
    echo "=== ${LANGUAGE_NAME_CS} ===" >&2
    local src=Main.${LANGUAGE_EX_CS}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    mcs -sdk:4.5 ${src}
    mono Main.exe < /dev/stdin
    rm Main.exe
    return 0;
}

# JavaScriptの実行
function run_JS() {
    echo "=== ${LANGUAGE_NAME_JS} ===" >&2
    local src=Main.${LANGUAGE_EX_JS}
    if [ ! -e ${src} ];then echo "ファイルがありません。"; return 0;fi
    node ${src} < /dev/stdin
    return 0;
}

