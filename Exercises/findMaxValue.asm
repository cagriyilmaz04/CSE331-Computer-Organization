.data
arr: .space 80
inputMessage: .asciiz "Enter a value for size\n"
valMessage: .asciiz "Enter a value\n"
.text
.globl main

main:

li $v0,4
la $a0, inputMessage
syscall

li $v0,5
syscall
move $a1,$v0

addi $t0, $zero,0
addi $t1, $zero,0

jump:
beq $t0, $a1, exit1

li $v0,4
la $a0, valMessage
syscall
li $v0,5
syscall
move $s1, $v0
sw $s1, arr($t1)
addi $t1,$t1,4
addi $t0,$t0,1
j jump
exit1:

lw $s2, arr($zero)
li $t0,0
li $t1, 0
jump1:
beq $t0, $a1, exit2
lw $s3, arr($t1)
ble $s3, $s2, continue
move $s2, $s3
addi $t1,$t1,4
addi $t0, $t0,1
j jump1
continue:
addi $t1,$t1,4
addi $t0, $t0,1
j jump1

exit2:
li $v0,1
addi $a0, $s2,0
syscall

li $v0,10
syscall