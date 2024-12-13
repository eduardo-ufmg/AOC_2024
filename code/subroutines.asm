j main

add:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  addi $sp, $sp, 8

  add $v0, $t0, $t1

  addi $sp, $sp, -4
  sw $v0, 0($sp)
jr $ra

negative:
  lw $t0, 0($sp)
  addi $sp, $sp, 4

  sub $v0, $zero, $t0

  addi $sp, $sp, -4
  sw $v0, 0($sp)
jr $ra

diff:
  lw $t0, 0($sp)
  lw $t1, 4($sp)
  addi $sp, $sp, 8

  addi $sp, $sp, -4
  sw $t1, 0($sp)

  jal negative

  lw $t1, 0($sp)
  addi $sp, $sp, 4

  addi $sp, $sp, -8
  sw $t0, 0($sp)
  sw $t1, 4($sp)
  
  jal add

  lw $v0, 0($sp)
  addi $sp, $sp, 4

  addi $sp, $sp, -4
  sw $v0, 0($sp)
jr $ra

main:
  addi $sp, $sp, -16

  lw $t0, 0($sp)
  lw $t1, 4($sp)

  addi $sp, $sp, -8
  sw $t0, 0($sp)
  sw $t1, 4($sp)

  jal add

  lw $t0, 0($sp)
  addi $sp, $sp, 4

  sw $t0, 8($sp)

  addi $sp, $sp, -8
  sw $t0, 0($sp)
  sw $t1, 4($sp)

  jal diff

  lw $t0, 0($sp)
  addi $sp, $sp, 4

  sw $t0, 12($sp)
j exit

exit:
  li $v0, 10
  syscall
# exit
