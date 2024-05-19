# Data file to test with

```
12345Widgets
98107Extra gadgets
456Labels
```

Under Examples in Canvas, there is a file `changeL2.cobc` that is the alternate to the above code not using files (rather hard to do with file-centric COBOL). You can use [jdoodle.com](https://www.jdoodle.com) to load and run it. Note: Examples has other COBOL code examples.

## Task

Change the program to add a column to the front of each input line that has "C" for charge or "P" for payment. Add a line for a payment of $555.67 to the data file (description of "Pay") and make the other lines be charges. Print the values with "Charge" or "Payment" first, the values with a "$", and the description. Have a total for just the charges. Then print out the balance. Calculate a "Cash Back" of 1% on the charges (You can do a `MULTIPLY X by 0.01 GIVING Y.`) and print that (put in "Cash back = $"). Don't forget that if you add to the input record, you need to adjust the size of the filler (must be 80 columns).

