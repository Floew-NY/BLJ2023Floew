#include <stdio.h>

void clearScreen() {
    printf("\033[H\033[J"); // ANSI escape code to clear the screen
}

int main() {
    int choice = 0; // 0 for left, 1 for right
    char input;

    while (1) {
        clearScreen();
        printf("Select an option:\n");
        printf("[ %c ] Left\n", choice == 0 ? 'X' : ' ');
        printf("[ %c ] Right\n", choice == 1 ? 'X' : ' ');

        input = getchar();
        getchar(); // Consume the newline character

        if (input == 'q' || input == 'Q') {
            break; // Exit the program if 'q' or 'Q' is pressed
        } else if (input == 'l' || input == 'L') {
            choice = 0; // Select left if 'l' or 'L' is pressed
        } else if (input == 'r' || input == 'R') {
            choice = 1; // Select right if 'r' or 'R' is pressed
        }
    }

    clearScreen();
    printf("You selected: %s\n", choice == 0 ? "Left" : "Right");
    
    return 0;
}
