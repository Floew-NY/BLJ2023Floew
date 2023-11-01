#include <stdio.h>
#include <stdbool.h>
void field()
{
    int h = 3;
    int w = 3;
    char field[3][3];
    bool outcome = false;
    bool turnX = true;
    int round;

    // initializing the Array
    for (size_t x = 0; x < h; x++)
    {
        for (size_t y = 0; y < w; y++)
        {
            field[x][y] = ' ';
        }
    }

    do
    {
        round++;
        int ix = 1;
        int iy = 1;

        printf("BOARD: \n\n");

        // Print the Array
        for (int x = 0; x < h; x++)
        {
            for (int y = 0; y < w; y++)
            {
                (y < 2) ? printf(" %c |", field[x][y]) : printf(" %c ", field[x][y]);
            }
            printf("\n");
            (x < 2) ? printf("---+---+---\n") : printf("\n");
        }

        if (field[ix - 1][0] == field[ix - 1][1] && field[ix - 1][0] == field[ix - 1][2] && field[ix - 1][2] != ' ')
        {
            turnX ? printf("X WINS!! \n") : printf("O WINS!! \n");
            break;
        }
        if (field[0][iy - 1] == field[1][iy - 1] && field[1][iy - 1] == field[2][iy - 1] && field[0][iy - 1] != ' ')
        {
            turnX ? printf("X WINS!! \n") : printf("O WINS!! \n");
            break;
        }
        if ((field[0][0] == field[1][1] && field[0][0] == field[3][3] ||
             field[0][2] == field[1][1] && field[1][1] == field[2][0]) &&
            field[1][1] != ' ')
        {
            turnX ? printf("X WINS!! \n") : printf("O WINS!! \n");
            break;
        }
        if (round == 10)
        {
            printf("There was a DRAW\n");
            break;
        }

        printf("\nITS TURN ");

        turnX ? printf("X\n") : printf("O\n");

        do
        {
            printf("ENTER X AND Y (seperated by a space): ");
            scanf("%d %d", &iy, &ix);
        } while ((!(ix <= 3 && ix >= 1 && iy <= 3 && iy >= 1)) || (field[ix - 1][iy - 1] != ' '));

        field[ix - 1][iy - 1] = turnX ? 'x' : 'o';

        turnX = !turnX;
    } while (!outcome);
}
