.data
returnedValue: .asciiz " Value(s) Found " 
firstStr: .asciiz "\nArray Size:"
secondStr: .asciiz "Divisible: "
thirdStr: .asciiz "Array element: "

newLine: .ascii "\n"
.align 4
Divisible: .space 4
number: .space 4
arr: .space 400
warning : "Error\n"
  .align 4
arraySize: .space 4

space: .ascii "...."
.text

	
.globl main


	
main:

firstCondition:		
     li $v0, 4      
     la $a0, firstStr
     syscall
     li $v0, 5			
     syscall
     sw $v0, arraySize    		
     lw $t1, arraySize	
     li $t2, 100

     ble $t1, $t2, nestedIf
     j firstCondition
  nestedIf:
  li $t3,2
  	bge $t1, $t3 , goOn
  	li $v0, 4      
    la $a0, warning
    syscall
  j firstCondition
  	    
   goOn: 
    li $v0, 4
    la $a0, secondStr
    syscall
    
    li $v0, 5				
    syscall
    sw $v0, Divisible	
    lw $t7, Divisible	
  	
  
    
     ble $t7, $t2, secondNested
     li $v0, 4      
    la $a0, warning
    syscall
     j goOn
  secondNested:
  	li $t3,1
  	bge $t7, $t3 , secondCondition
  	li $v0, 4      
    	la $a0, warning
    	syscall
  j goOn
    
       		
  secondCondition:		
       la $t2, arr   
    input_loop: 	
    	li $v0, 4
    	la $a0, thirdStr			
    	syscall
    	li $v0, 5
    	syscall
    	sw $v0, number	
    	lw $t7, number
    	li $t6, 100	
    	ble $t7, $t6, loopNested
     	li $v0, 4      
    	la $a0, warning
    	syscall
     	j input_loop
  loopNested:
  	li $t3,1
  	bge $t7, $t3 , loopCondition
  	li $v0, 4      
    	la $a0, warning
    	syscall
  j input_loop
   loopCondition :					
    	sw $v0, 0($t2)			
    	addi $t2, $t2, 4		
    	addi $t0, $t0, 1		
    	bne $t0, $t1, input_loop	
 	addi $t3, $t3, 0
 	addi $t4, $t4, 0
 	lw $t5, arraySize
 	addi $t5, $t5, -1
 	addi $a1, $a1,0
 	addi $t6, $t6,0
 	li $t3,0
 	li $t7,0
 	lw $a0, arraySize
 	lw $a1, arr
 	lw $a2, Divisible
 	
 	jal divisibleSumPairs
 	
	li $v0, 1
	addi $a0, $v1, 0
 	syscall
 	li $v0, 4	
    	la $a0, returnedValue
    	syscall
 
 	li $v0,10
	syscall
 	

 
		
		
divisibleSumPairs:
	li $t5,0
	addi $t5,$a0,-1
	addi $t7, $a2,0
	addi $t8,$t8,0
	firstLoop: beq $t3, $t5, Exit  #first Loop 
	
		li $t6,0
		addi $t6,$t3,0
		addi $t6, $t6,1
		li $s2 , 0
	
secondLoop:		beq $t6, $t1, temp  #secondLoop
	
			sll $s3,$t6,2
			lw $s4, arr($s3)
			
			
			sll $s2, $t3,2  #shift and find the instruction 
			lw $s5, arr($s2) #load register
			
			addi $t6,$t6,1
			add $s1, $s4,$s5
			 div $s1, $t7
			
			 mfhi $t9
			 	 
			 bne $t9,$zero, go #compare
			 addi $t8,$t8,1
			 li $v0, 1
			 addi $a0, $s5,0
			 syscall 
			 li $v0, 4 #print
   			 la $a0, space
    			 syscall
			 li $v0, 1  #print
			 addi $a0, $s4,0
			 syscall	 
			 li $v0, 4
    	        	 la $a0, newLine
    	        	 syscall
go:			
			j secondLoop		
temp:		
		li $s3,0
		li $t6,0
		addi $t3,$t3, 1
		j firstLoop
Exit:
 		
		addi $v1, $t8,0
		jr $ra
