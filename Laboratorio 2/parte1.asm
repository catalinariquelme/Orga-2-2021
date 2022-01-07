#SUSTRACCIÓN Y PARIDAD

.data
	primerEntero: .asciiz "Por favor ingrese el primer entero: "
	segundoEntero: .asciiz "Por favor ingrese el segundo entero: "
	resultadoResta: .asciiz "La diferencia es:"
	resultadoImpar: .asciiz "(Impar)"
	resultadoPar: .asciiz "(Par)"
.text
	main:
		#-----SUSTRACCIÓN-----
		#Imprime en la pantalla solicitando el primer número
		li $v0,4
		la $a0,primerEntero
		syscall
	
		#Se obtiene el primer número
		li $v0,5
		syscall
	
		#Se mueve el primer número al registro temporal $t0
		move $t0,$v0
	
		#Imprime en la pantalla solicitando el segundo número
		li $v0,4
		la $a0,segundoEntero
		syscall
	
		#Se obtiene el segundo número
		li $v0,5
		syscall
	
		#Se mueve el primer número al registro temporal $t1
		move $t1,$v0
	
		#Se realiza la resta
		sub $t2,$t0,$t1
	
		#Se muestra por pantalla "La diferencia es:"
		li $v0, 4
		la $a0, resultadoResta
		syscall
	
		#Se muestra por pantalla el resultado de la resta
		li $v0,1
		move $a0,$t2
		syscall
	
		#-----PARIDAD-----
		#Se almacena el número 2 en una variable temporal
		li $t2,2
		
		#Se realiza la división entre resultado de la sustracción con el número 2
		div $t0,$t2
		
		#Se mueve el resto (almacenado en H1) a la variable temporal $t3
		mfhi $t3
		
		#En el caso que el resto almacenado en $t3 sea igual a 0 ($zero) se dirige a la etiqueta par
		beq $t3,$zero,par
		li $v0 4
		
		#En el caso que el resto almacenado en $t3 sea distinto a 0 ($zero) se muestra por pantalla (impar)
		la $a0 resultadoImpar
		syscall
		
		#Salto al término de la ejecución
		j fin
		
	par:
		#Se muestra por pantalla par
		li $v0 4
		la $a0 resultadoImpar
		syscall
		
	fin:
		li $v0,10
		syscall