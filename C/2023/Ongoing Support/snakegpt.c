#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <signal.h>

int i, j, height = 20, width = 20;
int gameover, score;
int x, y, fruitX, fruitY, flag;
int tailX[200], tailY[500];
int nTail;

// Function to set up the initial state of the game
void setup()
{
    gameover = 0;
    x = height / 2;
    y = width / 2;
    srand(time(NULL)); // Initialize random number generator
label1:
    fruitX = rand() % 20;
    if (fruitX == 0)
        goto label1;
label2:
    fruitY = rand() % 20;
    if (fruitY == 0)
        goto label2;
    score = 0;
    nTail = 0;
    flag = 0; // Initialize the direction to stop
}

// Function to draw the game screen
void draw()
{
    system("clear"); // Clear the terminal screen
    for (i = 0; i < height; i++)
    {
        for (j = 0; j < width; j++)
        {
            if (i == 0 || i == height - 1 || j == 0 || j == width - 1)
            {
                printf("#");
            }
            else
            {
                if (i == x && j == y)
                {
                    printf("O");
                }
                else if (i == fruitX && j == fruitY)
                {
                    printf("F");
                }
                else
                {
                    int isprint = 0;
                    for (int k = 0; k < nTail; k++)
                    {
                        if (i == tailX[k] && j == tailY[k])
                        {
                            printf("o");
                            isprint = 1;
                        }
                    }
                    if (isprint == 0)
                    {
                        printf(" ");
                    }
                }
            }
        }
        printf("\n");
    }
    printf("Score = %d\n", score);
    printf("press X to quit the game\n");
    fflush(stdout); // Flush the output buffer
}

// Function to get a character from the user
char getch()
{
    char buf = 0;
    struct termios old = {0};
    fflush(stdout);
    if (tcgetattr(0, &old) < 0)
        perror("tcsetattr()");
    old.c_lflag &= ~ICANON;
    old.c_lflag &= ~ECHO;
    old.c_cc[VMIN] = 1;
    old.c_cc[VTIME] = 0;
    if (tcsetattr(0, TCSANOW, &old) < 0)
        perror("tcsetattr ICANON");
    if (read(0, &buf, 1) < 0)
        perror("read()");
    old.c_lflag |= ICANON;
    old.c_lflag |= ECHO;
    if (tcsetattr(0, TCSADRAIN, &old) < 0)
        perror("tcsetattr ~ICANON");
    return buf;
}

// Function to handle user input
void input()
{
    if (kbhit()) // Check if a key is pressed
    {
        char keyPressed = getch();
        switch (keyPressed)
        {
        case 'a':
            if (flag != 3) // Left
                flag = 1;
            break;
        case 's':
            if (flag != 4) // Down
                flag = 2;
            break;
        case 'd':
            if (flag != 1) // Right
                flag = 3;
            break;
        case 'w':
            if (flag != 2) // Up
                flag = 4;
            break;
        case 'x':
            gameover = 1;
            break;
        }
    }
}

// Function to update the game logic
void logic()
{
    usleep(100000); // Sleep for 100 milliseconds
    int prevX = tailX[0];
    int prevY = tailY[0];
    int prev2X, prev2Y;
    tailX[0] = x;
    tailY[0] = y;
    for (int i = 1; i < nTail; i++)
    {
        prev2X = tailX[i];
        prev2Y = tailY[i];
        tailX[i] = prevX;
        tailY[i] = prevY;
        prevX = prev2X;
        prevY = prev2Y;
    }
    switch (flag)
    {
    case 1: // Left
        y--;
        break;
    case 2: // Down
        x++;
        break;
    case 3: // Right
        y++;
        break;
    case 4: // Up
        x--;
        break;
    default:
        break;
    }
    if (x < 0 || x >= height || y < 0 || y >= width)
        gameover = 1;
    for (int i = 0; i < nTail; i++)
        if (tailX[i] == x && tailY[i] == y)
            gameover = 1;
    if (x == fruitX && y == fruitY)
    {
    label3:
        fruitX = rand() % 20;
        if (fruitX == 0)
            goto label3;
    label4:
        fruitY = rand() % 20;
        if (fruitY == 0)
            goto label4;
        score += 10;
        nTail++;
    }
}

// Main function
int main()
{
    setup();
    signal(SIGWINCH, handleResize); // Register the signal handler for terminal resize events
    while (!gameover)
    {
        draw();
        input();
        logic();
    }
    return 0;
}
