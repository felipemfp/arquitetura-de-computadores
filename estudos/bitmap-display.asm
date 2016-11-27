
.data
  pixel_width: .word 32
  pixel_height: .word 32
  display_width: .word 256
  display_height: .word 256  

.text
main:
  jal setup
  jal loop
  jal exit

setup:
  add $8, $0, $31
  
  lui $9, 0x1001
  li $10, 0xE74C3C
  lw $11, pixel_width
  lw $12, pixel_height
  lw $13, display_width
  lw $14, display_height
  div $11, $13, $11
  div $12, $14, $12
  li $13, 0
  li $14, 0
    
  add $31, $0, $8
  jr $31

loop:
  add $8, $0, $31
  
  li $13, 0 # linha
  li $14, 0 # coluna
  jal setpixel
  
  add $31, $0, $8
  jr $31

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