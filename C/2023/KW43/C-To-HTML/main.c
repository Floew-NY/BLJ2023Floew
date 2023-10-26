
#include <stdio.h>

FILE *website;
void addToFile();

int main()
{
    //----------SETTINGS------------
    int rows;
    int cols;

    printf("Enter the number of Rows:");
    scanf("%d", &rows);
    printf("Enter the number of Colums:");
    scanf("%d", &cols);

    //-------------FILE CREATION ----------------
    website = fopen("./index.html", "a");
    // Creating the structure Around
    addToFile("<!DOCTYPE html> <html lang=\"en\"> ");
    // Header
    addToFile("<head> <meta charset=\"UTF-8\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> <title>C -> HTML</title> <style> table { font-family: arial, sans-serif; border-collapse: collapse; width: 100%; } td, th { border: 2px solid #dddddd; text-align: left; padding: 8px; } </style> </head>");
    // open boxy
    addToFile("<body> ");
    // add header
    addToFile("<h1>Hello World</h1> ");
    // table
    addToFile("<table> ");
    for (int i = 0; i < cols; i++)
    {
        addToFile("<tr> ");
        for (int i = 0; i < rows; i++)
        {
            addToFile("<th>Text</th> ");
        }

        addToFile("</tr> ");
    }
    addToFile("</table> ");
}

void addToFile(char *element)
{
    fprintf(website, "%s", element);
}