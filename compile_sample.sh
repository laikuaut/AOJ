#!/bin/bash -ue

# 引数(後でオプション化)
if [[ $# != 1 ]];then
    echo "引数不足、実行ディレクトリを指定してください。"
fi

# 実行ディレクトリ
dir_name=${1}

pushd ${dir_name}
echo "=== C言語 ==="
gcc Main.c
./a.out
rm a.out

echo "=== C++ ==="
g++ Main.cpp
./a.out
rm a.out

echo "=== D ==="
dmd Main.d
./Main
rm Main Main.o

echo "=== Ruby ==="
ruby Main.rb

echo "=== Perl ==="
perl Main.pl

echo "=== Python ==="
python Main.py

echo "=== Java ==="
javac Main.java
java Main
rm Main.class

echo "=== C# ==="
mcs -sdk:4.5 Main.cs
mono Main.exe
rm Main.exe

echo "=== JavaScript(node.js) ==="
node Main.js

popd

