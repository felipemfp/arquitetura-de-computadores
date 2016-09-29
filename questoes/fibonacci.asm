main:
  addi $1, $0, 0
  addi $2, $0, 1
  addi $3, $0, 13 # n-ésimo número da sequência
  addi $5, $0, 2 # controle
  j n_fibonacci

n_fibonacci:
  add $4, $1, $2
  add $1, $0, $2
  add $2, $0, $4
  addi $5, $5, 1
  bne $3, $5, n_fibonacci
  nop
  