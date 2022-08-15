.data
array: .space 10000  #For calculating fib(n), atleast 4*(n+1) bytes to be allocated here.
comma: .asciiz ","
input_msg: .asciiz "Enter the number: "	
ouput_msg: .asciiz "The fibonacci numbers are:"
.text
.globl main

main:
#Input n
li $v0,4
la $a0,input_msg
syscall
li $v0,5
syscall

move $a0,$v0
move $s6,$v0
addiu $s6,$s6,1
la $a1 array
addiu $sp,$sp,-4
sw $ra,0($sp)
#call fib(n)
jal fib
lw $ra 0($sp)
addiu $sp,$sp,4

li $s5,1
la $s3 array
sw $s5, 4($s3)
sw $s5, 8($s3)
addiu $s3,$s3,4
li $v0,4
la $a0,ouput_msg
syscall
#Printing result
loop:

li $v0,1
lw $a0,0($s3)
syscall
li $v0,4

addiu $s5,$s5,1
addiu $s3,$s3,4
slt $t0,$s5,$s6
beq $t0,$0,exit
la $a0,comma
syscall
bne $t0,$0,loop
exit: jr $ra

fib:
addiu $sp , $sp , -12
sw $ra , 0 ($sp) 
sw $a0 , 4 ($sp) 
sw $s0 , 8 ($sp)
addiu $t5, $0, 1 
# if n=1 return 1
beq $a0 , $t5 , ReturnOne
addiu $t0 , $0 , 0
slti $t0 , $a0 , 3
#if n=2 return 1 
bne $t0 , $0 , ReturnOne

#if fib(n) is already computed, return computed value
sll $t0 , $a0 , 2 
addu $t0 , $t0 , $a1 
lw $v0 , 0 ($t0)
bne $v0 , $0 , ReturnComputed
#If control reaches here,compute fib(n) by calling fib(n-1) and fib(n-2)
addiu $a0 , $a0 , -1
jal fib
move $s0 , $v0
lw $a0, 4($sp)
#call fib(n-2)
addiu $a0 , $a0 , -2
jal fib
addu $v0 , $v0 , $s0  #fib(n) = fib(n-1) + fib(n-2)

lw $a0 , 4 ($sp) 
sll $t0 , $a0 , 2 
addu $t0 , $t0 , $a1
# array[n]=fib(n), so that it does not have to be computed again
sw $v0 , 0($t0)

lw $s0 , 8 ($sp)
lw $ra , 0 ($sp)
addiu $sp , $sp , 12
jr $ra #Return to main function

ReturnOne:

lw $s0 , 8 ($sp)
lw $ra , 0 ($sp)
addiu $sp , $sp , 12
li $v0 , 1
jr $ra

ReturnComputed: 

lw $s0 , 8($sp)
lw $ra , 0($sp)
addiu $sp , $sp , 12
jr $ra