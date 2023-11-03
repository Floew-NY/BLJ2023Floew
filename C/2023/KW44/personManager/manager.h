#define MESUREMENT_OF_WEIGHT "kg"
#define MESUREMENT_OF_LENGTH "cm"
#define FAMILY_SIZE 4
#define SORT_NAME 0
#define SORT_AGE 1
#define SORT_WEIGHT 2
#define SORT_HEIGHT 3
#define SORT_ASC 1
#define SORT_DES 0

typedef struct Club
{
    char name[40 + 1];
    char category[20 + 1];
} TClub;

typedef struct Manager
{
    char name[40 + 1];
    int birthyear;
    int weight;
    int height;
    TClub club;
} TManager;

void sortFamily(int sortCriteria[2], TManager *family);
