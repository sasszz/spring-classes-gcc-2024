/ Lucie Chevreuil
/ Lab 4, CS 166
      *0100
	    jmp main
msg, "Sorted\n\0"
/ print the global array
p= 0
x= 2
prtary, enter 3
        cam
        tadam aarray
        dcam s p        / set up pointer
        dca s x         / set up counter
loop,   tad is p        / print number
        jms i adecout
        tad nl          / print newline
        tls
        cla
        isz s p
        isz s x
        tad s x
        cma iac
        tad size
        sza cla
        jmp loop
        ret 3            / remove 3 local words
adecout, decout
nl,     '\n'

array, 	12; 44; 3; 25; 67; 59; 8
size,   7
aarray, array

main,   jms prtary       / print the array
        tadam aarray     / get the address
        pusham           / push as a parm
        jms bsort
        popma            / remove parm
        cam
        tadam amsg
        jms i aprt_msg
        jms prtary       / print the array
        hlt
amsg, msg
aprt_msg, prt_msg
                         / bubble sort
                         /   pass it the address of the array
                         /   use global size for size
/ locals
ptr0= 0                  / pointer with 0, 1
ptr1= 2                  / pointer with 2, 3
index= 4
swapped= 5
temp= 6
pass= 7
                         / return 8, 9
                         / parm, ptr to ary
ary=  10                 / also take 11
SWAP= 07403	
bsort,  enter 8          / allocate ptrs and locals
        cla iac
        dca s pass       / pass = 1
do,     cam
        tadam s ary
        dcam s ptr0      / point to ary[index]
        tadam s ary
        dcam s ptr1
        isz s ptr1       / point to ary[index+1]
        cla              / set swapped to false
        dca s swapped
        dca s index      / set index to 0
for,    tad s index      / get index
        tad s pass       / make negative
        cma iac
        tad size         / index + pass < size?
        sna cla     
        jmp endfor       / no
        tad is ptr0      / get ary[index]
        cma iac          / make negative
        tad is ptr1      / ary[i] > ary[i + 1]?
        sma cla     
        jmp bump         / no
        cam
        tadam s ptr0
        SWAP
        iac             / swapped = true
        dca s swapped
bump,   isz s index     / index++
        isz s ptr0 
        isz s ptr1
        jmp for
endfor, isz s pass      / pass++
        tad s swapped   / swapped = true?
        sza cla
        jmp do          / yes
        ret 8           / remove locals and return
        
tos=      0             / top of stack
prt_msg,  pusham        / save the message address and clear AC/MQ
prt_loop, tad is tos
          sna
          ret 2         / null character, exit
          tpc           / else print the character
          isz s tos     / update pointer
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
dec_ws,   cam         / clear ac and multipler quotient
          krb          / read first digit
	  jms dec_chkws / see if it is ws
	  spa 
          jmp dec_ws    / yes, ws, skip by getting next char
          dca s dec_digit / save it
          tad dec_minus / minus sign?
          tad s dec_digit
          sza cla     
          jmp deci_lp  / no, positive
          iac          / yes, set flag for negate
          dca s dec_flag
          tad dec_asc0
          dca s dec_digit / replace minus with leading zero
deci_lp,  tad s dec_digit / ws?
	  jms dec_chkws
          sma cla
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
          tad adec_errin / no, print error and leave
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
/ Checks to see if AC has a white space char (ws)
/ if so, it returns with
dec_chkws, push       / save character
          tad s tos   / get it back
          tad dec_negsp  / space?
	  sna cla 
          jmp dec_chkx / yes, signal back
	  tad s tos   / is it a nl?
          tad dec_negnl 
          sna cla
          jmp dec_chkx / yes, signal back
          tad s tos    / is it a tab?
	  tad dec_negtab
          sza cla
          jmp dec_chkok / no, char is not ws
dec_chkx,  cla cll cml rar / put a 1 in upper bit
dec_chkok, tad s tos   / put char back into ac
	   ret 1      / remove char before returning
dec_negsp,   -' '      / negative space
dec_negtab, -'\t'    / negative tab
adec_errin, dec_errin
dec_errin, "Bad digit\n\0"

