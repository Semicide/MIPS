##########################################
#
#for (i=0; i<n; i++)
#      x+=y
#
##########################################
	.data
	x:	.word 3
	y:	.word 5
	n:	.word 10
.text
	.globl main
main:
	lw $s0, x	 # load value stored at x into $s0
	lw $s1, y	 # load value stored at y into $s1
	lw $s2, n	 # load value stored at n into $s2
	sub $t0, $t0, $t0	#making sure $t0 is 0 $t0 is now our i
	j LOOP
	
LOOP:
	slt $t1, $t0, $s2	#check the condition if false give t1 zero
	beq $zero, $t1, EXIT	#if zero go to EXIT
	add $s0, $s0, $s1	#x+=y
	addi $t0, $t0, 1	#i++
	j LOOP
EXIT:
	add $a0, $zero, $s0
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now