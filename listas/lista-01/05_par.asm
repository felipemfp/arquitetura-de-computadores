setup:
  addi $1, $0, 50  
  addi $4, $0, 2

main:
  rem $2, $1, $4
  beq $2, $0, is_even
  j is_odd

is_even:
  addi $3, $0, 1  
  j exit

is_odd:
  addi $3, $0, 0
  j exit

exit:
  nop