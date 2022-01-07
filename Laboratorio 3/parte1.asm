#FIBONACCI
#Se calcula el n-esimo numero de la sucesion de Fibonacci

.data
	messageInput: .asciiz "Numero para encontrar su valor de Fibonacci: "
.text
main:
	#Imprime en la pantalla solicitando el numero
	li $v0, 4
	la $a0, messageInput
	syscall
	
	#Se obtiene el numero	
	li $v0, 5
	syscall
		
	#La entrada es trasladada a $a0
	move $a0, $v0 
	
	#Salta a la subruta fib
	jal fib
	move $a0, $v0
	
	#Salta a la subruta print
	jal print

#Subruta recursiva	
fib:	
       	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	addiu $s0, $a0, 0
	#Caso base
	beq $0, $s0, done	#Si $s0 == 0 se salta a la subruta done
	addiu $t0, $0, 1
	#Caso base
	beq $t0, $s0, done	#Si $s0 == 1 se salta a la subruta done
	
	sub $a0, $s0, 1		#n -> n-1
	jal fib			#Vuelve a la subruta fib
	addiu $s1, $v0, 0
	sub $a0, $s0, 2		#n-> n-2
	jal fib			#Vuelve a la subruta fib
	addu $v0, $v0, $s1
	j finish
	
done:	
        addu $v0, $0, $s0
	j finish
	
finish: 
       	lw $s1, 8($sp)
	lw $s0, 4($sp)
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
