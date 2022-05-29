.data
comma: .asciiz ","
endline: .asciiz "\n"
msg: .asciiz "The even numbers are: "
vektori: .word 7 5 6 12 35 27
.text
.globl main
main:
	la $t9,vektori
	li $t0,0 #int i=0
	li $t1,6 #int i=6
	li $t2,2 #per pjesen i%2
	#print msg
	li $v0,4
	la $a0,msg
	syscall
loop:
	beq $t0,$t1,exit #testojme if(i==6) kce ne exit
	lw $t3,0($t9) #marrim vleren e antarit te pare te vargut e vendosim ne t3 pra t3=vektori[0]
	addi $t9,$t9,4 #inkrementojm antarin e vektorit meqense jane integer jan 4bajt dhe duhmi me rrit per 4
	div $t3,$t2 # arr[i]%2
	mfhi $s1 #ruajm mbetjen ne s1
	beq $s1,$zero,printNum #testojm mbetjen if(mbetja==0) go to printNum
	addi $t0,$t0,1 # i++
	j loop

printNum:
	#print integers
	li $v0,1
	move $a0,$t3
	syscall
	#print ","
	li $v0,4
	la $a0,comma
	syscall
	#print endline
	li $v0,4
	la $a0,endline
	syscall
	addi $t0,$t0,1
	j loop
exit:
	#perfundojm programin
	li $v0,10
	syscall
	