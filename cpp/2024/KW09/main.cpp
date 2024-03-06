#include <iostream>
#include <string>
#include "Exceptions.hpp"

using namespace std;

class Input
{
public:
    static string askString(string question)
    {
        string input;
        cout << question << endl;
        cin >> input;
        return input;
    }
    static int askInt(string question)
    {

        while (true)
        {

            try
            {
                int integer = stoi(askString(question));
                return integer;
            }
            catch (const std::invalid_argument &e)
            {
                cout << "thats not a number!!!" << endl;
            }
        }
    }
};

void printHeader()
{
    cout << "***************************************************************\n"
         << "                      TRIANGLE CALCULATOR                      \n"
         << "***************************************************************\n";
}

int main()
{
    int a = Input::askInt("enter number");
    cout << "\nYOUR number is:" << to_string(a) << endl;

    return 0;
}
