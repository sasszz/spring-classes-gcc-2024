          *0100
          jmp mloop
aprompt, prompt
adecin, decin
adecout, decout
aresult, result
arepeat, repeat
aprt_msg, prt_msg
mloop,    cam
          tadam aprompt
          jms i aprt_msg    / print the prompt
          jms i adecin   / input the number
          dca value / saving into variable
          cam
          tadam aresult
          jms i aprt_msg    / print the result msg
          tad value
          jms octal
          cam / clear acc and mq always do before tadam
          tadam arepeat    / ask if repeat?
          jms i aprt_msg
          krb            / get the character
          push
          krb / eat newline
          pop
          tad my         / add a minus 'y'
          sna
          jmp mloop      / yes! repeat!
          hlt            / no, done
value, .-. / set the variable
octal,    tad value      / add value to octal accumulator
          rtl
          rtl
          and mask
          tad digit      / 1st digit
          tls
          cla 
          tad value
          bsw             / swap 6-bit “bytes”, rotate of 6 bits
          and mask
          tad digit       / 2nd digit
          tls
          cla
          tad value
          rtr
          rar
          and mask
          tad digit      / 3rd digit
          tls
          cla
          tad value
          and mask
          tad digit      / 4th digit
          tls
	        ret
mask,     0007
digit,    '0'
my,       -'y'
prompt,   "\nNumber? \0"
result,   "Result is \0"
repeat,   "\nRepeat? \0"
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

