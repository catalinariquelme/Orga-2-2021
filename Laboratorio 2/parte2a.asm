#MULTIPLICACIÓN DE DOS ENTEROS (SUBRUTINAS)

.data

.text
main:
	#Se asigna el valor de la primera variable
	li $t0,7
	#Se asigna el calor de la segunda variable
	li $t1,3
	
	#Se salta a la subrutina mul_1
	jal mul_1
	
	#Imprime en la pantalla el resultado
	li $v0,1
	move $a0,$t2
   	syscall	
   	
   	#Termina la ejecución
	li $v0,10
   	syscall
		
mul_1:
	#La variable temporal $t2 se usa de contador, partiendo en 0
	li $t2,0
		
	loop:
		#En caso que la variable tempral $t0 tome el valor 0, se salta a back
		beqz $t0,back
		add $t2,$t2, $t1
		addi $t0,$t0,-1
		#Se regresa al loop
		b loop
			
	back:
		#Se regresa a main
		jr $ra
		
		
