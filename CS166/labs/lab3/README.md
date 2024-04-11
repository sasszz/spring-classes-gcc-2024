# CSIS 166 Lab 3: Stack_8e Emulator Program

## Objective
The objective of this lab is to translate a given C++ program into assembly language using the Stack_8e emulator and code.

## Task
Translate the provided C++ program into assembly language using the Stack_8e emulator and code. The program should calculate the sum of integers within a specified range.

## Program Translation
Translate the following C++ program into assembly language:

```cpp
int sumR(int start, int end) {
    int sum = 0;
    for (int x = start; x <= end; x++)
       sum += x;
    return sum;
}

int main() {
     int first, last;
     cout << "Input range of values to sum: ";
     cin >> first >> last;
     cout << "Sum is " << sumR(first, last) << endl;
}
