# CSIS 166 Lab 4: Stack_8e Array Sort Program

## Objective
The objective of this lab is to create a new Stack8e instruction and modify a given C++ program to use this instruction for sorting an array.

## Task
Translate the provided C++ bubble sort program into assembly language using the Stack8e emulator. Create a new Stack8e instruction called `swap` that swaps two adjacent elements and use it in the sorting logic.

## Program Translation
Translate the following C++ program into assembly language:

```cpp
int numbers[] = {12, 6, 38, 34, 5, 29, 17};
const int SIZE = 7;

void bSort(int ary[]) {
    int pass = 1;
    int temp;
    bool swapped;
    do {
        swapped = false;
        for (int i = 0; i < SIZE - pass; i++) {
            if (ary[i] > ary[i+1]) {
                temp = ary[i];
                ary[i] = ary[i+1];
                ary[i+1] = temp;
                swapped = true;
            }
        }
    } while (swapped);
}

int main() {
    bSort(numbers);
    for (int i = 0; i < SIZE; i ++)
        cout << numbers[i] << " ";
    cout << endl;
}
```

## Notes
Create a Stack8e program using the new asms_8e assembler and MEmulator.

Then create a new Stack8e instruction called swap. It will take the AC/MQ (24 bit address) and swap the word in that address with the next one down (AC/MQ+1). Have it replace:

```
temp = ary[i];
ary[i] = ary[i+1];
ary[i+1] = temp;
```

You need to edit the Test.mica and use the MicAsm to put in your new Stack8e instruction. Replace the group 3 unused code of 001 – look at mg361 in the Test.mica microcode where you can start your new instruction.

With the Stack8e assembler, you’ll have to trick it with a constant like:

```SWAP= 07403```

Then put it in the Stack8e program like:

```
tadam ptr
SWAP
```

With the microcode, you’ll need to use the T register to get the AC/MQ contents into the MA register. And you do have the OF register as a nice scratch register.

And relax! It’s not that hard. Don’t be intimidated by odd micro code. Just have to think in terms of the cu and the alu operations.

Submit the lab3.asm and Test.mica via canvas.