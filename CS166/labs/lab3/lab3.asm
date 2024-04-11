/ Lucie Chevreuil
/ Lab 3, CS 166
        *0100
        jmp main
/ parm num and p
answer= 0
x= 1    / set x to initial parameter
/ return at 2 and 3
p= 4    / param2
num= 5  / param1
retval= 6
sum,    enter 2     / allocate answer and x
        cla
        dca s answer
        tad s num   / num is in accumulator
        dca s x     / deposit into x
for,    tad s x     / is x < p?
        cma iac     / twos complement, compare by subtracting
        tad s p     / p-x, x should be smaller than p
        spa cla     / if negative, then done, if accumulator becomes 0, skip positive acc
        jmp sum_ex  / exiting program
        tad s answer
        tad s x
        dca s answer
        isz s x     / x++
        jmp for
sum_ex, tad s answer / put into retval
        dca s retval 
	      ret 2        / pop off x and answer and return

nl,     '\n'
aprompt1, prompt1
aprompt2, prompt2
main,   enter 1        / make room for retval
        cla
        cam            / print prompt
        tadam aprompt1 / "Input range of values to sum:" prompt
        jms prt_msg
        jms decin       / get parameter1
        push            / put parameter1 on stack
        jms decin       / get parameter2, current decin does not ignore whitespace
        push            / put parameter2 on stack
        jms sum
        leave 2         / remove 2 parameters
        pop             / get return value
        jms decout
        tad nl
        tls
        hlt
tos=      0 / top of stack
prt_msg,  pusham   / save the message address and clear AC/MQ
prt_loop, tad is tos
          sna
          ret 2       / null character, exit
          tpc         / else print the character
          isz s tos  / update pointer
          cla
          jmp prt_loop

/ decout - print decimal value , value to print in AC
decout,   mql    / save the number
          push   / push 0 onto stack to end print
          mqa    / see if negative
          sma 
          jmp deco_pos / positive number
          cma iac  / make positive
          mql   / update number
          tad minus / print minus
          tls    / print
deco_pos, cla
deco_lp1, dvi   / divide by 10 to get least digit
          10
          tad dec_asc0  / make printable
          push          / push onto stack
          mqa           / get quotient
          sza cla       / quotient zero?
          jmp deco_lp1 / no, keep dividing
deco_lp2, pop          / else print all the digits
          sna          / value 0?
          ret        / yes, exit
          tls        / no, print digit
          jmp deco_lp2 / next digit
minus,    '-'
dec_asc0, '0'


dec_n0,   -'0'
dec_n10,  -10
iprtmsg, prt_msg

/ offsets for decimal input
dec_flag= 0     / flag,
dec_digit=  1    / current digit

/ input decimal number 
/ 
dec_minus, -'-'
dec_negnl, -'\n'
decin,    enter 2       / make space for minus flag, and digit
	  dca s dec_flag  / clear flag
          mql         / clear multipler quotient
          krb          / read first digit
          dca s dec_digit / save it
          tad dec_minus / minus sign?
          tad s dec_digit
          sza cla     
          jmp deci_lp  / no, positive
          iac          / yes, set flag for negate
          dca s dec_flag
          tad dec_asc0
          dca s dec_digit / replace minus with leading zero
deci_lp,  tad dec_negnl / newline?
          tad s dec_digit
          sza cla
          jmp deci_cont / no, add digit
          tad s dec_flag   / exit, but should negate number?
          sna cla    
          jmp deci_ret  / no, just leave
          mqa          / get value
          cma iac      / negate
          mql          / update
deci_ret, leave 2 / get remove other parameters
          cla
          mqa   / get answer
          ret
deci_cont, tad s dec_digit  / get ascii digit
          tad dec_n0  / make into a value
          dca s dec_digit
          tad dec_n10   / in range?
          tad s dec_digit
          spa cla 
          jmp deci_m10 / yes, add to number
          tad dec_errin / no, print error and leave
          jms i iprtmsg  / print messag
          jmp deci_ret 
deci_m10, muy  / multiply by 10
          10
          mqa   / get answer
          tad s dec_digit / add digit
          mql  / update number
          krb         / get next digit
          dca s dec_digit
          jmp deci_lp

dec_errin, "Bad digit\n\0"

prompt1, "Input range of values to sum:  \0"
prompt2, "Sum is: \0"