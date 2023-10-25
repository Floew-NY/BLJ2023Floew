#include <stdio.h>
#include "helperFunctions.h"

void fsort(int *array, int length)
{

    int changeLog[length - 1];

    do
    {
        for (int i = 0; i < length - 1; i++)
        {
            changeLog[i] = 0;
            if (array[i] > array[i + 1])
            {
                changeLog[i] = 1;
                fswitch(&array[i], &array[i + 1]);
            }
        }
    } while (hasChange(changeLog, length - 1));
}


int main(int argc, char const *argv[])
{
    int array[] = {-4, 2, 6, 2, 1, 0, 100, -100, 23, 124, -123};
    int length = sizeof(array) / sizeof(array[0]);
    printf("unsorted:");
    printArray(array, length);
    fsort(array, length);
    printf("sorted:");
    printArray(array, length);
    return 0;
}
