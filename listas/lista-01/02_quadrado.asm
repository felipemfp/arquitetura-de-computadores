setup:
  addi $1, $0, -88
  
main:
  slt $2, $0, $1
  beq $2, $0, exit
  j calculate

calculate:
  mul $3, $1, $1
  j exit

exit:
  nop