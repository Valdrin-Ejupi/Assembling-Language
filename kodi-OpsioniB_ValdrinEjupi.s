.data
vektori: .word 10 324 45 90 9808
msg:	.asciiz "Largest in given array is "
.text
.globl main
main:
	la $t9,vektori #lodojm adresen e vektorit nga memoria
	li $t0,1 #int i=1
	li $t1,5 #int n=5
	lw $t2,0($t9) # int max=arr[0]
	
	#print msg
	li $v0,4
	la $a0,msg
	syscall

loop:
	beq $t0,$t1,exit  #if(i==n) kerce ne exit
	lw $t3,4($t9) #nxjerrim antarin e dyt nga vargu e vendosim ne t3 perndryshe t3=arr[1]
	addi $t9,$t9,4 #inkrementojm antarin e vargut
	bgt $t3,$t2,maximum #testojm if(arr[i]>max)
	addi $t0,$t0,1 #i++
	j loop
	
maximum:
	add $t2,$zero,$t3 #max=arr[i]
	addi $t0,$t0,1 #inkrementojm i
	j loop
exit:
	#print max
	li $v0,1
	move $a0,$t2
	syscall
	#perfundojm programin
	li $v0,10
	syscall
	