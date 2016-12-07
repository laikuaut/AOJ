
# 対応言語
LANGUAGE_C=C
LANGUAGE_CPP=C++
LANGUAGE_D=D
LANGUAGE_=D

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

# C言語の実行
function run_C() {
    echo "=== C言語 ==="
    if [ ! -e Main.c ];then echo "ファイルがありません。"; return 0;fi
    gcc Main.c
    ./a.out
    rm a.out
    return 0;
}

# C++の実行
function run_CPP() {
    echo "=== C++ ==="
    if [ ! -e Main.cpp ];then echo "ファイルがありません。"; return 0;fi
    g++ Main.cpp
    ./a.out
    rm a.out
    return 0;
}

# D言語の実行
function run_D() {
    echo "=== D ==="
    if [ ! -e Main.d ];then echo "ファイルがありません。"; return 0;fi
    dmd Main.d
    ./Main
    rm Main Main.o
    return 0;
}

# Rubyの実行
function run_Ruby() {
    echo "=== Ruby ==="
    if [ ! -e Main.rb ];then echo "ファイルがありません。"; return 0;fi
    ruby Main.rb
    return 0;
}

# Perlの実行
function run_Perl() {
    echo "=== Perl ==="
    if [ ! -e Main.pl ];then echo "ファイルがありません。"; return 0;fi
    perl Main.pl
    return 0;
}

# Pythonの実行
function run_Python() {
    echo "=== Python ==="
    if [ ! -e Main.py ];then echo "ファイルがありません。"; return 0;fi
    python Main.py
    return 0;
}

# Javaの実行
function run_Java() {
    echo "=== Java ==="
    if [ ! -e Main.java ];then echo "ファイルがありません。"; return 0;fi
    javac Main.java
    java Main
    rm Main.class
    return 0;
}

# C#の実行
function run_CS() {
    echo "=== C# ==="
    if [ ! -e Main.cs ];then echo "ファイルがありません。"; return 0;fi
    mcs -sdk:4.5 Main.cs
    mono Main.exe
    rm Main.exe
    return 0;
}

# JavaScriptの実行
function run_JS() {
    echo "=== JavaScript(node.js) ==="
    if [ ! -e Main.js ];then echo "ファイルがありません。"; return 0;fi
    node Main.js
    return 0;
}
