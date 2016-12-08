#include<iostream>
#include<cmath>

int main(int argc, char const* argv[])
{
    int num = 0;
    std::cin >> num;
    std::cout << static_cast<int>(pow(num, 3)) << std::endl;
    return 0;
}
