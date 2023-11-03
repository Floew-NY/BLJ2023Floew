#include <stdio.h>
#include <string.h>
#include "manager.h"
#include <stdbool.h>

void initPerson(TManager *man, char name[], int birthyear, int weight, int height, char clubName[], char clubCategory[])
{
    strncpy(man->name, name, sizeof(man->name) - 1);
    man->birthyear = birthyear;
    man->weight = weight;
    man->height = height;
    strncpy(man->club.name, clubName, sizeof(man->club.name) - 1);
    strncpy(man->club.category, clubName, sizeof(man->club.category) - 1);
}
void initFamily(TManager *family)
{
    initPerson(&family[0], "John Doe", 1981, 91, 196, "PfadiMH", "Gelendesport");
    initPerson(&family[1], "Fane Doe", 1980, 64, 178, "Pfadi Wulp", "Gelendesport");
    initPerson(&family[2], "Dack Doe", 2008, 40, 163, "Pfadi Olymp", "Gelendesport");
    initPerson(&family[3], "Gudy Doe", 2015, 30, 124, "Pfadi Ratatuille", "Gelendesport");
}
void printFamily(TManager *family)
{
    for (size_t i = 0; i < FAMILY_SIZE; i++)
    {
        printf("Name: %s\n", family[i].name);
        printf("Born in: %d\n", family[i].birthyear);
        printf("Height: %d %s\n", family[i].height, MESUREMENT_OF_LENGTH);
        printf("Weight: %d %s\n", family[i].weight, MESUREMENT_OF_WEIGHT);
        printf("Hobby: %s\n", family[i].club.name);
        printf("Hobby Type: %s\n", family[i].club.category);
        printf("\n\n");
    }
}

void printPerson(TManager person)
{
    printf("Name: %s\n", person.name);
    printf("Born in: %d\n", person.birthyear);
    printf("Height: %d %s\n", person.height, MESUREMENT_OF_LENGTH);
    printf("Weight: %d %s\n", person.weight, MESUREMENT_OF_WEIGHT);
    printf("Hobby: %s\n", person.club.name);
    printf("Hobby Type: %s\n", person.club.category);
    printf("\n\n");
}

TManager findOldestFamilyMember(TManager *family)
{
    TManager tempOldest = family[0];
    for (size_t i = 0; i < FAMILY_SIZE; i++)
    {
        tempOldest = (tempOldest.birthyear < family[i].birthyear) ? tempOldest : family[i];
    }
    return tempOldest;
}

int main(int argc, char *argv[])
{
    int sortCriteria[2];
    printf("Hei, du! Wäisch, was du wottsch? \n");
    printf("0 - Sortiere nach Name \n");
    printf("1 - Sortiere nach Alter \n");
    printf("2 - Sortiere nach Gewicht \n");
    printf("3 - Sortiere nach Grössi \n");
    printf("Gib din Wahl i: ");
    scanf("%d", &sortCriteria[0]);

    printf("\nUnd wie wottsch du sortiere? Ascendiirend oder descendiirend? \n");
    printf("1 - Ascendiirend \n");
    printf("0 - Descendiirend \n");
    printf("Gib din Wahl i: ");
    scanf("%d", &sortCriteria[1]);
    TManager family[FAMILY_SIZE];
    initFamily(family);
    sortFamily(sortCriteria, family);
    printFamily(family);

    return 0;
}
