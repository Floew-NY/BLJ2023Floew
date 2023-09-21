#include <stdio.h>

/*
3, 5    -> 8
-4, -6  -> -10
0, 0    -> 0
*/
int sum(int a, int b)
{
    return a + b;
}
/*
0, 2, 3 -> 1.6666666
5, 5, 5 -> 5
5, 4, 3 -> 4
*/
float avg(int a, int b, int c, int d)
{
    return ((float)(a + b + c + d)) / 4;
}

/*
    -> print "Hello!"
*/
void say_hello()
{
    printf("HELLOOO!");
}

/*
5   -> print "*****"
0   -> print ""
1   -> print "*"
*/
char *print_stars(int count)
{
    char *stars = (char *)malloc(count + 1);
    for (int i = 0; i < count; i++)
    {
        stars[i] = '*';
    }
    return stars;
}

/*
0, 10   -> 3
0, 10   -> 7
0, 10   -> 0
*/
int random_num(int min, int max);

/*
5   -> 0
2   -> 1
234 -> 1
*/
int is_even(int num);

/*
0   -> 32
100 -> 212
-11 -> 12.2
*/
float celsius_to_fahrenheit(float celsius);

/*
32  -> 0
0   -> -17.7778
100 -> 37.7778
*/
float fahrenheit_to_celsius(float fahrenheit);

/*
1   -> print "#"
2   -> print "##"
              ##
5   -> print "#####"
              #   #
              #   #
              #   #
              #####
*/
void print_square(int size);

/*
(Eigenrecherche, was die Fibonacci Reihe ist)
*/
int fibonacci_sequence(int count);

/*
(Eigenrecherche, wie Primzahlen ermittelt werden können)
*/
int is_prime(int num);

void printout(char *name, int input)
{
    printf("The output for %s is %d\n", name, input);
}

void main()
{
    int input1;
    int input2;
    int input3;
    int input4;
    printf("------------------------------------\n");
    printf("\e[1;31mWhat function would you like to run?\n\e[0m");
    printf("------------------------------------\n");
    printf("Your Options Are:\n");
    printf("1 - Addition\n2 - Average\n3 - Starprint\n4 - Say Hello\n5 - Random Number\n6 - Is even?\n7 - Celcius to Farenheit\n8 - Print Square\n");
    unsigned char choise;
    scanf("%u", &choise);
    printf("\n\n");
    switch (choise)
    {
    case 1:
        printf("Good Choise, Addition\n");
        printf("Enter your 2 inputs: ");
        scanf("%d", &input1);
        scanf("%d", &input2);
        printout("Addition", sum(input1, input2));
        break;
    case 2:
        printf("Good Choise, Average\n");

        printf("Enter your 4 inputs: ");
        scanf("%d", &input1);
        scanf("%d", &input2);
        scanf("%d", &input3);
        scanf("%d", &input4);
        printout("Average", avg(input1, input2, input3, input4));
        break;
    case 3:
        printf("Good Choise, Starprint\n");
        printf("Enter your 1 input: ");
        int input1 = 0;
        scanf("%d", &input1);
         printf("Starprinter: %s", print_stars(input1));
        break;
    case 4:
        say_hello();
        break;
    case 5:
        break;
    case 6:

        break;
    case 7:

        break;
    case 8:

        break;
    default:
        printf("Not a valid input");
        break;
    }
}