procedure main()
; for running the program
  declare credit, playerMenuSelection, playerBet, betReturn
  input "How many dollars do you have? ", credit
  playerMenuSelection := 1
  while playerMenuSelection > 0 || playerMenuSelection < 4
    menu()
    input "Enter selection: ", playerMenuSelection
    if playerMenuSelection = 3
      printSelect(playerMenuSelection)
      return
    end if
    if playerMenuSelection = 1 || playerMenuSelection = 2
      printSelect(playerMenuSelection)
      input "Enter bet: ", playerBet 
      betReturn := doBet(playerMenuSelection, playerBet)
      print "Bet return is "
      print betReturn
      println " dollars"
      credit := credit + betReturn
      println "Credit now ", credit
    end if
  end while
  println "Invalid choice"
  return
end procedure

procedure menu()
; for printing the menu
  println "Tiny Gambling"
  println "1. Bet on coin toss (+bet heads, -bet tails)"
  println "2. Bet on die roll (+bet odd, -bet even)"
  println "3. Quit while you're ahead!"
end procedure

procedure printSelect(select) 
; for taking the menu selection and printing what it is
  if select < 1 || select > 3
    println "Invalid choice"
  end if
  if select = 1
    println "Bet on coin toss (+bet heads, -bet tails)"
  end if
  if select = 2
    println "Bet on die roll (+bet odd, -bet even)"
  end if
  if select = 3
    println "I give up and quit!"
  end if
end procedure


function doBet(select, bet)
    ; for taking select with bet and returning win (1) or lose (2)
    declare result
    if select = 1
      result := rand()%2+1
    end if
    if select = 2
      result := rand()%6+1
      result := result%2 + 1 
    end if
    if result = 2
      bet := 0 - bet
    end if
    return bet
end function