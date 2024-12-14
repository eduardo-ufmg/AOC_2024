j main

add:
  lw $t0, 0($sp)    # carrega t0 da pilha
  lw $t1, 4($sp)    # carrega t1 da pilha
  addi $sp, $sp, 8  # reduz a pilha

  add $v0, $t0, $t1 # soma t0 e t1

  addi $sp, $sp, -4 # aumenta a pilha
  sw $v0, 0($sp)    # salva o resultado na pilha
jr $ra

negative:
  lw $t0, 0($sp)      # carrega t0 da pilha
  addi $sp, $sp, 4    # reduz a pilha

  sub $v0, $zero, $t0 # nega t0

  addi $sp, $sp, -4   # aumenta a pilha
  sw $v0, 0($sp)      # salva o resultado na pilha
jr $ra

diff:
  lw $s0, 0($sp)    # carrega s0 da pilha
  lw $s1, 4($sp)    # carrega s1 da pilha
  addi $sp, $sp, 8  # reduz a pilha

  addi $sp, $sp, -4 # aumenta a pilha
  sw $ra, 0($sp)    # salva ra na pilha

  addi $sp, $sp, -4 # aumenta a pilha
  sw $s1, 0($sp)    # salva s1 na pilha

  jal negative      # chama negative

  lw $s1, 0($sp)    # carrega o resultado da pilha
  addi $sp, $sp, 4  # reduz a pilha

  lw $ra, 0($sp)    # carrega ra da pilha
  addi $sp, $sp, 4  # reduz a pilha

  addi $sp, $sp, -4 # aumenta a pilha
  sw $ra, 0($sp)    # salva ra na pilha

  addi $sp, $sp, -8 # aumenta a pilha
  sw $s0, 0($sp)    # salva s0 na pilha
  sw $s1, 4($sp)    # salva s1 na pilha

  jal add           # chama add

  lw $v0, 0($sp)    # carrega o resultado da pilha
  addi $sp, $sp, 4  # reduz a pilha

  lw $ra, 0($sp)    # carrega ra da pilha
  addi $sp, $sp, 4  # reduz a pilhax

  addi $sp, $sp, -4 # aumenta a pilha
  sw $v0, 0($sp)    # salva o resultado na pilha
jr $ra

main:
  addi $sp, $sp, -16  # prepara a pilha para variáveis locais

  lw $t0, 0($sp)      # carrega t0 da pilha
  lw $t1, 4($sp)      # carrega t1 da pilha

  addi $sp, $sp, -8   # aumenta a pilha
  sw $t0, 0($sp)      # salva t0 na pilha
  sw $t1, 4($sp)      # salva t1 na pilha

  jal add             # chama add

  lw $t0, 0($sp)      # carrega o resultado da pilha
  addi $sp, $sp, 4    # reduz a pilha

  sw $t0, 8($sp)      # salva o resultado na pilha

  lw $t0, 0($sp)      # carrega t0 da pilha
  lw $t1, 4($sp)      # carrega t1 da pilha

  addi $sp, $sp, -8   # aumenta a pilha
  sw $t0, 0($sp)      # salva t0 na pilha
  sw $t1, 4($sp)      # salva t1 na pilha

  jal diff            # chama diff

  lw $t0, 0($sp)      # carrega o resultado da pilha
  addi $sp, $sp, 4    # reduz a pilha

  sw $t0, 12($sp)     # salva o resultado na pilha
j exit

exit:
  li $v0, 10
  syscall
# exit
