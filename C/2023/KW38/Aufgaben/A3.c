#include <stdio.h>
#include <math.h>

float radius;

int main(int argc, char const *argv[])
{

    printf("Dez %d Hex %x Octa %o\n", 1000, 1000, 1000);

    
    const float pi = 3.14;
printf("Enter a radius\n");
    scanf("%f", &radius);
    

    float circunfrance = 2*pi*radius;
    printf("%.2f",circunfrance);
    return 0;
}