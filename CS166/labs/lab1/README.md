# CSIS 166 - Lab 1

This lab involves downloading the Stack_8e emulator and code, converting a C++ program into Stack_8e assembly language, and running it using the emulator. Follow the instructions below to complete the lab assignment.

## Lab Instructions

1. **Download Stack_8e Emulator and Code:**

   - Use the Stack8eRelease link provided on the Canvas home page.
   - Unzip the downloaded file to access the necessary files, including:
     - .asm code for reference.
     - Stack_8e documentation (Stack_8e.doc).
     - Microcode documentation.
     - Executable folders for different operating systems (Mac, MacX86, or Windows).

2. **Prepare Environment:**

   - Choose the correct folder for your operating system (Mac, MacX86, or Windows).
   - Copy the ioroutines.asm file into that folder and rename it lab1.asm.

3. **Convert C++ Program to Stack_8e:**

   - Use an editor to convert the provided C++ program into Stack_8e assembly language.
   - Start your program at address 100 in octal.

4. **Assemble and Execute:**
   - Run the asms_8e assembler to generate the .obj file.
   - Run the MEmulator to execute the program.

## C++ Program to Convert

```cpp
#include <iostream>

using namespace std;

int main() {
    int number;
    cout << "Enter a number: ";
    cin >> number;
    number += number;
    cout << "Number doubled is " << number << endl;
    system("pause"); // make it a hlt
}
```
