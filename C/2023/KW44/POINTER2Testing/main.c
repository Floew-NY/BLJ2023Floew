#include <stdio.h>
#include <stdlib.h>

typedef struct structure
{
    char smallNumber[9];
    long int bigNumber;
    int number;
} Tstructure;

int main(int argc, char *argv[])
{
    Tstructure testInstance;
    testInstance.number = 5;
    int *p_number;

    p_number = &(testInstance.number);

    printf("\n%p", &(testInstance));
    printf("\n%p", &(testInstance.smallNumber));
    printf("\n%p", &(testInstance.bigNumber));
    printf("\n%p", &(testInstance.number));

    printf("\n\n%d", *(p_number));
    printf("\n\n%p\n\n", p_number);
    return EXIT_SUCCESS;
}