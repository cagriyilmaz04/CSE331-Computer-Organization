.data
inputMessage: .asciiz "Enter a value "
.text
main:

li $v0,4
la $a0, inputMessage
syscall

li $v0,5
syscall
move $a1, $v0

jal getSquare
move $t0,$v0

li $v0,1
addi $a0,$t0,0
syscall

li $v0,10
syscall




getSquare:
mult $a1, $a1
mflo $v0
jr $ra
