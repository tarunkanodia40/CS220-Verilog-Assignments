.data
array:		.space 100
input_msg0:	.asciiz "Enter n: "
input_msg1:	.asciiz "\nInput sorted array in ascending order"
input_msg2:	.asciiz "\nInput number: "
input_msg3:	.asciiz "\nEnter number to search: "
output_msg0:.asciiz "\nFound element at index: "
output_msg1:.asciiz "\nElement not found"

.text
.globl main
main:
        li $v0, 4
        la $a0, input_msg0
        syscall
        li $v0, 5
        syscall
# $s0 stores n
        move $s0,$v0
        li $v0, 4
        la $a0, input_msg1
        syscall
        move $t0, $s0
# $s1 stores array_addr
        la $s1,array
        add $t1, $s1, $0
input_loop:
        li $v0, 4
        la $a0, input_msg2
        syscall
        li $v0, 5
        syscall
        sw $v0, 0($t1)
        addi $t1, $t1, 4
        addi $t0, $t0, -1
        bne $t0, $0, input_loop
        li $v0, 4
        la $a0, input_msg3
        syscall
        li $v0, 5
        syscall
# $s2 stores k
        move $s2, $v0
        move $a0, $s1
        move $a1,$0
        move $a2, $s0
        move $a3, $s2
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        jal binary_search
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        move $a0, $v0
        slt $t0,$a0,$0
        bne $t0,$0,out_of_bound
        slt $t0,$a0,$s0
        beq $t0,$0,out_of_bound
        sll $t0,$a0,2
        add $t0,$s1,$t0
        lw $t0,0($t0)
        bne $t0,$s2,out_of_bound
        move $t0,$a0
        la $a0,output_msg0
        li $v0,4
        syscall
        move $a0,$t0
        addi $v0, $0, 1
        syscall
        jr $ra
out_of_bound:
        li $v0, 4
        la $a0, output_msg1
        syscall
        jr $ra

# binary_search function
# $a0 has array_address
# $a1 has low
# $a2 has high
# $a3 has k
binary_search:
# check if no element in array slice
        sltu $t0, $a2, $a1
        beq $t0, $0, case0
        addi $v0, $0, -1
        jr $ra  
case0:
        add $t0, $a1, $a2
        srl $t0, $t0, 1
        sll $t1, $t0, 2
        add $t1, $a0, $t1
        lw $t1, 0($t1)
        bne $t1, $a3, case1
        add $v0, $t0, $0
        jr $ra
case1:
        sltu $t1, $a3, $t1
        beq $t1, $0, case3
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        beq $0,$t0,case2
        addi $a2, $t0, -1
        jal binary_search
case2:
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        add $v0, $v0, $0
        jr $ra
case3:
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        addi $a1, $t0, 1
        jal binary_search
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        add $v0, $v0, $0
        jr $ra