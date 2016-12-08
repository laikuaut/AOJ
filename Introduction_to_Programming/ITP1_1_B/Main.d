import std.stdio;
import std.string;
import std.conv;
import std.math;

void main() {
    auto num = readln().chomp().to!int();
    writeln(pow(num, 3));
}
