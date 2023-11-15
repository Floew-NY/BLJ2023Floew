#include <stdio.h>
void swap(int *p_x, int *p_y);
int main(int argc, char *argv[])
{
    int x = 3;
    int y = 2;
    printf("x: %d y: %d\n", x, y);
    swap(&x, &y);
    printf("x: %d y: %d\n", x, y);

    return 0;
}
void swap(int *p_x, int *p_y)
{
    int temp = *p_x;
    *p_x = *p_y;
    *p_y = temp;
}