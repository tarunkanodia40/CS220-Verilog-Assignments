.data
array1: .space 100
array2: .space 100
comma: .asciiz ","
input_msg: .asciiz "Enter the number n: "	
ouput_msg: .asciiz "Result is:"
.text
.globl main

main:  # the main function which will take input for n and store n in $t0 permanently and make a  copy (i) in $t0
li $v0,4
la $a0,input_msg
syscall
li $v0,5
syscall
move $t0,$v0
move $t1,$t0
li $t2,0
store_array1: # this is first loop which takes float input and then stores it in array1 and finally readies another temporily copy to be used by next loop 
li $v0,6
syscall
swc1 $f0,array1($t2)
add $t1,$t1,-1
add $t2,$t2,4
bne $t1,0,store_array1
move $t1,$t0
li $t2,0
store_array2: # this is second loop which takes float input and then stores it in array2 and finally readies another temporily copy to be used by next loop
li $v0,6
syscall
swc1 $f0,array2($t2)
add $t1,$t1,-1
add $t2,$t2,4
bne $t1,0,store_array2
move $t1,$t0
li $t2,0
li $t3,0
mtc1 $t3,$f12 # this makes $f12 is 0
calculate: # this is last loop which reads current first array element in $f1 second array element in $f2 multiplies and keep result in $f2 and adds the result to $f12
lwc1 $f1,array1($t2)
lwc1 $f2,array2($t2)
mul.s $f2,$f2,$f1
add.s $f12,$f12,$f2
add $t1,$t1,-1
add $t2,$t2,4
bne $t1,0,calculate
li $v0,4 # this is output string followed by outputting the result
la $a0,ouput_msg
syscall
li $v0,2
syscall
jr $ra
