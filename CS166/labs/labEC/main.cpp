//
// main.cpp
// labEC
//
// Created by Lucie Chevreuil on 5/29/24.
//

#include <iostream>
using namespace std;

int main() {
    int number;

    do {
        cout << "Number to print as octal (0 to quit): ";
        cin >> number;
        if (number == 0) break;

        bool isNegative = (number < 0);
        if (isNegative) {
            number = -number; // Convert to positive for processing
        }

        int octalNumber = 0, placeValue = 1;
        while (number > 0) {
            int remainder = number & 7; // Get last 3 bits
            octalNumber += remainder * placeValue;
            number >>= 3; // Shift right by 3 bits
            placeValue *= 10;
        }

        if (isNegative) {
            octalNumber = 07777 - (octalNumber - 1);  // 2's complement and mask to 12 bits
        }

        cout << "Octal value is: " << octalNumber << endl;
    } while (number != 0);

    return 0;
}
