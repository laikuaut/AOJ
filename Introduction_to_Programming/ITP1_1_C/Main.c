#include<stdio.h>
#include<math.h>

int main(int argc, char const* argv[])
{
    int width = 0;
    int height = 0;
    int s = 0;
    int c = 0;
    scanf("%d %d", &height, &width);

    s = height * width;
    c = (height + width) * 2;
    printf("%d %d\n", s, c);

    return 0;
}
