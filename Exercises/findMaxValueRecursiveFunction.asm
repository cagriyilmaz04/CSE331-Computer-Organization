.data
arr: .space 80
.text
.globl main
main:
addi $t0, $zero,20
addi $t1, $zero,25
addi $t2, $zero,23
addi $t4, $zero,21
addi $a2, $zero,3
addi $t3, $zero,0
addi $t5, $zero,0

sw $t0, arr($t3)
addi $t3, $t3,4
sw $t1, arr($t3)
addi $t3, $t3,4
sw $t2, arr($t3)
addi $t3, $t3,4
sw $t4, arr($t3)

la $a3,arr

jal findMax
move $t4,$v0
li $v0,1
addi $a0,$t4,0
syscall

li $v0,10
syscall


findMax:
addi $sp, $sp, -8
lw $a1, 0($a3)
sw $ra, 4($sp)
sw $a1, 0($sp)
beq $a2, $zero,L1
addi $a2, $a2,-1
addi $a3,$a3,4
jal findMax
lw $a1, 0($sp)
lw $ra, 4($sp)
addi $a3, $a3,-4
addi $sp, $sp,8
bge $t6,$a1,go
move $v0,$a1
go:

jr $ra

L1:
addi $sp, $sp,8
addi $a0,$a0,4
lw $t6,0($sp)
lw $ra, 4($sp)
move $v0,$t6
jr $ra
