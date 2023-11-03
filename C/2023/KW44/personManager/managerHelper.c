#include <stdbool.h>
#include "manager.h"
// FAMLY SORTER ALGORYTHM

bool comparePeople(int sortCriteria[2], TManager person1, TManager person2);
bool isGreaterInt(int asc, int current, int next);
bool isGreaterLetter(int asc, char current[], char next[]);
void swapPeople(TManager *person1, TManager *person2);

bool comparePeople(int sortCriteria[2], TManager person1, TManager person2)
{
    switch (sortCriteria[0])
    {
    case SORT_NAME:
        return isGreaterLetter(sortCriteria[1], person1.name, person2.name);

    case SORT_AGE:
        return isGreaterInt(sortCriteria[1], person2.birthyear, person1.birthyear);

    case SORT_WEIGHT:
        return isGreaterInt(sortCriteria[1], person1.weight, person2.weight);

    case SORT_HEIGHT:
        return isGreaterInt(sortCriteria[1], person1.height, person2.height);
    }
}

bool isGreaterInt(int asc, int current, int next)
{
    if (asc)
    {
        if (current > next)
        {
            return true;
        }
    }
    else
    {
        if (current < next)
        {
            return true;
        }
    }
    return false;
}
bool isGreaterLetter(int asc, char current[], char next[])
{
    if (asc)
    {
        if (current[0] > next[0])
        {
            return true;
        }
    }
    else
    {
        if (current[0] < next[0])
        {
            return true;
        }
    }
    return false;
}
void swapPeople(TManager *person1, TManager *person2)
{
    TManager tempPeron = *person1;
    *person1 = *person2;
    *person2 = tempPeron;
}
void sortFamily(int sortCriteria[2], TManager *family)
{
    bool changes = true;
    while (changes)
    {
        changes = false;
        for (int i = 0; i < FAMILY_SIZE - 1; i++)
        {
            if (comparePeople(sortCriteria, family[i], family[i + 1]))
            {
                swapPeople(&(family[i]), &(family[i + 1]));
                changes = true;
            }
        }
    }
}
