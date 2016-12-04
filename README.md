# AOJ

[AOJ](http://judge.u-aizu.ac.jp/onlinejudge/index.jsp)のソースコードを書いてみる  

## 各種言語のコンパイル実行例(Cent OS 7)

「ITP1_1_A__Hello_World」を例にして、各言語のコンパイルと実行例を記載します。  
サンプル：Introduction_to_Programming/compile_sample.sh  

```Bash
echo "=== C言語 ==="
gcc ITP1_1_A__Hello_World__C__.c
./a.out
rm a.out

echo "=== C++ ==="
g++ ITP1_1_A__Hello_World__C++__.cpp
./a.out
rm a.out

echo "=== D ==="
dmd ITP1_1_A__Hello_World__D__.d
./ITP1_1_A__Hello_World__D__
rm ITP1_1_A__Hello_World__D__.o ITP1_1_A__Hello_World__D__

echo "=== Ruby ==="
ruby ITP1_1_A__Hello_World__Ruby__.rb

echo "=== Perl ==="
perl ITP1_1_A__Hello_World__Perl__.pl

echo "=== Python ==="
python ITP1_1_A__Hello_World__Python3__.py

echo "=== Java ==="
javac ITP1_1_A__Hello_World__JAVA__.java
java Main
rm Main.class

echo "=== C# ==="
mcs -sdk:4.5 ITP1_1_A__Hello_World__C#__.cs
mono ITP1_1_A__Hello_World__C#__.exe
rm ITP1_1_A__Hello_World__C#__.exe

echo "=== JavaScript(node.js) ==="
node ITP1_1_A__Hello_World__JavaScript__.js
```
