#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <stdlib.h>



char *warningTries(int attempts, int tries)
{

    unsigned int remaining = tries - attempts;
if (remaining == 0)
{
    
}else if (remaining == 1)
    {
        printf("\033[31m\033[1mYOUR LAST CHANCE REMAINS!!!\033[0m\n");
    }
    else if (remaining <= 3)
    {
        printf("\033[1mONLY \033[31m%u\033[0m\033[1m THIS IS GETTING CLOSE\033[0m\n", remaining);
    }
    else if (remaining <= 5)
    {
        printf("Up to your last \033[31m\033[1m%u\033[0m tries...\n", remaining);
    }
    else if (remaining < 10)
    {
        printf("Now you've got \033[31m\033[1m%u\033[0m...\n", remaining);
    }
    else if (remaining == 10)
    {
        printf("You've just reached your last \033[31m\033[1m10\033[0m tries\n");
    }
    else
    {
        printf("\033[31m\033[1m%u\033[0m tries remain...\n", remaining);
    }
    return 0;
}

bool repeat;
unsigned int numberGuesser()
{
    // ASCII ART
    printf("\033[38;5;208m");

    printf("  ▄████  █    ██ ▓█████   ██████   ██████ ▓█████  ██▀███  \n ██▒ ▀█▒ ██  ▓██▒▓█   ▀ ▒██    ▒ ▒██    ▒ ▓█   ▀ ▓██ ▒ ██▒\n▒██░▄▄▄░▓██  ▒██░▒███   ░ ▓██▄   ░ ▓██▄   ▒███   ▓██ ░▄█ ▒\n░▓█  ██▓▓▓█  ░██░▒▓█  ▄   ▒   ██▒  ▒   ██▒▒▓█  ▄ ▒██▀▀█▄  \n░▒▓███▀▒▒▒█████▓ ░▒████▒▒██████▒▒▒██████▒▒░▒████▒░██▓ ▒██▒\n ░▒   ▒ ░▒▓▒ ▒ ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ▒▓ ░▒▓░\n  ░   ░ ░░▒░ ░ ░  ░ ░  ░░ ░▒  ░ ░░ ░▒  ░ ░ ░ ░  ░  ░▒ ░ ▒░\n░ ░   ░  ░░░ ░ ░    ░   ░  ░  ░  ░  ░  ░     ░     ░░   ░ \n      ░    ░        ░  ░      ░        ░     ░  ░   ░     \n                                                          \n");

    printf("\033[0m");

    // Field of the Method
    unsigned int randomNumber;
    unsigned int rangeTop;
    // Takes Range and calculates tries

    printf("Enter a number, which will determine the maximum of the Range: ");
    scanf("%u", &rangeTop);
    if (rangeTop >= 1)
    {
        printf("Your range is from %u to %u\n", 1, rangeTop); // Creates Random Number

        randomNumber = rand() % rangeTop + 1;
    }
    else
    {
        printf("Invalid Range Defaulting to 100\n");

        rangeTop = 100;
        randomNumber = rand() % rangeTop + 1;
    }

    // Calculate the Allowed Amount of tries
    unsigned int tries = log2(rangeTop);
    printf("You have been given \033[31m\033[1m%u\033[0m tries!!\n", tries);
    unsigned int attempt;

    // Guessing Part
    unsigned char nearby = 2;
    do
    {
        unsigned int guess;
        do // Checks Range
        {
            printf("Enter your Guess: ");
            scanf("%u", &guess);
            system("clear");
            printf("Enter your Guess: \033[1m%u\033[0m\n",guess);
            if (guess >= 1 && guess <= rangeTop)
            {
                break;
            }
            else
            {
                printf("Your outside the range %u to %u\nTry again..\n", 1, rangeTop); // Creates Random Number
            }
        } while (1);

        nearby = (randomNumber == guess) ? 0 : ((randomNumber < guess) ? 1 : 2); // tests how nearby it is
        switch (nearby)
        {
        case 0:
            printf("WHOOOHOO YOU GUESSED RIGHT!!\n");
            break;
        case 1:
            printf("You were a bit \033[1mover\033[0m, try again..\n");
            ++attempt;
            warningTries(attempt, tries);
            break;
        case 2:
            printf("You were a bit \033[1munder\033[0m, try again..\n");
            ++attempt;
            warningTries(attempt, tries);
            break;
        }
    } while (nearby != 0 && tries != attempt);

    // Play Again?
    printf("Would you like to play again?\n");
    char rep;
    scanf("%s", &rep);
    repeat = (rep == 'y' || rep == 'Y') ? true : false;
}

int main(int argc, char const *argv[])
{
    do
    {
        numberGuesser();
    } while (repeat);

    return 0;
}
