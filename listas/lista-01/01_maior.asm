main:
  addi $1, $0, 80
  addi $2, $0, 40
  slt $4, $1, $2
  beq $4, $0, show_a
  j show_b

show_a:
  add $3, $0, $1
  j exit

show_b:
  add $3, $0, $2
  j exit 

exit:
  nop
