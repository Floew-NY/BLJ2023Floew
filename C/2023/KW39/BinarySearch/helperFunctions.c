void fswitch(int *a, int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}

int hasChange(int *changes, int length)
{
    int changed = 0;
    for (int i = 0; i < length; i++)
    {
        if (changes[i])
        {
            changed = 1;
        }
    }
    return changed;
}

void printArray(int *array, int length)
{
    for (int i = 0; i < length; i++)
    {
        printf("%d ", array[i]);
    }
}