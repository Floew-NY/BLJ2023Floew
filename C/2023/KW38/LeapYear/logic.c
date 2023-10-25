int isLeapYear(int year)
{
    if (year % 4)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

int daysInMonth(int month, int year)
{
    int days;

    switch (month)
    {
    case 4:
    case 6:
    case 9:
    case 11:
        days = 30;
        break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
        days = 30;
        break;
    case 2:
        days = 28;
    }
    if (isLeapYear(year) && month == 2)
    {
        days++;
    }
    return days;
}

void printDateInfo(int month, int year)
{
    int days = daysInMonth(month, year);

    printf("Der Monat %d hat im Jahr %d %d Tage. \n", month, year, days);

    printf("Das Jahr %d ist ", year);
    if (isLeapYear(year))
    {
        printf("ein ");
    }
    else
    {
        printf("kein ");
    }
    printf("Schaltjahr. \n");
}

void exitOutsideRange(int smallest, int biggest, int number)
{
    if (number < smallest || number > biggest)
    {
        printf("ERR: %d is outside of the range!\n", number);
        exit(0);
    }
}