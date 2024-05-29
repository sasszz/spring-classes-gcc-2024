/ Lucie Chevreuil
/ Lab 4, CS 166

          *0100
          jmp main
numbers,  12; 6; 38; 34; 5; 29; 17
size,     7
anumbers, numbers
main,     cam
          tadam anumbers
          enter 2
          dcam s tos / put on top of stack
          jms print
          leave 2
          hlt

/ print the array
index= 0            / for loop index
ary= 3              / parm pointer to array
print,    cla       / set up index
          push
for,      tad s index       / check index < size
          cma iac           / make negative
          tad size
          sna cla           / exit?
          jmp forexit       / yes!
          tad is ary        / get the value
          jms decout        / print
          tad nl
          tls               / print newline
          isz s index       / increment index
          cla
          isz s ary
          jmp for
forexit,  ret 1               / remove index and return
nl,       '\n'
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

