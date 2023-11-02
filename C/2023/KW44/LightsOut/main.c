#include <stdio.h>
#include <stdbool.h>

int setRoomSize(char setting[]);

int main(int argc, char *argv[])
{
    unsigned int height = setRoomSize("height");
    unsigned int width = setRoomSize("width");

    typedef bool room[height][width];

    room *p_room;

    return 0;
}

void displayRoom(room *p_room)
{
}

int setRoomSize(char setting[])
{
    printf("Please provide the room's %s: ", setting);
    int temp;
    scanf("%u", &temp);
    return temp;
}
