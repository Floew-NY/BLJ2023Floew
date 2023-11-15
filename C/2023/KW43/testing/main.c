#include <stdio.h>

void fun(int *b)
{
}

int main()
{
    int a = 3;
    printf("before %d\n\n", a);
    fun(&a);
    printf("after %d\n\n", a);
}