.data
arr: .space 80  #make an array size of 20
inputMessage: .asciiz "Enter a value for array size: "
itemMessage: .asciiz "Enter a value for item in array: "


.text
.globl main

main:

li $v0,4
la $a0, inputMessage
syscall

li $v0,5
syscall
move $t1, $v0

addi $t2, $zero,0
addi $t4, $zero,0


loop:
 beq $t1, $t2, exit1
 li $v0,4
 la $a0, itemMessage
 syscall
 
 li $v0,5
 syscall
 move $t3, $v0
 
 addi $t2, $t2,1
 sw $t3, arr($t4)
 addi $t4, $t4,4

 j loop
 
 exit1:
 
 li $t2, 0
 li $t4, 0
 
  print:
  beq $t1,$t2, outOfPrint
  lw $t5, arr($t4)
  li $v0,1
  addi $a0,$t5,0
  syscall
  addi $t4,$t4,4
  addi $t2,$t2,1
  j print 

outOfPrint:

li $v0,10
syscall




