#include <stdio.h>
#include <stdint.h>

int main(int argc, char const *argv[])
{
    uint8_t x = 23, y = 7, a = 1, b = 2, c = 3;
    float p = 33.333, q = 3.001;
printf("\nWieviel ergibt der Vergleich (a == b)? %d\n", (a == b));
printf("\nWie viel ergibt der Vergleich (a != b)? %d\n", (a != b));
printf("\nWie viel ergibt der Vergleich (b < 10)? %d\n", (b < 10));
printf("\nWie viel ergibt der Vergleich (c >= 3)? %d\n", (c >= 3));
printf("\nWie viel ergibt der logische Ausdruck (1 >= 1 && 2 == 2)? %d\n", (1 >= 1 && 2 == 2));
printf("\nWie viel ergibt der logische Ausdruck (1 == 0 || 3 == 3)? %d\n", (1 == 0 || 3 == 3));
printf("\nWie viel ergibt der logische Ausdruck !(1 == 0)? %d\n", !(1 == 0));

a = 1;
printf("%d\n", ++a);
printf("%d\n", a--);
printf("%d\n", a++);
printf("%d\n", --a);

    return 0;
}
