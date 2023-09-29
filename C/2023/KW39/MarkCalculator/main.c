#include <stdio.h>
#include <stdlib.h>

#define NUM_MARKS 5

int main(int argc, char **argv)
{
    printf("-----------------------\n");
    printf("Average Mark Calculator\n");
    printf("-----------------------\n");
    float marks[NUM_MARKS];
    float weights[NUM_MARKS];
    float totalWeight;
    float totalMarks;
    /*
     * TODO - Read as many marks as defined in NUM_MARKS.
     *      - Save read marks in an array of length NUM_MARKS.
     */

    for (int i = 0; i < NUM_MARKS; i++)
    {
        int fail = 0;
        do
        {
            if (fail)
            {
                printf("ONLY NUMBERS BETWEEN 1 AND 6 ARE ALLOWED!!!\n");
            }
            printf("Enter Grade space Weight: ");
            scanf("%f%f", &marks[i], &weights[i]);

            fail = 1;
        } while (marks[i] < 1.0 || marks[i] > 6.0);
    }

    printf("-----------------------\n");

    /*
     * TODO - Calculate and store the sum of all marks.
     */

    for (int i = 0; i < NUM_MARKS; i++)
    {
        totalMarks += weights[i] * marks[i];
        totalWeight += weights[i];
    }

    /*
     * TODO - Calculate and print the average mark.
     */
    printf("The Average is %.2f\n\n", (totalMarks / totalWeight));

    /*
     * TODO - Extra tasks, implement only after completing all previous TODOs.
     *      - Round the calculated average to 2 decimal places (output only).
     *      - While inputting, only allow values between 1.0 and 6.0.
     *      - For every mark, input a weight and calculate the average accordingly.
     *      - Allow for the manipulation of individual marks, using the index.
     */

    return (EXIT_SUCCESS);
}
