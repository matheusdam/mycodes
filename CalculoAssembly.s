.data

mensagem:	.asciiz "Digite o 1 numero: "
mensagem2:	.asciiz "Digite o 2 numero: "
calcmul:	.asciiz "\nMultiplicacao: "
calcdiv:	.asciiz "\nDivisao: "
calcadd:	.asciiz "\nSoma: "
calcsub:	.asciiz "\nSubtracao: "
numero: 	.word 1
calculo: 	.word 1
		
	.text
	# imprime mensagem
main:	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
	add $s0,$zero,$v0	

	# imprime mensagem
	li $v0, 4 
	la $a0, mensagem2
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
	add $s1,$zero,$v0		
	
	# grava numero na memoria	
	sw $s0, numero
	sw $s1, numero
			
	# calcular multiplicacao
	mul $t0, $s0, $s1
	# calcular divisao
	div $t1, $s0, $s1
	# calcular adicao
	add $t2, $s0, $s1
	# calcular subtracao
	sub $t3, $s0, $s1

	# grava todos os calculos
	sw $t0, calculo
	sw $t1, calculo
	sw $t2, calculo
	sw $t3, calculo
		
	# imprime mensagem
	li $v0, 4 
	la $a0, calcmul
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	# imprime mensagem
	li $v0, 4 
	la $a0, calcdiv
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	# imprime mensagem
	li $v0, 4 
	la $a0, calcadd
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	# imprime mensagem
	li $v0, 4 
	la $a0, calcsub
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	jr $ra
	