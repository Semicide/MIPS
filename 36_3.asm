##########################################
#
#a[i]=a[i]+a[i+1]
#
##########################################

.data
array:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i:		.word 3

.text
	.globl main
main:
	la $s0, array         # load address of array into $s0
	lw $s1, i			#loads i into $s1
	sll $t0, $s1, 2       # $t0 = i * 4
	add $s2, $s0, $t0     # array[i] = $s0 + $t0
	lw $a1, 0($s2)        # $a0 = array[i]
	addi $s3, $s1, 1	  # $s3=i+1
	sll $t1, $s3, 2       # $t1 = (i+1) * 4
	add $s4, $s0, $t1    # array[i] = $s0 + $t1 a[i]+a[i+1]
	lw $a2, 0($s4)        # $a0 = array[i]
	add $t2, $a1, $a2	# $t2 now holds 
	
	add $a0, $zero, $t2	#puts $t0 value to $a0 in order to print it
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
	