#FACTORIAL NÚMERO ENTERO

.data
	#Número a cálcular factorial
	numero: .word 4
	#Dirección
	direccion: .word 1
	
.text
	#Se indica la dirrección
	la $t0,direccion
	#Se indica la dirección donde se encuentra el número
	la $t1,numero
	#Se asigna el número
	lw $t1,0($t1)
	
	#La variable temporal $t2 funcionará como contador, partiendo en 1
	addi $t2,$zero,1
	
	#Para el caso de ser 0! y 1!, se almacena 1 en la variable temporal $t4
	li $t4,1
	
	#En caso de ser 0! y 1!, salta a la subrutina special_case
	ble $t1,1,special_case
	
	#Se salta a la subrutina mul_1, de ser diferente a 0! y 1!
	jal mul_1
	
	#Se almacena el resultado de la multiplicación
	sw $t2,0($t0)
	#Se le resta 1 a la variable temporal $t1 (número)
	addi $t1,$t1,-1
	#En el caso de ser diferente de 0 se repite el proveso
	bne $t1,$zero,mul_1
	
	#Imprime en la pantalla el resultado
	move $a0,$t2
	li $v0,1
	syscall
	
	#Termina la ejecución
	li $v0,10
	syscall
	
special_case:
	move $a0,$t4
	li $v0,1
	syscall
	
	#Termina la ejecución
	li $v0,10
	syscall	

mul_1:
	#La variable temporal $t3 se usa de contador, partiendo en 0
	li $t3,0
		
	loop:
		#En caso que la variable tempral $t2 tome el valor 0, se salta a back
		beqz $t2,back
		add $t3,$t3, $t1
		addi $t2,$t2,-1
		#Se regresa al loop
		b loop
		
back:
	move $t2,$t3
	#Se regresa a main
	jr $ra	

