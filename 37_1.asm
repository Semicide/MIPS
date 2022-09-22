##########################################
#
# if (i<x);
#      i=x;
#	else i=y
##########################################

.data
x:		.word 6
y:		.word 3
i:		.word 2

.text
	.globl main
main:
	lw $s0, x       # load value stored at x into $s0
	lw $s1, y       # load value stored at y into $s1
	lw $s2, i       # load value stored at i into $s2
	slt $t0, $s2, $s0	#checks and stores if s0 is smaller than s2
	beq $zero, $t0, ELSE #if t0 is false(0) jump to ELSE
	sub $s2, $s2, $s2, 	#making sure that i is zero
	add $s2, $s0, $zero
	j EXIT	#jump to exit code
	
ELSE:
	sub $s2, $s2, $s2, 	#making sure that i is zero
	add $s2, $zero, $s1
	j EXIT	#jump to exit code

EXIT:
	add $a0, $zero, $s2
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall

	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
