#include <stdio.h>
#include <stdlib.h>

int main() {
    int exit_status;

    // Execute a shell command to list files in the current directory (Linux/Unix)
    exit_status = system("ls -l");

    if (exit_status == -1) {
        perror("Error executing command");
    } else {
        printf("Command exited with status %d\n", exit_status);
    }

    return 0;
}
