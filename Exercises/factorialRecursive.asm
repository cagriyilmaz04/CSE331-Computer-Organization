.data
inputMessage: .asciiz "Enter a value\n"
.text

.globl main

main:
li $v0,4
la $a0, inputMessage
syscall

li $v0,5
syscall
move $a0,$v0

jal factorial

move $a1, $v0
li $v0, 1 # System call code for print_int
move $a0, $a1 # Copy result to $a0
syscall

li $v0, 10
syscall

factorial:

addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)

slti $t1, $a0,1

beq $t1, $zero, exit1
addi $v0, $zero , 1
addi $sp, $sp,8
jr $ra
exit1: addi $a0, $a0,-1
jal factorial
lw $a0, 0($sp)
lw $ra, 4($sp)
addi $sp, $sp,8
mul $v0, $a0,$v0
jr $ra