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

int scanArray(int searchParameter, int *array, int length)
{
    int location = 0;
    int min = 0;
    int max = length;
    int mid;
    while (!array[location] == searchParameter)
    {
        mid = (((max - min) / 2) + min);
        if (array[mid] == searchParameter)
        {
            location = mid;
        }
        else if (array[max] == searchParameter)
        {
            location = max;
        }else if (array[mid] > searchParameter)
        {
            max = mid - 1;
        }
        else
        {
            min = mid + 1;
        }
    }
    return location;
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
    int input;
    scanf("%d", &input);
    printf(">> %d\n", scanArray(input, array, length));
    return 0;
}
