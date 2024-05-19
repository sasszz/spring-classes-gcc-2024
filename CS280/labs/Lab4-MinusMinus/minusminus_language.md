# MinusMinus language, version 4

The commands of MinusMinus are:

- **declare** *variablelist*: variablelist is a line of variables separated by commas. Need to declare a variable before you can use it.
  
For function/procedure argument list and parameter list, each argument/parameter is separated by commas.

## Definition:
- declare
- function
- procedure

## End Definition:
- end if
- end while
- end function
- end procedure

## Logic statements:
- if *booleanExpression*
    - Statement(s)
  end if

- while *booleanExpression*
    - Statement(s)
  end while

- **return** *equation*
- **return**

  *booleanExpression* can use a <, >, <=, >=, <>, or = to compare variables and/or integers (<> is not equal). You can also use && for AND, || for OR to string boolean expressions together. Note: do not put parenthesis around the entire booleanExpression nor to separate && and || boolean expressions. && and || have equal precedence and will do “short-circuit”.

## Input statements:
- **input** *variable*
- **input** *string constant, variable*

## Output statements:
- **print** *printlist*
- **println** *printlist*

  Print stays on the same line but println outputs a newline at the end. The printlist can be a mixture of string constants, integers, equations, and constants all separated by commas.

## Assignment statements:
- *variable* := *expression*
- *variable* += *expression*
- *variable* -= *expression*
- *variable* *= *expression*
- *variable* /= *expression*
- *variable* %= *expression*

  Where expression can be a mixture of variables, literals, and function calls. Operators are: +, -, *, /, and % (modulus). Note: you do have one predefined function of rand() to give you a random number.

- ; for comments

A MinusMinus program is structured around functions and procedures. It starts with procedure main that does not have any parameters. Any other functions precede or follow the main function. Like so:

```cpp
procedure main()
    declare x
    input "Enter sum sequence to end at? ", x
    x := sum(x)
    println "Sum is ", x, " and squared is ", x*x
    return
end procedure

// sum takes only one parameter
function sum(num)
   declare count, total
   total := 0
   count := 0
   while count < num
        total := total + count
        count := count + 1
   end while
   return total
end function
```

The language has only one data type, integer. Functions can be recursive and have local variables.

For more than one parameter, use commas to separate them, like so:

```cpp
function add(first, second)
    declare answer
    answer = first + second
    return answer
end function

procedure main()
    declare x
    x := add(5, 2)
    print x
    return
end procedure
```

Note: for Mac users, download the Mac version from Canvas and run it in a terminal window like so:
```
./MinusMinusV2
```




