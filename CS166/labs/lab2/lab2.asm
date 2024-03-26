/ Chevreuil Lab2 CS166
/ Updated 15 March 2024

	 *0100
         cam	
         tadam amenu
         jmp main
ch, 	.-. / signifies a variable
amenu,  menu
negc,   -'c'
nega,   -'a'
negs,   -'s'
negq,   -'q'
aerr,   err

main,   cam           / start of do loop
        tadam amenu   / print menu
 	jms prt_msg
        krb          / input char
        dca ch       
        krb          / eat the newline
        cla      
        tad ch       / is ch == 'c'?
        tad negc
        sna cla      
        jmp taskc    / yes, clear calculator
        tad ch       / is ch == 'a'?
        tad nega
        sna cla 
        jmp taska    / yes, begin adding, request number
        tad ch       / is ch == 's'?
        tad negs
        sna cla 
        jmp tasks    / yes, begin subtracting, request number
        tad ch       / quit?
        tad negq
        sna cla      
        hlt          / yes, stop
        cam
        tadam aerr
        jms prt_msg
        jmp main

number, .-.
aprompt1, prompt1
aprompt2, prompt2
taskc,  cam               / print prompt
        tadam aprompt2    / "number is:" prompt
        jms prt_msg
        cla               / clear calculator
        dca number
        jms decout
        jmp main
taska,  cam                / print prompt
        tadam aprompt1     / "number?" prompt
        jms prt_msg
        jms decin          / get number
        tad number         / add number
        dca number
        cam                / print prompt
        tadam aprompt2     / "Number is:" prompt
        jms prt_msg
        tad number
        jms decout
        jmp main
tasks,  cam                / print prompt
        tadam aprompt1     / "number?" prompt
        jms prt_msg
        jms decin          / get number
        cma iac            / make it negative
        tad number         / add number
        dca number
        cam                / print prompt
        tadam aprompt2     / "Number is:" prompt
        jms prt_msg
        tad number
        jms decout
        jmp main
tos=      0                / top of stack
prt_msg,  pusham           / save the message address and clear AC/MQ
prt_loop, tad is tos
          sna
          ret 2            / null character, exit
          tpc              / else print the character
          isz s tos        / update pointer
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

menu, 	"\n q. quit, c. clear, a. add, s. subtract\n"
          "Enter selection: \0"
prompt1, "Number?: \0"
prompt2, "Number is: \0"
err,     "Invalid selection\n\0"
