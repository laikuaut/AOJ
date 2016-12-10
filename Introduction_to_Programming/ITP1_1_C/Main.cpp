#include<iostream>
#include<cmath>

int main(int argc, char const* argv[])
{
    int width = 0;
    int height = 0;
    std::cin >> height >> width;

    int c = (width + height) * 2;
    int s = width * height;
    std::cout << s << " " << c << std::endl;
    return 0;
}
