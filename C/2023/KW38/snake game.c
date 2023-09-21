#include <stdio.h>

#include <conio.h>

#include <windows.h>

 

int i, j, height = 20, width = 20;

int gameover, score;

int x, y, fruitX, fruitY, flag;

int tailX[200], tailY[500];

int nTail;

 

void setup()

{

 

    gameover = 0;

 

    // Initialposition des Kopfes

    x = height / 2;

    y = width / 2;

 

// Position des Fruchts

label1:

    fruitX = rand() % 20;

    if (fruitX == 0)

        goto label1;

label2:

    fruitY = rand() % 20;

    if (fruitY == 0)

        goto label2;

    score = 0; // Score zurücksetzen

 

    nTail = 0; // Länge des Schwanzes zurücksetzen

}

 

// Spielfeld

void draw()

{

    system("cls");

    for (i = 0; i < height; i++)

    {

        for (j = 0; j < width; j++)

        {

            if (i == 0 || i == width - 1 || j == 0 || j == height - 1)

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

                    for (int k = 0; k < nTail;

                         k++)

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

    printf("Score = %d", score);

    printf("\n");

    printf("press X to quit the game");

}

 

// Benutzereingabe

void input()

{

    if (_kbhit())

    {

        char keyPressed = _getch();

        switch (keyPressed)

        {

        case 'a':

            if (flag != 3) // Kann nicht nach links gehen, wenn zuvor nach rechts gegangen wurde

                flag = 1;

            break;

        case 's':

            if (flag != 4) // Kann nicht nach unten gehen, wenn zuvor nach oben gegangen wurde

                flag = 2;

            break;

        case 'd':

            if (flag != 1) // Kann nicht nach rechts gehen, wenn zuvor nach links gegangen wurde

                flag = 3;

            break;

        case 'w':

            if (flag != 2) // Kann nicht nach oben gehen, wenn zuvor nach unten gegangen wurde

                flag = 4;

            break;

        case 'x':

            gameover = 1;

            break;

        }

    }

}

 

void logic()

{

    Sleep(100); // Verzögerungszeit 100 Millisekunden(0.1 Sekunden)

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

    case 1:

        y--;

        break;

    case 2:

        x++;

        break;

    case 3:

        y++;

        break;

    case 4:

        x--;

        break;

    default:

        break;

    }

    if (x < 0 || x > height || y < 0 || y > width)

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

 

int main()

{

    int m, n;

    setup();

    while (!gameover)

    {

        draw();

        input();

        logic();

    }

    return 0;

}