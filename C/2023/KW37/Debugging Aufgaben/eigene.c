#include <stdio.h>

char *checkEven(int value)
{
    if ((value % 2))
    {
        return "Even";
    }
    else
    {
        return "Uneven";
    }
}

int main(int argc, char const *argv[])
{
    signed int number;
    printf("Enter a Number:");
    scanf("%d", &number);
    printf("The number %d is: %s", number, checkEven(number));
    return 0;
}

