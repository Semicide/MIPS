##########################################
# while (array[i] < n)
#      i++;
##########################################

.data
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
i:		.word 0
n:		.word 8

.text
	.globl main
main:
	la $s0, array	# load address of array into $s0
	lw $s1, i	# load value stored at i into $s0
	lw $s2, n	# load value stored at n into $s1
LOOP:
	sll $t0, $s1, 2      # $t0 = i * 4
	add $t1, $s0, $t0    # array[i] = $s0 + $t0
	lw $t2, 0($t1)       # $t2 = array[i]
	slt $t1, $t2 , $s2    # if array[i] < n $t1=1 else $t1=0
	beq $t1, $zero, EXIT # if $t1=0 go to EXIT
	addi $s1, $s1, 1     # i++
	j LOOP
EXIT:
	add $a0, $zero, $s1
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall
	li $v0, 10          # Syscall number 10 is to terminate the program
	syscall             # exit now
