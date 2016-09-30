main:
  addi $1, $0, 20
  addi $2, $0, 40
  slt $4, $1, $2
  beq $4, $0, show_a
  j show_b

show_b:
  add $3, $0, $2
  nop 

show_a:
  add $3, $0, $1
  nop

