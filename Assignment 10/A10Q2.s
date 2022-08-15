.data
array : .space 60
output_msg0:.asciiz "\nAnswer: "
input_msg0:	.asciiz "Enter n: "
input_msg1:	.asciiz "\nEnter floating point number: "
.text
.globl main
main:
	li $v0, 4
	la $a0, input_msg0
	syscall

	li $v0, 5
	syscall

	addi $t5,$v0,-1
	sll $t5,$t5,2 
	add $s1, $v0, $0
	add $t1, $s1, $0
	sub.s $f1, $f1, $f1
	li $t4,0
	add $t4, $0, $0
	la $t3,array
	add $t3,$t3,$t5
loop:
	li $v0, 4
	la $a0, input_msg1
	syscall

	li $v0, 6
	syscall
	swc1 $f0,0($t3)
	addi $t3,$t3,-4  		
	andi $t2, $t4, 1
	beq $t2, $0, add_iteration 	
	sub.s $f1, $f1, $f0 			
	j loop1
add_iteration:
	add.s $f1, $f1, $f0
loop1:
	addi $t4, $t4, 1
	bne $t1, $t4, loop
	li $v0, 4
	la $a0, output_msg0
	syscall
	li $v0, 2
	mov.s $f12, $f1
	syscall
	jr $ra