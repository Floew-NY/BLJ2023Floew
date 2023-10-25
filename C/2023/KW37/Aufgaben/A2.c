#include <stdio.h>



int main(int argc, char const *argv[])
{

 

    printf("---------------------------------------------------------------------------\n");
    printf("Types\tVariables\tSize\t\tOctagonal\tHexadecimal\tDecimal\n");
    printf("---------------------------------------------------------------------------\n");
    float f = 5.67;
    char c = 'c';
    double d = 5.67;
    int i = 0b0000000000000000000000000000000;
    printf("int\ti\t\t%u Byte(s) \t%o \t\t%x \t\t%d\n", sizeof(i), i, i, i);
    printf("float\tf\t\t%d Byte(s)\t%o \t\t%x \t\t%f\n", sizeof(f), f, f, f);
    printf("double\td\t\t%d Byte(s)\t%o \t\t%x \t\t%lf\n", sizeof(d),d,d,d);
    printf("char\tc\t\t%d Byte(s) \t%o \t\t%x \t\t%d\n", sizeof(c),c,c,c);

    char* hello = "Hello";
    printf("%c\n\n", hello[0]);



    return 0;
}
