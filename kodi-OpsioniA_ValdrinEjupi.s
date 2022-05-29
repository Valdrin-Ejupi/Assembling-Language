.data
hapsira:	.asciiz " "
.text
.globl main
main:
	li $t0,4 #int test=4
	li $t1,0 #int i=0
	li $t2,4 #int test2=4
	move $a0,$t0
	jal printFun
	addi $t0,$zero,1 #test=1
	jal printFun2

	#end of program
	li $v0,10
	syscall
printFun:
	addi $sp,$sp,-8 #lirojm stekun per 2 vlera ku njera do permbaj parametrin test,tjtra return adresen
	#per kthim ne main funksionin
	sw $ra,4($sp) #preferohet qe return adresa te ruhet ne pjesen e eperme ngase stack punon ne baze te LIFO(last in,first out)
	sw $t0,0($sp)
	bgt $t0,$t1,recurse #test if(test>0) ekzekutojm pjesen else te programit
	lw $ra,4($sp) #nxjerrim return adresen nga steku
	lw $t0,0($sp) #nxjerrim vleren t0 nga steku
	addi $sp,$sp,8#zbrazim stekun
	jr $ra #return to main
	
printFun2:
	addi $sp,$sp,-8
	sw $ra,4($sp)
	sw $t0,0($sp)
	ble $t0,$t2,recurse2 #testojm if(test<=4)
	lw $ra,4($sp)
	lw $t0,0($sp)
	addi $sp,$sp,8
	jr $ra #return ne main
	
recurse:
	#print integer
	li $v0,1
	move $a0,$t0
	syscall
	#print hapesira
	li $v0,4
	la $a0,hapsira
	syscall
	addi $t0,$t0,-1 #printFun(test-1)
	sw $t0,0($sp) #mbishkruajm vleren t0 ne stack
	j printFun
	
recurse2:
	#print integer
	li $v0,1
	move $a0,$t0
	syscall
	#print hapesira
	li $v0,4
	la $a0,hapsira
	syscall
	addi $t0,$t0,1
	sw $t0,0($sp)
	j printFun2
