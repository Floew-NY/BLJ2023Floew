#include <stdio.h>

void intToBin(int a, char *out)
{
    for (unsigned int i = 0; i < 32; i++)
    {
        out[i] = '0' + ((a >> (31 - i)) & 1);
    }
    out[32] = '\0';
}

int main(int argc, char const *argv[])
{
    int a = 3;
    a >> 3;

    char out[33];
    intToBin(a, out);

    printf("dezsss %d \nbin %s", a, out);

    return 0;
}