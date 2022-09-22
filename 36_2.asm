##########################################
# f=g-h
##########################################
.data
g:		.word 126
h:		.word 85

.text
	.globl main
main:
	lw $s0, g	#loads g into $s0
	lw $s1, h	#loads h into $s1
	sub $t0, $s0, $s1 	#f=g-h
	add $a0, $zero, $t0	#puts $t0 value to $a0 in order to print it
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
	