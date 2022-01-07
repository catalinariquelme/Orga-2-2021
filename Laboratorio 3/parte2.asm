#FIBONACCI
#Se calcula el n-esimo numero de la sucesion de Fibonacci a traves de la memorizacion
.data 
	messageInput: .asciiz "Numero para encontrar su valor de Fibonacci: "
	arreglo: .word 0:40

.text
main:
	#Imprime en la pantalla solicitando el numero
	li $v0, 4
	la $a0, messageInput
	syscall
	
	#Se obtiene el numero	
	li $v0, 5
	syscall
		
	#La entrada es trasladada a $t2
	move $t2, $v0 
		
	move $a0, $t2
	move $v0, $t2
	la $a1, arreglo
	#Salta a la subruta fib
	jal fibonacci
	move $t3, $v0
		
	#Salta a la subruta print
	jal print
		
fib:
	#Se reserva espacio en el stack pointer
	addiu $sp, $sp, -12 
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $s0, 8($sp)
		
	#Casos base
	beqz $a0, fibReturn0		#Si n = 0
	beq $a0, 1, fibReturn1		#Si n = 1
		
	#Caso base (en caso de ya haber sido calculado)
	sll $t0, $a0, 2 
	addu $t0, $t0, $a1 
	lw $v0, 0($t0) 
	bnez $v0, fibArr		#Si es dintinto a cero, significa que ya se conoce
		
	#Fibonacci
	sub $a0, $a0, 1			#n -> (n-1)
	jal fib
	move $s0, $v0
	lw $a0, 4($sp)
	sub $a0, $a0, 2 		#n -> (n-2)
	jal fib
	add $v0, $v0, $s0 
		
	#Se almacena el valor calculado
	lw $a0, 4($sp)
	sll $t0, $a0, 2
	addu $t0, $t0, $a1
	sw $v0, 0($t0) 
		
	#Restablece datos
	lw $s0, 8($sp)
	lw $ra, 0($sp)
	addiu $sp, $sp, 12
	jr $ra

#Retorna 0
fibReturn0:
	#Restablece datos
	lw $s0, 8($sp) 
	lw $ra, 0($sp)
	addiu $sp, $sp, 12
	li $v0, 0 
	jr $ra 

#Retorna 1	
fibReturn1:
	#Restablece datos
	lw $s0, 8($sp)
	lw $ra, 0($sp)
	addiu $sp, $sp, 12
	li $v0, 1
	jr $ra
		
fibArr:
	#Restablece datos
	lw $s0, 8($sp)
	lw $ra, 0($sp)
	addiu $sp, $sp, 12
	jr $ra
	
#Imprime en la pantalla el resultado y termina la ejecución
print:		
	move $a0, $v0
	li $v0, 1
	syscall
	#Finaliza el programa
	li $v0, 10
	syscall
	
		
