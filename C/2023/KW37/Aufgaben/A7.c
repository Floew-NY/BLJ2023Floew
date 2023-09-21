#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[])
{
    double a = 5;
    char b = 0;
    printf("a++: %d\n++b: %d\n\n", a++, a);

    printf("You have been given \033[31m\033[1m%u\033[0m tries!!", a);

    return 0;
}
