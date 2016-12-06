# AOJ

[AOJ](http://judge.u-aizu.ac.jp/onlinejudge/index.jsp)のソースコードを書いてみる  

## 各種言語のコンパイル実行例(Cent OS 7)

各言語のコンパイルと実行例を記載します。  
サンプル：compile_sample.sh  

```Bash
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
```
