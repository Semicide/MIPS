##########################################
#
# if (a[i] > 10)
#      i=i+1;
#
##########################################
.data
array:		.word 11, 12, 13, 14, 5, 6, 7, 8, 9, 10
index:		.word 1

.text
	.globl main	
main:
	la $s0, array       # load address of array into $s0
	lw $s1, index       # load value stored at index into $s1
	sll $t0, $s1, 2     # $t0 = index * 4
	add $s2, $s0, $t0   # array[index] = $t0 + $s0
	lw $a1, 0($s2)      # $a0 = array[index]
	slt $t1, $a1, 10    # if (10 < array[index]) $t1 = 1; else $t1 = 0;
	beq $zero, $t1, EXIT #if the statement over this is false jumps to exit part and adds 1 to our index and print it out
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now

EXIT:
	addi $s1, $s1, 1    # index = index + 1
	add $a0, $s1, $zero 
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
