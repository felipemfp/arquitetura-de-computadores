main: 
	addi $1, $0, 1 # a
	addi $2, $0, -10 # b
	addi $3, $0, 24 # c
	addi $4, $0, 6 # x
	j calculate

calculate:
	mul $5, $4, $4 # x^2
	mul $5, $5, $1 # a * x^2
	mul $6, $2, $4 # b * x
	add $5, $5, $6 # a * x^2 + b * x
	add $5, $5, $3 # a * x^2 + b * x + c
	j set_if_root

set_if_root:
	seq $7, $5, 0
	nop 