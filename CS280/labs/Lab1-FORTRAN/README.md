# Lab 1 - 15 pts

## Instructions

With Fortran, 5 is stdin and 6 is stdout. You can assign the numbers to files. The following sample Fortran Program reads in the number of values.

## Sample Fortran Program

```fortran
Program PrintNums
    Integer :: Number, Value, Counter
    Open(Unit=5, File='/uploads/input.txt', Access='SEQUENTIAL')
    Read *, Number
    Do Counter = 1, Number
        Read *, Value
        Print *, Value
    End Do
    Close(5)
End Program PrintNums
```

The Open command will assign 5 to the input.txt file and have it Sequential. The `Read *` reads from unit 5. The `Close(5)` will close the file.

Note: to read a file, you need to upload it into a temporary storage area called “uploads” (hence the filename of `/uploads/input.txt`). To do that when you have the Fortran program in front of you via jdoodle, click on the upload button next to Execute button, like so:

## Task

Change the program to read into an array then go through the array and find the highest and lowest values in the array. After the loop, print out the highest and lowest values. Put your name at the top in a comment.

Note: You can easily define an array via: `Integer :: ary(99)`. It will start at 1 and go up to 99. See the example Fortran program in chapter 2 to figure out how to do the program.

Use the [www.jdoodle.com](https://www.jdoodle.com) to compile and run the program. Place the data into the `input.txt` in the website. The first value is how many data values you have in the file. Try the following data:

```
7
51
6
98
13
17
20
24
```

So the first “7” means you have 7 values following.

Copy and paste your program into a text file then submit it via Canvas.

