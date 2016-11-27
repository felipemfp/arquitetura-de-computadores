
.data
  pixel_width: .word 32
  pixel_height: .word 32
  display_width: .word 256
  display_height: .word 256
  display: .word 0x10010000
  keyboard: .word 0xffff0000

.text
main:
  jal setup
  jal loop
  jal exit

setup:
  add $8, $0, $31
  
  lw $7, keyboard
  lw $9, display
  li $10, 0xE74C3C
  lw $11, pixel_height
  lw $12, pixel_width
  lw $13, display_height
  lw $14, display_width
  div $11, $13, $11
  div $12, $14, $12
  li $13, 0
  li $14, 0
  li $15, 0
    
  add $31, $0, $8
  jr $31

loop:
  add $8, $0, $31
  
  lw $16, 0($7)  
  beq $16, 1, mover
  
  li $10, 0xE74C3C  
  jal setpixel  
  
  bne $15, 1, loop
  
  add $31, $0, $8
  jr $31

mover:
  lw $17, 4($7)
  li $10, 0x000000
  jal setpixel
  beq $17, 119, up
  beq $17, 97, left
  beq $17, 100, right
  beq $17, 115, down

left:
  subi $14, $14, 1
  j loop

right:
  addi $14, $14, 1
  j loop

up:
  subi $13, $13, 1
  j loop

down:
  addi $13, $13, 1
  j loop
  

setpixel:  
  mul $15, $13, $11
  add $15, $15, $14 
  mul $15, $15, 4
  add $15, $15, $9
  
  sw $10, 0($15)
  jr $31

exit:
  li $2, 10
  syscall