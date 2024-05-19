# Lab 4 - 20 pts

Write a MinusMinus program that will do Tiny Gambling! It would work like so:

```
How many dollars do you have? 10

Tiny Gambling

    Bet on coin toss (+bet heads, -bet tails)
    Bet on die roll (+bet odd, -bet even)
    Quit while you're ahead!

Enter selection: 1

Bet on coin toss (heads win, tails lose)

Enter bet: 3

Bet return is -3 dollars

Credit now 7

Tiny Gambling

    Bet on coin toss (+bet heads, -bet tails)
    Bet on die roll (+bet odd, -bet even)
    Quit while you're ahead!

Enter selection: 2

Bet on die roll (odd win, even lose)

Enter bet: 5

Bet return is -5 dollars

Credit now 2

Tiny Gambling

    Bet on coin toss (+bet heads, -bet tails)
    Bet on die roll (+bet odd, -bet even)
    Quit while you're ahead!

Enter selection: 3

I give up and quit!
```

As you can see I didn’t do so well. Drat!

## Procedures and Functions

You will have the following procedures and functions, in order:

- Procedure main() : for running the program
- Procedure menu() : for printing the menu
- Procedure printSelect(select) : for taking the menu selection and printing what it is
- Function doBet(s, b) : for taking selection s with bet b and returning win or lose

MUST use input, print and/or println, while, and if (nested if you please)

Fill in the code and submit it via canvas

